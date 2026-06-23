// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:s_mobile/common/Apis.dart';
import 'package:s_mobile/common/Results.dart';
import 'package:s_mobile/common/utilities.dart';

class NextOfKin {
  String? Key;
  String? Account_No;
  NextOfKinType? Type;
  String? Name;
  String? Relationship;
  bool? Beneficiary;
  DateTime? Date_of_Birth;
  String? Address;
  String? Telephone;
  String? Email;
  String? ID_No;
  int? PercentAllocation;

  NextOfKin({
    this.Key,
    this.Account_No,
    this.Type,
    this.Name,
    this.Relationship,
    this.Beneficiary,
    this.Date_of_Birth,
    this.Address,
    this.Telephone,
    this.Email,
    this.ID_No,
    this.PercentAllocation,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'Account_No': Account_No,
      'Type': Type?.index,
      'Name': Name,
      'Relationship': Relationship,
      'Beneficiary': Beneficiary,
      'Date_of_Birth': Date_of_Birth?.toIso8601String(),
      'Address': Address,
      'Telephone': Telephone,
      'Email': Email,
      'ID_No': ID_No,
      'PercentAllocation': PercentAllocation,
    };
  }

  String toJson() => json.encode(toMap());

  factory NextOfKin.fromMap(Map<String, dynamic> map) {
    return NextOfKin(
      Key: map['Key'] != null ? map['Key'] as String : null,
      Account_No: map['Account_No'] != null ? map['Account_No'] as String : null,
      Type: map['Type'] != null
          ? NextOfKinType.values[(map['Type'] as int?)!]
          : null,
      Name: map['Name'] != null ? map['Name'] as String : null,
      Relationship: map['Relationship'] != null ? map['Relationship'] as String : null,
      Beneficiary: map['Beneficiary'] != null ? map['Beneficiary'] as bool : null,
      Date_of_Birth: map['Date_of_Birth'] != null
          ? DateTime.tryParse(map['Date_of_Birth'] as String)
          : null,
      Address: map['Address'] != null ? map['Address'] as String : null,
      Telephone: map['Telephone'] != null ? map['Telephone'] as String : null,
      Email: map['Email'] != null ? map['Email'] as String : null,
      ID_No: map['ID_No'] != null ? map['ID_No'] as String : null,
      PercentAllocation: map['PercentAllocation'] != null ? map['PercentAllocation'] as int : null,
    );
  }

  factory NextOfKin.fromJson(String source) =>
      NextOfKin.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum NextOfKinType {
  Next_of_Kin,
  Spouse,
  Benevolent_Beneficiary,
}

class NextOfKin_widget extends StatefulWidget {
  const NextOfKin_widget({Key? key, this.accountNo}) : super(key: key);
  final String? accountNo;

  @override
  State<NextOfKin_widget> createState() => _NextOfKinState();
}

class _NextOfKinState extends State<NextOfKin_widget> {
  final _formKey = GlobalKey<FormState>();
  final NextOfKin _data = NextOfKin();

  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _data.Account_No = widget.accountNo;
    _data.Type = NextOfKinType.Next_of_Kin;
    _data.Beneficiary = false;
    _data.PercentAllocation = 100;
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() => _loading = true);

    try {
      final response =
          await ApiClient().postdata('nextofkin', _data.toJson());

      if (!mounted) return;

      if (response.statusCode == 200) {
        final result = Results.fromJson(response.body);
        if (result.Code == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Next of kin added successfully.')),
          );
          Navigator.of(context).pop();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(result.Desc ?? 'Request failed.')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Request failed (${response.statusCode}).')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())));
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  DateTime _selectedDob = DateTime(1990, 1, 1);

  Future<void> _pickDob() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDob,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDob = picked;
        _data.Date_of_Birth = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Next of Kin'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _data.Account_No,
                decoration: const InputDecoration(labelText: 'Account No'),
                onSaved: (v) => _data.Account_No = v,
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Account No is required' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (v) => _data.Name = v,
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Name is required' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Relationship'),
                onSaved: (v) => _data.Relationship = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'National ID No'),
                onSaved: (v) => _data.ID_No = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Telephone'),
                keyboardType: TextInputType.phone,
                onSaved: (v) => _data.Telephone = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (v) => _data.Email = v,
              ),
              TextFormField(
                initialValue: (_data.PercentAllocation ?? 100).toString(),
                decoration:
                    const InputDecoration(labelText: 'Percent Allocation'),
                keyboardType: TextInputType.number,
                onSaved: (v) =>
                    _data.PercentAllocation = int.tryParse(v ?? '100'),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Expanded(child: Text('Type')),
                  StatefulBuilder(builder: (context, setDropState) {
                    return DropdownButton<NextOfKinType>(
                      value: _data.Type,
                      onChanged: (v) => setDropState(() => _data.Type = v),
                      items: NextOfKinType.values
                          .map((t) => DropdownMenuItem(
                                value: t,
                                child: Text(t.name.replaceAll('_', ' ')),
                              ))
                          .toList(),
                    );
                  }),
                ],
              ),
              Row(
                children: [
                  const Expanded(child: Text('Beneficiary')),
                  StatefulBuilder(builder: (context, setSwState) {
                    return Switch(
                      value: _data.Beneficiary ?? false,
                      onChanged: (v) =>
                          setSwState(() => _data.Beneficiary = v),
                    );
                  }),
                ],
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Date of Birth'),
                subtitle: Text(
                  _data.Date_of_Birth != null
                      ? utilities.formatter.format(_data.Date_of_Birth!)
                      : utilities.formatter.format(_selectedDob),
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: _pickDob,
              ),
              const SizedBox(height: 16),
              _loading
                  ? const CircularProgressIndicator()
                  : MaterialButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: _submit,
                      child: const Text(
                        'Save Next of Kin',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
