import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/parcel_model.dart';
import '../controllers/parcel_controller.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kReleaseMode;


typedef PaymentResponsibility = WhoToPay;  // For backward compatibility



class AddEditParcelPage extends  StatelessWidget {
  final Parcel? parcel;
    late final ParcelController controller;
  AddEditParcelPage({super.key, this.parcel})
   {
    // Initialize the controller with the customer data if available
    controller = Get.put(ParcelController(parcel: parcel ));

    // if (customer == null) {
    //   // Load the mock customer data if we are creating a new profile
    //   controller.loadCustomerData(RegistrationController.mockRegistration());
    // }
  }
  var currentStep = 0.obs;


  void _showSnackBar(String title, String message, {Color backgroundColor = Colors.green}) {

    
    final snackBar = GetSnackBar(
      title: title,
      message: message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 3),
    );
    Get.showSnackbar(snackBar);
  }




 





  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.documentNoController.text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              DateFormat('dd-MMM-yyyy').format(controller.selectedDate),
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _submitForm,
        label: Text(controller.parcel != null ? 'Update' : 'Save'),
        icon: Icon(controller.parcel != null ? Icons.update : Icons.save),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: EdgeInsets.only(
              left: 2,
              right: 2,
              top: 2,
              bottom: MediaQuery.of(context).viewInsets.bottom + 2,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                   Obx(() => Stepper(
                      type: StepperType.vertical,
                      
                      currentStep: currentStep.value,
                     onStepTapped: (step) => currentStep.value = step,
                      onStepContinue: () {
                          if (currentStep.value < 2) {
                            currentStep.value++;
                          } else {
                            if (controller.formKey.currentState!.validate()) {
                              _submitForm();
                            }
                          }
                        },
                      steps: [
                        Step(
                          title: const Text('Parcel Information'),
                          subtitle: Row(children: [Text('Ksh ${controller.amountPaidController.text}'),
                          
                          ],),
                          content:Column(
                            children: [
                              Row (
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: _buildTextField(
                                                                    controller: controller.amountPaidController,
                                                                    label: 'Amount Paid',
                                                                    isRequired: true,
                                                                    keyboardType: TextInputType.number,
                                                                    decoration: InputDecoration(
                                      prefixText: 'Ksh ',  
                                      
                                                                    ),
                                                                  ),
                                    ),
                                    const SizedBox(height: 16),
                                Checkbox(
                                  value: controller.paymentResponsibility == WhoToPay.Sender,
                                  onChanged: (value) {
                                    _onPaymentResponsibilityChanged(value! ? WhoToPay.Sender : null);
                                  },
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text('Sender'),
                                Checkbox(
                                  value: controller.paymentResponsibility == WhoToPay.Receiver,
                                  onChanged: (value) {
                                    _onPaymentResponsibilityChanged(value! ? WhoToPay.Receiver : null);
                                  },
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text('Receiver'),
                                  ],
                                ),Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: _buildTextField(
                                  controller: controller.fromController,
                                  label: 'From (Location)',
                                  prefixIcon: Icons.location_on,
                                  isRequired: true,
                                ),
                                ),
                                const SizedBox(height: 8),
                                Expanded(
                                  child: _buildTextField(
                                  controller: controller.toController,
                                  label: 'To (Destination)',
                                  prefixIcon: Icons.location_on,
                                  isRequired: true,
                                ),
                                ),
                              ],
                            ),
                            ],
                          ),
                            
                        ),
                        Step(
                          title: const Text('Sender Information'),
                          content: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildSectionHeader('Sender Information'),
                            const SizedBox(height: 8),
                            _buildTextField(
                              controller: controller.senderNameController,
                              label: 'Sender Name',
                              prefixIcon: Icons.person,
                              isRequired: true,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildTextField(
                                    controller: controller.senderPhoneController,
                                    label: 'Sender Phone',
                                    isRequired: true,
                                    prefixIcon: Icons.phone,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _buildTextField(
                                    controller: controller.senderIdController,
                                    label: 'ID No',
                                    prefixIcon: Icons.person,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildSectionHeader('Receiver Information'),
                            const SizedBox(height: 8),
                            _buildTextField(
                              controller: controller.receiverNameController,
                              label: 'Receiver Name',
                              prefixIcon: Icons.person,
                              isRequired: true,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildTextField(
                                    controller: controller.receiverPhoneController,
                                    label: 'Receiver Phone',
                                    prefixIcon: Icons.phone,
                                    isRequired: true,
                                    keyboardType: TextInputType.phone,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _buildTextField(
                                    controller: controller.receiverIdController,
                                    label: 'ID No',
                                    prefixIcon: Icons.person,
                                    ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                          ],
                        ),
                        ),
                        Step(
                       
                          title: const Text('Delivery Information'),
                          content: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildSectionHeader('Delivery Information'),
                            const SizedBox(height: 8),
                            _buildTextField(
                              controller: controller.vehicleController,
                              label: 'Vehicle Number *',
                              prefixIcon: Icons.abc,
                              isRequired: true,
                            ),
                        
                            const SizedBox(height: 20),
                            _buildTextField(
                              controller: controller.driverController,
                              label: 'Driver',
                              prefixIcon: Icons.person,
                              isRequired: true,
                            ),
                          ],
                        ),
                      ),
                        ),
                      ],
                    ),
                  ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool isRequired = false,
    TextInputType keyboardType = TextInputType.text,
    bool readOnly = false,
    InputDecoration? decoration,
    IconData? prefixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller,
        builder: (context, value, _) {
             final bool isEmpty = value.text.isEmpty;
          final Color borderColor = isEmpty && isRequired  ? Colors.red.shade300 : Colors.green.shade300;
          final Color iconColor = isEmpty && isRequired ? Colors.red : Colors.green;
          final Color labelColor = isEmpty && isRequired ? Colors.red.shade800 : Colors.green.shade800;
          
          return TextFormField(
          textAlign: TextAlign.center,
          
        controller: controller,
        keyboardType: keyboardType,
        readOnly: readOnly,
        decoration: decoration ?? InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: labelColor),
          border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: borderColor, width: 1.5),
              ),
              prefixIcon: Icon(prefixIcon, color: iconColor),
          suffix: isRequired ? const Text('*', style: TextStyle(color: Colors.red)) : null,
        enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: borderColor, width: 1.5),
              ),
        ),
       
        validator: isRequired 
            ? (value) => value?.isEmpty ?? true ? 'This field is required' : null 
            : null,
      );
    },
  ));
  }

  Widget _buildPaymentResponsibilityDropdown() {
    return DropdownButtonFormField<WhoToPay>(
      value: controller.paymentResponsibility,
      items: _paymentResponsibilityItems,
      onChanged: _onPaymentResponsibilityChanged,
      decoration: const InputDecoration(
        labelText: 'Payment Responsibility',
        border: OutlineInputBorder(),
      ),
    );
  }

  List<DropdownMenuItem<WhoToPay>> _paymentResponsibilityItems = [
    const DropdownMenuItem(
      value: WhoToPay.Sender,
      child: Text('Sender'),
    ),
    const DropdownMenuItem(
      value: WhoToPay.Receiver,
      child: Text('Receiver'),
    ),
  ];

  void _onPaymentResponsibilityChanged(WhoToPay? value) {

      controller.paymentResponsibility = value!;

  }



  final String apiUrl = 'https://your-api-url.com/parcels';

 

  void _submitForm() async {
    if (controller.formKey.currentState!.validate()) {
      try {
        final parcel = Parcel(
          Document_No: controller.documentNoController.text,
          Date_sent: controller.selectedDate,
          Sender_Name: controller.senderNameController.text,
          Sender_ID: controller.senderIdController.text,
          Sender_Phone: controller.senderPhoneController.text,
          From: controller.fromController.text,
          To: controller.toController.text,
          Receiver_Name: controller.receiverNameController.text,
          Receiver_ID: controller.receiverIdController.text,
          Receiver_Phone: controller.receiverPhoneController.text,
          Status: controller.selectedStatus,
          Driver: controller.driverController.text,
          Vehicle: controller.vehicleController.text,
          Who_to_Pay: controller.paymentResponsibility,
          Amount_Paid: double.tryParse(controller.amountPaidController.text) ?? 0.0,
          Paid: false,
          Date_Collected: controller.parcel?.Date_Collected,
          Date_Delivered: controller.parcel?.Date_Delivered,
        );

        if (parcel != null) {
          // Update existing parcel
          controller.updateParcel(parcel);
          _showSnackBar('Success', 'Parcel updated successfully!');
        } else {
          // Add new parcel
          controller.addParcel(parcel);
          _showSnackBar('Success', 'Parcel added successfully!');
          
          // Clear the form after submission for new entries
          controller.formKey.currentState?.reset();
         
        }
        
        // Close the form after a short delay to show the success message
        await Future.delayed(const Duration(seconds: 1));
       
          Get.back();
        
        
      } catch (e) {
        _showSnackBar('Error', 'Failed to save parcel: $e', backgroundColor: Colors.red);
        
        // Show error message
        _showSnackBar('Error', 'Failed to add parcel: $e',
          backgroundColor: Colors.red.withOpacity(0.8));
      }
    }
  }
}
