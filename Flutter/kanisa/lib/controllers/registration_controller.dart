import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kanisa/Network/Apis.dart';
import 'package:kanisa/Utils/util.dart';
import 'package:kanisa/controllers/dimension_controller.dart';
import 'package:kanisa/models/account_model.dart';
import 'package:kanisa/models/dimensions.dart';

class RegistrationController extends GetxController {
  final Customer? initialCustomer;
  
  // Form controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController baptismDateController = TextEditingController();
  final TextEditingController baptizedByController = TextEditingController();
  final TextEditingController otherInformationController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  
  // Observable values
  final RxBool isConfirmed = false.obs;
  final RxBool isBaptized = false.obs;
  final Rx<gender?> selectedGender = Rx<gender?>(null);
  
  RegistrationController({this.initialCustomer}) {
    if (initialCustomer != null) {
      loadCustomerData(initialCustomer!);
    }
  }
  
  @override
  void onInit() {
    super.onInit();
  }
  
  @override
  void onClose() {
    // Dispose controllers to prevent memory leaks
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    occupationController.dispose();
    baptismDateController.dispose();
    baptizedByController.dispose();
    otherInformationController.dispose();
    dateOfBirthController.dispose();
    super.onClose();
  }
  
  void loadCustomerData(Customer customer) {
    nameController.text = customer.Name ?? '';
    phoneController.text = customer.Phone_No ?? '';
    emailController.text = customer.E_Mail ?? '';
    occupationController.text = customer.Occupation ?? '';
    isConfirmed.value = customer.Confirmed ?? false;
    isBaptized.value = customer.Baptism_Date != null;
    baptizedByController.text = customer.Baptised_by ?? '';
    selectedGender.value = customer.Gender;

    if (customer.Baptism_Date != null) {
      baptismDateController.text = formattedDDMM.format(customer.Baptism_Date!); // Format as YYYY-MM-DD
    }
    
    if (customer.Date_of_Birth != null) {
      dateOfBirthController.text = formattedDDMM.format(customer.Date_of_Birth!); // Format as YYYY-MM-DD
    }
 
    // Load district
    Get.find<DimensionController>().districtDimensions.forEach((element) {
      if (element.Code == customer.Global_Dimension_1_Code) {
        Get.find<DimensionController>().selectedDistrictDimension.value = element;
      }
    });
    Get.find<DimensionController>().selectedGroupDimensions.clear();
    // Load groups
    Get.find<DimensionController>().groupDimensions.forEach((element) {
      if (customer.MembersGroups?.any((member) => member.Global_Dimension_2_Code == element.Code) ?? false) {
        Get.find<DimensionController>().selectedGroupDimensions.add(element);
      }
    });

  }
  
  // Format group names for display while preserving original case in data
  String formatGroupName(String name) {
    if (name.isEmpty) return name;
    
    // Split by spaces, underscores, or hyphens
    List<String> words = name.split(RegExp(r'[\s_-]+'));
    
    // Capitalize first letter of each word, lowercase the rest
    words = words.map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + (word.length > 1 ? word.substring(1).toLowerCase() : '');
    }).toList();
    
    // Join with spaces
    return words.join(' ');
  }
  
  bool validateForm() {
    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Name is required', backgroundColor: Colors.red);
      return false;
    }
    
    if (phoneController.text.isEmpty) {
      Get.snackbar('Error', 'Phone number is required', backgroundColor: Colors.red);
      return false;
    }
    
    if (selectedGender.value == null) {
      Get.snackbar('Error', 'Please select your gender', backgroundColor: Colors.red);
      return false;
    }
   
    return true;
  }
  
  static Customer mockRegistration() {
    return Customer(
      No: '${DateTime.now().millisecondsSinceEpoch}',
      Name: 'John Doe',
      Phone_No: '1234567890',
      E_Mail: 'johndoe@example.com',
      Occupation: 'Software Engineer',
      Confirmed: true,
      Date_of_Birth: DateTime.now().subtract(Duration(days: 365 * 25)).toUtc().copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0),
      Gender: gender.Male,
      Global_Dimension_1_Code: 'BRIGADE',
      // Only include baptism information if the user is baptized
      Baptism_Date: DateTime.now().subtract(Duration(days: 365 * 5)).toUtc().copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0),
      Baptised_by: 'Pastor Smith',
      Other_Information: 'No additional information',
      MembersGroups: [
        MemberGroups(
          Global_Dimension_2_Code: 'Adults',
        ),
      ],
    );
  }
  
  Future<Customer?> submitForm() async {
    if (!validateForm()) {
      return null;
    }
    
    try {
      Customer customerData = Customer(
        Name: nameController.text,
        Phone_No: phoneController.text,
        E_Mail: emailController.text,
        Occupation: occupationController.text,
        Confirmed: isConfirmed.value,
        Date_of_Birth: dateOfBirthController.text.isNotEmpty ? DateFormat('dd-MMM-yyyy').parse(dateOfBirthController.text) : null,
        Gender: selectedGender.value,
        Global_Dimension_1_Code: Get.find<DimensionController>().selectedDistrictDimension.value?.Code,
        // Only include baptism information if the user is baptized
        Baptism_Date: isBaptized.value && baptismDateController.text.isNotEmpty 
            ? DateFormat('dd-MMM-yyyy').parse(baptismDateController.text)
            : null,
        Baptised_by: isBaptized.value ? baptizedByController.text : null,
        Other_Information: otherInformationController.text,
        MembersGroups: Get.find<DimensionController>().selectedGroupDimensions.map((dimension) => MemberGroups( Global_Dimension_2_Code: dimension.Code)).toList(),
      );
      
      print('Customer data to submit: ${customerData.toJson()}');
      
      Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
      
      try {
        Customer? result = await ApiClient().registerCustomer(customerData);
        print('Registration successful: ${result != null ? result.toJson() : 'null'}');
        Get.back(); // Close loading dialog
        return result;
      } catch (apiError) {
        print('API Error during registration: $apiError');
        print('Error stack trace: ${StackTrace.current}');
        Get.back(); // Close loading dialog
        Get.snackbar('API Error', 'Failed to register: $apiError', backgroundColor: Colors.red);
        return null;
      }
    } catch (e) {
      print('Error in submitForm: $e');
      print('Error stack trace: ${StackTrace.current}');
      Get.back(); // Close loading dialog if open
      Get.snackbar('Error', 'Failed to register: $e', backgroundColor: Colors.red);
      return null;
    }
  }
}
