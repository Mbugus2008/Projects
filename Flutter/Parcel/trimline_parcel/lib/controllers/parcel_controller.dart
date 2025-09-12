import 'dart:io';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trimline_parcel/database/database_helper.dart'; // Ensure this import is correct
import '../models/parcel_model.dart';

class ParcelController extends GetxController {
  // Initialize DatabaseHelper
     Parcel? parcel;
   ParcelController({this.parcel
}) {
    parcel ??= fillcurrentParcel();
    _populateFormWithParcel(parcel!);
  }
  final DatabaseHelper _dbHelper = DatabaseHelper(); // Correctly initialize here

  final RxList<Parcel> _parcels = <Parcel>[].obs;
  final RxList<Parcel> _filteredParcels = <Parcel>[].obs;
  final RxBool _isLoading = true.obs;
  final RxString _searchQuery = ''.obs;
  final Rx<ParcelStatus?> _statusFilter = Rx<ParcelStatus?>(null);

  // Getters
  List<Parcel> get parcels => _parcels;
  List<Parcel> get filteredParcels => _filteredParcels;
  bool get isLoading => _isLoading.value;
  String get searchQuery => _searchQuery.value;
  ParcelStatus? get statusFilter => _statusFilter.value;


  final formKey = GlobalKey<FormState>();

  
  // Form controllers
  final documentNoController = TextEditingController();
  final senderNameController = TextEditingController();
  final senderIdController = TextEditingController();
  final senderPhoneController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final receiverNameController = TextEditingController();
  final receiverIdController = TextEditingController();
  final receiverPhoneController = TextEditingController();
  final driverController = TextEditingController();
  final vehicleController = TextEditingController();
  final amountPaidController = TextEditingController();
  ParcelStatus selectedStatus = ParcelStatus.pending;
  WhoToPay paymentResponsibility = WhoToPay.Sender;
  DateTime selectedDate = DateTime.now();

Parcel fillcurrentParcel() {
    //if (!kReleaseMode) {
     // Only prefill in debug mode
     Parcel parcel = Parcel(  
      Document_No: _generateDocumentNumber().asStream().first.toString(),
      Sender_Name: 'Test Sender',
      Sender_ID: 'S999',
      Sender_Phone: '0712345678',
      From: 'Nairobi',
      To: 'Mombasa',
      Receiver_Name: 'Test Receiver',
      Receiver_ID: 'R999',
      Receiver_Phone: '0723456789',
      Driver: 'Test Driver',
      Vehicle: 'KAA 999X',
      Amount_Paid: 500,
      Status: ParcelStatus.inTransit,
      Who_to_Pay: WhoToPay.Sender,
      Date_sent: DateTime.now(),
      Notes: 'Test Notes',
    );
   
    return parcel;
    //}
  }
    Future<String> _generateDocumentNumber() async {
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
      return documentNo;
    
    } catch (e) {
      print('Error generating document number: $e');
   
      return 'DOC-${DateTime.now().millisecondsSinceEpoch}';
     
    }
  }
