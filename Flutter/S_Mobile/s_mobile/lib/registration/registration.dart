import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:s_mobile/common/Results.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/members/member.dart';
import 'package:s_mobile/registration/next_of_kin.dart';

import '../common/Apis.dart';
import '../common/widgets.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class registration {
  String? Key;
  String? No;
  String? Name;
  String? First_Name;
  //enum
  status? Status;
  String? Second_Name;
  String? Last_Name;
  DateTime? Date_of_Birth;
  String? ID_No;
  String? Passport_No;
  String? Member_Category;
  String? Station_Department;
  String? Group_Account_No;
  String? Current_Address;
  String? Home_Address;
  String? Mobile_Phone_No;
  String? P_I_N_Number;
  String? E_Mail;
  //enum
  gender? Gender;
  //enum
  marital_Status? Marital_Status;
  String? Box_No;
  String? Post_Code;
  String? City;
  String? Nationality;
  String? Bank_Code;
  String? Branch_Code;

  String? Bank_Account_No;
  String? Remarks;
  //enum
  recruited_by_Type? Recruited_by_Type;
  String? Recruited_By;
  String? Pay_Point;
  String? Employer_Code;
  String? Designation;
  String? Employer_Name;
  String? Payroll_No;
  //enum
  terms_of_Employment? Terms_of_Employment;
  String? Phone_No;
  String? Created_By;
  String? Responsibility_Center;
  String? Global_Dimension_1_Code;
  String? Global_Dimension_2_Code;

  registration({
    this.Key,
    this.No,
    this.Name,
    this.First_Name,
    this.Status,
    this.Second_Name,
    this.Last_Name,
    this.Date_of_Birth,
    this.ID_No,
    this.Passport_No,
    this.Member_Category,
    this.Station_Department,
    this.Group_Account_No,
    this.Current_Address,
    this.Home_Address,
    this.Mobile_Phone_No,
    this.P_I_N_Number,
    this.E_Mail,
    this.Gender,
    this.Marital_Status,
    this.Box_No,
    this.Post_Code,
    this.City,
    this.Nationality,
    this.Bank_Code,
    this.Branch_Code,
    this.Bank_Account_No,
    this.Remarks,
    this.Recruited_by_Type,
    this.Recruited_By,
    this.Pay_Point,
    this.Employer_Code,
    this.Designation,
    this.Employer_Name,
    this.Payroll_No,
    this.Terms_of_Employment,
    this.Phone_No,
    this.Created_By,
    this.Responsibility_Center,
    this.Global_Dimension_1_Code,
    this.Global_Dimension_2_Code,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'No': No,
      'Name': Name,
      'First_Name': First_Name,
      'Status': Status?.index,
      'Second_Name': Second_Name,
      'Last_Name': Last_Name,
      'Date_of_Birth': Date_of_Birth?.millisecondsSinceEpoch,
      'ID_No': ID_No,
      'Passport_No': Passport_No,
      'Member_Category': Member_Category,
      'Station_Department': Station_Department,
      'Group_Account_No': Group_Account_No,
      'Current_Address': Current_Address,
      'Home_Address': Home_Address,
      'Mobile_Phone_No': Mobile_Phone_No,
      'P_I_N_Number': P_I_N_Number,
      'E_Mail_Personal': E_Mail,
      'Gender': Gender?.index,
      'Marital_Status': Marital_Status?.index,
      'Box_No': Box_No,
      'Post_Code': Post_Code,
      'City': City,
      'Nationality': Nationality,
      'Bank_Code': Bank_Code,
      'Branch_Code': Branch_Code,
      'Bank_Account_No': Bank_Account_No,
      'Remarks': Remarks,
      'Recruited_by_Type': Recruited_by_Type?.index,
      'Recruited_By': Recruited_By,
      'Pay_Point': Pay_Point,
      'Employer_Code': Employer_Code,
      'Designation': Designation,
      'Employer_Name': Employer_Name,
      'Payroll_No': Payroll_No,
      'Terms_of_Employment': Terms_of_Employment?.index,
      'Phone_No': Phone_No,
      'Created_By': Created_By,
      'Responsibility_Center': Responsibility_Center,
      'Global_Dimension_1_Code': Global_Dimension_1_Code,
      'Global_Dimension_2_Code': Global_Dimension_2_Code,
    };
  }

  factory registration.fromMap(Map<String, dynamic> map) {
    return registration(
      Key: map['Key'] != null ? map['Key'] as String : null,
      No: map['No'] != null ? map['No'] as String : null,
      Name: map['Name'] != null ? map['Name'] as String : null,
      First_Name:
          map['First_Name'] != null ? map['First_Name'] as String : null,
      Status: map['Status'] != null
          ? status?.values[(map['Status'] ?? 0) as int]
          : null,
      Second_Name:
          map['Second_Name'] != null ? map['Second_Name'] as String : null,
      Last_Name: map['Last_Name'] != null ? map['Last_Name'] as String : null,
      Date_of_Birth: map['Date_of_Birth'] != null
          ? DateTime.tryParse((map['Date_of_Birth'] ?? 0))
          : null,
      ID_No: map['ID_No'] != null ? map['ID_No'] as String : null,
      Passport_No:
          map['Passport_No'] != null ? map['Passport_No'] as String : null,
      Member_Category: map['Member_Category'] != null
          ? map['Member_Category'] as String
          : null,
      Station_Department: map['Station_Department'] != null
          ? map['Station_Department'] as String
          : null,
      Group_Account_No: map['Group_Account_No'] != null
          ? map['Group_Account_No'] as String
          : null,
      Current_Address: map['Current_Address'] != null
          ? map['Current_Address'] as String
          : null,
      Home_Address:
          map['Home_Address'] != null ? map['Home_Address'] as String : null,
      Mobile_Phone_No: map['Mobile_Phone_No'] != null
          ? map['Mobile_Phone_No'] as String
          : null,
      P_I_N_Number:
          map['P_I_N_Number'] != null ? map['P_I_N_Number'] as String : null,
      E_Mail: map['E_Mail'] != null ? map['E_Mail'] as String : null,
      Gender: map['Gender'] != null
          ? gender?.values[(map['Gender'] ?? 0) as int]
          : null,
      Marital_Status: map['Marital_Status'] != null
          ? marital_Status?.values[(map['Marital_Status'] ?? 0) as int]
          : null,
      Box_No: map['Box_No'] != null ? map['Box_No'] as String : null,
      Post_Code: map['Post_Code'] != null ? map['Post_Code'] as String : null,
      City: map['City'] != null ? map['City'] as String : null,
      Nationality:
          map['Nationality'] != null ? map['Nationality'] as String : null,
      Bank_Code: map['Bank_Code'] != null ? map['Bank_Code'] as String : null,
      Branch_Code:
          map['Branch_Code'] != null ? map['Branch_Code'] as String : null,
      Bank_Account_No: map['Bank_Account_No'] != null
          ? map['Bank_Account_No'] as String
          : null,
      Remarks: map['Remarks'] != null ? map['Remarks'] as String : null,
      Recruited_by_Type: map['Recruited_by_Type'] != null
          ? recruited_by_Type?.values[(map['Recruited_by_Type'] ?? 0) as int]
          : null,
      Recruited_By:
          map['Recruited_By'] != null ? map['Recruited_By'] as String : null,
      Pay_Point: map['Pay_Point'] != null ? map['Pay_Point'] as String : null,
      Employer_Code:
          map['Employer_Code'] != null ? map['Employer_Code'] as String : null,
      Designation:
          map['Designation'] != null ? map['Designation'] as String : null,
      Employer_Name:
          map['Employer_Name'] != null ? map['Employer_Name'] as String : null,
      Payroll_No:
          map['Payroll_No'] != null ? map['Payroll_No'] as String : null,
      Terms_of_Employment: map['Terms_of_Employment'] != null
          ? terms_of_Employment
              ?.values[(map['Terms_of_Employment'] ?? 0) as int]
          : null,
      Phone_No: map['Phone_No'] != null ? map['Phone_No'] as String : null,
      Created_By:
          map['Created_By'] != null ? map['Created_By'] as String : null,
      Responsibility_Center: map['Responsibility_Center'] != null
          ? map['Responsibility_Center'] as String
          : null,
      Global_Dimension_1_Code: map['Global_Dimension_1_Code'] != null
          ? map['Global_Dimension_1_Code'] as String
          : null,
      Global_Dimension_2_Code: map['Global_Dimension_2_Code'] != null
          ? map['Global_Dimension_2_Code'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory registration.fromJson(String source) =>
      registration.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum customer_Type {
  /// <remarks/>
  _blank_,

  /// <remarks/>
  Welfare,

  /// <remarks/>
  Micro_finance,

  /// <remarks/>
  _Partnership,
}

enum account_Category {
  /// <remarks/>
  Member,

  /// <remarks/>
  Staff_Members,

  /// <remarks/>
  Board_Members,

  /// <remarks/>
  Delegates,
}

enum terms_of_Employment {
  /// <remarks/>
  _blank_,

  /// <remarks/>
  Permanent,

  /// <remarks/>
  Contract,

  /// <remarks/>
  Casual,
}

enum gender {
  /// <remarks/>
  _blank__blank_,

  /// <remarks/>
  Male,

  /// <remarks/>
  Female,
}

enum marital_Status {
  /// <remarks/>
  _blank_,

  /// <remarks/>
  Single,

  /// <remarks/>
  Married,

  /// <remarks/>
  Devorced,

  /// <remarks/>
  Widower,

  /// <remarks/>
  Widow,
}

enum read_Write {
  /// <remarks/>
  _blank_,

  /// <remarks/>
  No,

  /// <remarks/>
  Yes,
}

enum type {
  /// <remarks/>
  _blank_,

  /// <remarks/>
  From_Other_Sacco,
}

enum status {
  /// <remarks/>
  Open,

  /// <remarks/>
  Pending,

  /// <remarks/>
  Approved,

  /// <remarks/>
  Rejected,

  /// <remarks/>
  Created,
}

enum recruited_by_Type {
  /// <remarks/>
  Marketer,

  /// <remarks/>
  Others,

  /// <remarks/>
  Staff,

  /// <remarks/>
  Board_Member,

  /// <remarks/>
  Member,
}

enum type_of_Business {
  /// <remarks/>
  _blank_,

  /// <remarks/>
  Sole_Proprietor,

  /// <remarks/>
  Partnership,

  /// <remarks/>
  Limited_Liability_Company,

  /// <remarks/>
  Informal_Body,

  /// <remarks/>
  Registered_Group,

  /// <remarks/>
  Other_Specify,
}

class Registration_widget extends StatefulWidget {
  Registration_widget({
    Key? key,
    this.newreg,
  }) : super(key: key);
  registration? newreg;
  @override
  State<Registration_widget> createState() => reg();
}

class reg extends State<Registration_widget> {
  gender? _gender = gender._blank__blank_;

  @override
  void initState() {
    super.initState();

    widget.newreg = new registration();
    //widget.newreg?.Gender = gender.Male;
  }

  Future<void> _submit() async {
    print(widget.newreg);
    var random = Random();
    int? otpc = random.nextInt(999999) + 100000;
    var request = Params(
        Phone: widget.newreg?.Mobile_Phone_No,
        text: "Your registration otp is $otpc");
    var r = await ApiClient().postdata("Otp", request.toJson()).then((value) {
      if (value.statusCode == 200) {
        Results rr = Results.fromJson(value.body);
        if (rr.Code == 0) {
          utilities().Otp(context, otpc.toString()).then((value) {
            ApiClient().postdata("register", widget.newreg!.toJson()).then((regResponse) {
              if (regResponse.statusCode == 200) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => NextOfKin_widget(
                    accountNo: widget.newreg?.No,
                  ),
                ));
              }
            });
          });
        }
      }
    });
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != widget.newreg?.Date_of_Birth) {
      setState(() {
        widget.newreg?.Date_of_Birth = picked;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Registration"),
        ),
        body: IntrinsicHeight(

          child: Form(
              key: _formKey,
              child: Card(
                margin: EdgeInsets.all(20
                ),

                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Name'),
                        onFieldSubmitted: (value) => widget.newreg?.Name = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'E-Mail'),
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {
                          setState(() {
                            widget.newreg?.E_Mail = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Invalid email!';
                          }
                        },
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text("Gender"),
                          ),
                          StatefulBuilder(builder: (context, setState) {
                            return DropdownButton(
                              value: widget.newreg?.Gender,
                              onChanged: (gender? newValue) {
                                setState(() {
                                  widget.newreg?.Gender = newValue;
                                });
                              },
                              items: gender.values.map((location) {
                                return DropdownMenuItem(
                                  value: location,
                                  child: Text(location.name.toString()),
                                );
                              }).toList(),
                            );
                          }),
                        ],
                      ),
                      TextField(
                        decoration:
                            const InputDecoration(labelText: 'National ID No'),
                        onChanged: (value) => widget.newreg?.ID_No = value,
                      ),
                      TextField(
                        decoration: const InputDecoration(labelText: 'Mobile No'),
                        onChanged: (value) =>
                            widget.newreg?.Mobile_Phone_No = value,
                      ),
                      TextFormField(
                        controller: TextEditingController(
                            text: utilities.formatter.format(
                                widget.newreg?.Date_of_Birth ?? DateTime.now())),
                        decoration: InputDecoration(labelText: 'Date of birth'),
                        keyboardType: TextInputType.emailAddress,
                        readOnly: true,
                        onTap: () {
                          _selectDate(context);
                        },
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Invalid email!';
                          }
                        },
                      ),

                      MaterialButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: _submit,
                        child: Text("Register"),
                      ),

                    ],
                  ),
                ),
              )),
        ));
  }
}
