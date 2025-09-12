import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/parcel_model.dart';
import '../controllers/parcel_controller.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kReleaseMode;


typedef PaymentResponsibility = WhoToPay;  // For backward compatibility

class AddParcelPage extends StatefulWidget {
  final Parcel? parcel;
  
  const AddParcelPage({Key? key, this.parcel}) : super(key: key);

  @override
  _AddParcelPageState createState() => _AddParcelPageState();
}

class _AddParcelPageState extends State<AddParcelPage> {
  final _formKey = GlobalKey<FormState>();
  final _parcelController = Get.find<ParcelController>();
  
  // Form controllers
  final _documentNoController = TextEditingController();
  final _senderNameController = TextEditingController();
  final _senderIdController = TextEditingController();
  final _senderPhoneController = TextEditingController();
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  final _receiverNameController = TextEditingController();
  final _receiverIdController = TextEditingController();
  final _receiverPhoneController = TextEditingController();
  final _driverController = TextEditingController();
  final _vehicleController = TextEditingController();
  final _amountPaidController = TextEditingController();
  
  ParcelStatus _selectedStatus = ParcelStatus.pending;
  WhoToPay _paymentResponsibility = WhoToPay.Sender;
  DateTime _selectedDate = DateTime.now();

  void _showSnackBar(String title, String message, {Color backgroundColor = Colors.green}) {
    if (!mounted) return;
    
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
  void dispose() {
    _documentNoController.dispose();
    _senderNameController.dispose();
    _senderIdController.dispose();
    _senderPhoneController.dispose();
    _fromController.dispose();
    _toController.dispose();
    _receiverNameController.dispose();
    _receiverIdController.dispose();
    _receiverPhoneController.dispose();
    _driverController.dispose();
    _vehicleController.dispose();
    _amountPaidController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    
    if (widget.parcel != null) {
      // Edit mode - populate form with existing parcel data
      _populateFormWithParcel(widget.parcel!);
    } else {
      // Add mode - generate new document number
      _generateDocumentNumber();
      _prefillTestData(); // Prefill with test data for development
    }
  }

  // Prefill form with test data for development
  void _prefillTestData() {
    if (!kReleaseMode) { // Only prefill in debug mode
      _senderNameController.text = 'Test Sender';
      _senderIdController.text = 'S999';
      _senderPhoneController.text = '0712345678';
      _fromController.text = 'Nairobi';
      _toController.text = 'Mombasa';
      _receiverNameController.text = 'Test Receiver';
      _receiverIdController.text = 'R999';
      _receiverPhoneController.text = '0723456789';
      _driverController.text = 'Test Driver';
      _vehicleController.text = 'KAA 999X';
      _amountPaidController.text = '500';
      _selectedStatus = ParcelStatus.inTransit;
      _paymentResponsibility = WhoToPay.Sender;
      _selectedDate = DateTime.now();
      // Call setState to update the UI with the new values
      if (mounted) {
        setState(() {});
      }
    }
  }

  Future<void> _generateDocumentNumber() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      String deviceId;
      
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.id;
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor!;
      } else {
        deviceId = 'UNKNOWN';
      }

      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final documentNo = '${deviceId.substring(0, 8)}-${timestamp.substring(0, 8)}';
      