void _populateFormWithParcel(Parcel parcel) {
  documentNoController.text = parcel.Document_No;
  senderNameController.text = parcel.Sender_Name;
  senderIdController.text = parcel.Sender_ID;
  senderPhoneController.text = parcel.Sender_Phone;
  fromController.text = parcel.From;
  toController.text = parcel.To;
  receiverNameController.text = parcel.Receiver_Name;
  receiverIdController.text = parcel.Receiver_ID;
  receiverPhoneController.text = parcel.Receiver_Phone;
  driverController.text = parcel.Driver;
  vehicleController.text = parcel.Vehicle;
  amountPaidController.text = parcel.Amount_Paid.toString();
  selectedStatus = parcel.Status;
  paymentResponsibility = parcel.Who_to_Pay;
  selectedDate = parcel.Date_sent;

 
}
  @override
  void onInit() {
    super.onInit();
    loadParcels();
  }

  Future<void> loadParcels() async {
    _isLoading.value = true;
    try {
      // Load from database instead of mock data
      final dbParcels = await _dbHelper.getAllParcels();
      _parcels.assignAll(dbParcels); // Assign all loaded parcels to the observable list
      _filterParcels(); // Apply any existing filters to the newly loaded data
    } catch (e) {
      if (kDebugMode) {
        print('Error loading parcels from DB: $e');
      }
      Get.snackbar(
        'Error',
        'Failed to load parcels: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
      _parcels.clear(); // Clear parcels on error
      _filteredParcels.clear();
    } finally {
      _isLoading.value = false;
    }
  }

  void setSearchQuery(String query) {
    _searchQuery.value = query;
    _filterParcels();
  }

  void setStatusFilter(ParcelStatus? status) {
    _statusFilter.value = status;
    _filterParcels();
  }

  void _filterParcels() {
    try {
      if (kDebugMode) {
        debugPrint('Filtering parcels. Search: "$searchQuery", Status: $statusFilter');
      }
      
      final filtered = _parcels.where((parcel) {
        // Skip filtering if no search query and no status filter
        if (searchQuery.isEmpty && statusFilter == null) return true;
        
        bool matchesSearch = searchQuery.isEmpty;
        
        // Check search query against all relevant fields (all non-nullable in Parcel model)
        if (!matchesSearch) {
          final searchLower = searchQuery.toLowerCase();
          matchesSearch = 
              parcel.Document_No.toLowerCase().contains(searchLower) ||
              parcel.Sender_Name.toLowerCase().contains(searchLower) ||
              (parcel.Sender_ID?.toLowerCase().contains(searchLower) ?? false) || // Handle nullable Sender_ID
              parcel.Sender_Phone.toLowerCase().contains(searchLower) ||
              parcel.From.toLowerCase().contains(searchLower) ||
              parcel.To.toLowerCase().contains(searchLower) ||
              parcel.Receiver_Name.toLowerCase().contains(searchLower) ||
              (parcel.Receiver_ID?.toLowerCase().contains(searchLower) ?? false) || // Handle nullable Receiver_ID
              parcel.Receiver_Phone.toLowerCase().contains(searchLower) ||
              parcel.Driver.toLowerCase().contains(searchLower) ||
              parcel.Vehicle.toLowerCase().contains(searchLower) ||
              (parcel.Notes?.toLowerCase().contains(searchLower) ?? false); // Search in Notes
        }
        
        // Check status filter if set
        final matchesStatus = statusFilter == null || parcel.Status == statusFilter;
        
        return matchesSearch && matchesStatus;
      }).toList();

      // Sort parcels: pending first, then by date (newest first)
      filtered.sort((a, b) {
        // If one is pending and the other is not, the pending one comes first
        if (a.Status == ParcelStatus.pending && b.Status != ParcelStatus.pending) return -1;
        if (a.Status != ParcelStatus.pending && b.Status == ParcelStatus.pending) return 1;
        
        // If both have the same status or neither is pending, sort by date (newest first)
        return b.Date_sent.compareTo(a.Date_sent);
      });

      if (kDebugMode) {
        debugPrint('Found ${filtered.length} matching parcels out of ${_parcels.length}');
      }
      
      _filteredParcels.assignAll(filtered); // Use assignAll for RxList
      // update(); // Not strictly needed if using RxList and GetX widgets observing it.
      
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Error filtering parcels: $e');
      }
      _filteredParcels.assignAll(_parcels); // On error, show all loaded parcels
      // rethrow; // Decide if you want to rethrow or handle gracefully
    }
  }

  Future<void> addParcel(Parcel parcel) async {
    _isLoading.value = true;
    try {
      await _dbHelper.insertParcel(parcel);
      // Reload all parcels from the database to ensure consistency after insertion
      await loadParcels(); 
      Get.snackbar(
        'Success',
        'Parcel ${parcel.Document_No} added successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error adding parcel to DB: $e');
      }
      Get.snackbar(
        'Error',
        'Failed to add parcel: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> updateParcel(Parcel updatedParcel) async {
    _isLoading.value = true;
    try {
      final rowsAffected = await _dbHelper.updateParcel(updatedParcel);
      if (rowsAffected > 0) {
        // Reload all parcels from the database after update
        await loadParcels();
         Get.snackbar(
          'Success',
          'Parcel ${updatedParcel.Document_No} updated successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white,
        );
      } else {
        throw Exception('Parcel not found in DB or no changes made.');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error updating parcel in DB: $e');
      }
      Get.snackbar(
        'Error',
        'Failed to update parcel: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> deleteParcel(String documentNo) async {
    _isLoading.value = true;
    try {
      final rowsAffected = await _dbHelper.deleteParcel(documentNo);
      if (rowsAffected > 0) {
        await loadParcels(); // Reload to reflect deletion
        Get.snackbar(
          'Success',
          'Parcel $documentNo deleted successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
         Get.snackbar(
          'Info',
          'Parcel $documentNo not found or already deleted.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting parcel from DB: $e');
      }
       Get.snackbar(
          'Error',
          'Failed to delete parcel: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
        );
    } finally {
      _isLoading.value = false;
    }
  }

  Color getStatusColor(ParcelStatus status) {
    switch (status) {
      case ParcelStatus.delivered:
        return Colors.green;
      case ParcelStatus.inTransit:
        return Colors.blue;
      case ParcelStatus.outForDelivery:
        return Colors.orange;
      case ParcelStatus.failed:
        return Colors.red;
      case ParcelStatus.returned:
        return Colors.purple;
      case ParcelStatus.pending:
      default: // Added default for safety
        return Colors.grey;
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    // Consider using intl package for more robust date formatting if needed
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}