      setState(() {
        _documentNoController.text = documentNo;
      });
    } catch (e) {
      print('Error generating document number: $e');
      setState(() {
        _documentNoController.text = 'DOC-${DateTime.now().millisecondsSinceEpoch}';
      });
    }
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
              _documentNoController.text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              DateFormat('dd-MMM-yyyy').format(_selectedDate),
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
        label: Text(widget.parcel != null ? 'Update' : 'Save'),
        icon: Icon(widget.parcel != null ? Icons.update : Icons.save),
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
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                             const SizedBox(height: 8),
                            _buildSectionHeader('Parcel Information'),
                            const SizedBox(height: 8),
                            Row (
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: _buildTextField(
                                                                controller: _amountPaidController,
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
                              value: _paymentResponsibility == WhoToPay.Sender,
                              onChanged: (value) {
                                _onPaymentResponsibilityChanged(value! ? WhoToPay.Sender : null);
                              },
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            Text('Sender'),
                            Checkbox(
                              value: _paymentResponsibility == WhoToPay.Receiver,
                              onChanged: (value) {
                                _onPaymentResponsibilityChanged(value! ? WhoToPay.Receiver : null);
                              },
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            Text('Receiver'),
                              ],
                            ),

                            
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: _buildTextField(
                                  controller: _fromController,
                                  label: 'From (Location)',
                                  prefixIcon: Icons.location_on,
                                  isRequired: true,
                                ),
                                ),
                                const SizedBox(height: 8),
                                Expanded(
                                  child: _buildTextField(
                                  controller: _toController,
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
                    ),
                    const SizedBox(height: 2),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildSectionHeader('Sender Information'),
                            const SizedBox(height: 8),
                            _buildTextField(
                              controller: _senderNameController,
                              label: 'Sender Name',
                              prefixIcon: Icons.person,
                              isRequired: true,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildTextField(
                                    controller: _senderPhoneController,
                                    label: 'Sender Phone',
                                    isRequired: true,
                                    prefixIcon: Icons.phone,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _buildTextField(
                                    controller: _senderIdController,
                                    label: 'ID No',
                                    prefixIcon: Icons.person,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildSectionHeader('Receiver Information'),
                            const SizedBox(height: 8),
                            _buildTextField(
                              controller: _receiverNameController,
                              label: 'Receiver Name',
                              prefixIcon: Icons.person,
                              isRequired: true,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildTextField(
                                    controller: _receiverPhoneController,
                                    label: 'Receiver Phone',
                                    prefixIcon: Icons.phone,
                                    isRequired: true,
                                    keyboardType: TextInputType.phone,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _buildTextField(
                                    controller: _receiverIdController,
                                    label: 'ID No',
                                    prefixIcon: Icons.person,
                                    ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildSectionHeader('Delivery Information'),
                            const SizedBox(height: 8),
                            _buildTextField(
                              controller: _vehicleController,
                              label: 'Vehicle Number *',
                              prefixIcon: Icons.abc,
                              isRequired: true,
                            ),
                        
                            const SizedBox(height: 20),
                            _buildTextField(
                              controller: _driverController,
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
          color: Theme.of(context).primaryColor,
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
      value: _paymentResponsibility,
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
    setState(() {
      _paymentResponsibility = value!;
    });
  }



  final String apiUrl = 'https://your-api-url.com/parcels';

  void _populateFormWithParcel(Parcel parcel) {
    _documentNoController.text = parcel.Document_No;
    _senderNameController.text = parcel.Sender_Name;
    _senderIdController.text = parcel.Sender_ID;
    _senderPhoneController.text = parcel.Sender_Phone;
    _fromController.text = parcel.From;
    _toController.text = parcel.To;
    _receiverNameController.text = parcel.Receiver_Name;
    _receiverIdController.text = parcel.Receiver_ID;
    _receiverPhoneController.text = parcel.Receiver_Phone;
    _driverController.text = parcel.Driver;
    _vehicleController.text = parcel.Vehicle;
    _amountPaidController.text = parcel.Amount_Paid.toString();
    _selectedStatus = parcel.Status;
    _paymentResponsibility = parcel.Who_to_Pay;
    _selectedDate = parcel.Date_sent;
    
    if (mounted) {
      setState(() {});
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        final parcel = Parcel(
          Document_No: _documentNoController.text,
          Date_sent: _selectedDate,
          Sender_Name: _senderNameController.text,
          Sender_ID: _senderIdController.text,
          Sender_Phone: _senderPhoneController.text,
          From: _fromController.text,
          To: _toController.text,
          Receiver_Name: _receiverNameController.text,
          Receiver_ID: _receiverIdController.text,
          Receiver_Phone: _receiverPhoneController.text,
          Status: _selectedStatus,
          Driver: _driverController.text,
          Vehicle: _vehicleController.text,
          Who_to_Pay: _paymentResponsibility,
          Amount_Paid: double.tryParse(_amountPaidController.text) ?? 0.0,
          Paid: false,
          Date_Collected: widget.parcel?.Date_Collected,
          Date_Delivered: widget.parcel?.Date_Delivered,
        );

        if (widget.parcel != null) {
          // Update existing parcel
          _parcelController.updateParcel(parcel);
          _showSnackBar('Success', 'Parcel updated successfully!');
        } else {
          // Add new parcel
          _parcelController.addParcel(parcel);
          _showSnackBar('Success', 'Parcel added successfully!');
          
          // Clear the form after submission for new entries
          _formKey.currentState?.reset();
          _generateDocumentNumber();
        }
        
        // Close the form after a short delay to show the success message
        await Future.delayed(const Duration(seconds: 1));
        if (mounted) {
          Navigator.of(context).pop();
        }
        
      } catch (e) {
        _showSnackBar('Error', 'Failed to save parcel: $e', backgroundColor: Colors.red);
        
        // Show error message
        _showSnackBar('Error', 'Failed to add parcel: $e',
          backgroundColor: Colors.red.withOpacity(0.8));
      }
    }
  }
}
