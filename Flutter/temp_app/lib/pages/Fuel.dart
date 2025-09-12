// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:t_matatu/controllers/vehicles/vehicles.dart';
import 'package:t_matatu/models/vehicles/vehicle.dart';
import 'package:t_matatu/reports/controller.dart';
import '../models/vehicles/DeportandFuel.dart';

class Fuel extends StatelessWidget {
  const Fuel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FuelController>(
      init: FuelController(),
      builder: (fuelController) {
        return Scaffold(
          body: GetBuilder<DepotController>(
            init: DepotController(),
            builder: (depotController) {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _builddateField(),
                      _buildSearchField(),
                      Expanded(child: _buildVehicleList()),
                    ],
                  ),
                  if (fuelController.isLoading)
                    Container(
                      color: Colors.black.withOpacity(0.5),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              );
            },
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: fuelController.isUpdating ? null : () => fuelController.updateDepot(),
            icon: fuelController.isUpdating
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Icon(Icons.update, color: Colors.white),
            label: Text(
              fuelController.isUpdating ? 'Updating...' : 'Update Fuel Data',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: fuelController.isUpdating ? Colors.grey : Colors.blue,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
 Widget _builddateField() {
    return ElevatedButton(
      onPressed: () {
        showDatePicker(
          context: Get.context!,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        ).then((date) {
          if (date != null) {
            Get.find<ReportController>().selectedDate?.value =  date;
            DepotFuel().getdata(date);
          }
        });
      },
      child: Obx(() => Text( Get.find<ReportController>().selectedDate?.value != null ? DateFormat('dd-MMM-yyyy').format(Get.find<ReportController>().selectedDate!.value!) : 'Select Date')),
      style: ButtonStyle(
        
        
        padding: MaterialStateProperty.all(EdgeInsets.all(20)), // content padding
      ),
    );
  }
  Widget _buildSearchField() {
    return TextFormField(
      onChanged: (value) {
        value = value.toUpperCase();
        Get.find<DepotController>().filterDepotTrans(value);
      },
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.blue),
        floatingLabelAlignment: FloatingLabelAlignment.center,
        labelText: 'Find Vehicle',
        labelStyle: TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _buildVehicleList() {
    return Obx(() {
      var controller = Get.find<DepotController>();
      if (controller.depottrans.isEmpty) {
        return Center(child: Text('No vehicles available'));
      }
      return ListView.builder(
        itemCount: controller.depottrans.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildVehicleCard(index);
        },
      );
    });
  }

  Widget _buildVehicleCard(int index) {
    final vehiclesController = Get.find<DepotController>();
    final vehicle = vehiclesController.depottrans[index];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        elevation: 8, // Increased elevation for more pronounced shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadowColor: Colors.grey.withOpacity(0.5), // Softer shadow color
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.grey.shade100],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                _buildVehicleHeader(vehicle),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //_buildDriverInfo(vehicle),
                    Expanded(child: _buildFuelInputs(vehicle)),
                    _buildFinancialInfo(vehicle),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleHeader(dynamic vehicle) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 14, color: Colors.blue.shade900),
                children: [
                  TextSpan(
                    text: '${vehicle.Fleet} ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: '| '),
                  TextSpan(
                    text: '${vehicle.Vehicle} ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.blue.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${vehicle_type_desc.desc[vehicle.Capacity]}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDriverInfo(dynamic vehicle) {
    return GestureDetector(
      onTap: () => _showDriverInfoPopup(Get.context!, vehicle),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SizedBox(
          width: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(vehicle.Driver ?? '', style: const TextStyle(fontSize: 11), overflow: TextOverflow.ellipsis),
              Text(vehicle.Driver_Name ?? '', style: const TextStyle(fontSize: 9), overflow: TextOverflow.ellipsis),
              Text(vehicle.Conductor ?? '', style: const TextStyle(fontSize: 11), overflow: TextOverflow.ellipsis),
              Text(vehicle.Conductor_Name ?? '', style: const TextStyle(fontSize: 9), overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }

  void _showDriverInfoPopup(BuildContext context, dynamic vehicle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Vehicle Details', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('Fleet', vehicle.Fleet),
                _buildInfoRow('Vehicle', vehicle.Vehicle),
                _buildInfoRow('Capacity', vehicle_type_desc.desc[vehicle.Capacity]),
                Divider(height: 20, thickness: 1),
                _buildInfoRow('Driver', vehicle.Driver),
                _buildInfoRow('Driver Name', vehicle.Driver_Name),
                Divider(height: 20, thickness: 1),
                _buildInfoRow('Conductor', vehicle.Conductor),
                _buildInfoRow('Conductor Name', vehicle.Conductor_Name),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700]),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value ?? 'N/A',
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFuelInputs(DepotFuel vehicle) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField(
            vehicle.litres_editor,
            'Litres',
            (value) => vehicle.Total_litres = double.tryParse(value) ?? 0,
          vehicle.Total_litres == null || vehicle.Total_litres == 0.0?"":vehicle.Total_litres.toString(),
          ),  SizedBox(height: 10),
           _buildTextField(
                    vehicle.fuel_editor,
                    'Fuel(Kes)',
                    (value) {
                      vehicle.Fuel = double.tryParse(value) ?? 0;
                      _updateBalance(vehicle);
                    },
                    vehicle.Fuel == null || vehicle.Fuel == 0.0?"":vehicle.Fuel.toString(),
                  ),
                    SizedBox(height: 10),
                _buildTextField(
                    vehicle.amountpaid_editor,
                    'Paid Amount(Kes)',
                    (value) {
                      vehicle.Amount_Paid = double.tryParse(value) ?? 0;
                      _updateBalance(vehicle);
                    },
                    vehicle.Amount_Paid == null || vehicle.Amount_Paid == 0.0?"":vehicle.Amount_Paid.toString(),
                  ),
          SizedBox(height: 10), // Add some vertical spacing
          _buildTextField(
            vehicle.milleage_editor,
            'Millage',
            (value) => vehicle.Millage = int.tryParse(value) ?? 0,
            vehicle.Millage == null || vehicle.Millage == 0?"":vehicle.Millage.toString(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, Function(String) onChanged, String initialValue) {
    IconData icon;
    switch (hint) {
      case 'Fuel(Kes)':
        icon = Icons.attach_money;
        break;
      case 'Amount Paid':
        icon = Icons.attach_money;
        break;
      case 'Millage':
        icon = Icons.speed;
        break;
        case 'Litres':
        icon = Icons.local_gas_station;
        break;
      default:
        icon = Icons.edit;
    }

    controller.text = initialValue;

    return TextField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      controller: controller,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 12),
        prefixIcon: Icon(icon, size: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      ),
      onTap: () {
        controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: controller.text.length,
        );
      },
      onChanged: (value) {
        print('TextField changed: $hint = $value'); // Debug print
        onChanged(value);
        if (hint == 'Fuel(Kes)' || hint == 'Amount Paid') {
          final vehiclesController = Get.find<DepotController>();
          final vehicleIndex = vehiclesController.depottrans.indexWhere(
            (v) => v.fuel_editor == controller || v.amountpaid_editor == controller
          );
          if (vehicleIndex != -1) {
            final vehicle = vehiclesController.depottrans[vehicleIndex];
            _updateBalance(vehicle);
          } else {
            print('Vehicle not found for $hint'); // Debug print
          }
        }
      },
    );
  }

  Widget _buildFinancialInfo(dynamic vehicle) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text('Offload', style: TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis),
            Text('${vehicle.Offload ?? 0}', style: TextStyle(fontSize: 11), overflow: TextOverflow.ellipsis),
            const Divider(height: 8, thickness: 1),
            const Text('Balance', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
            Text('${vehicle.Balance ?? 0}', 
                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: (vehicle.Balance ?? 0) >= 0 ? Colors.green : Colors.red), 
                 overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  void _updateBalance(dynamic vehicle) {
    print('Updating balance for vehicle: ${vehicle.Vehicle}'); // Debug print
    print('Before update: Offload=${vehicle.Offload}, Fuel=${vehicle.Fuel}, Amount_Paid=${vehicle.Amount_Paid}, Balance=${vehicle.Balance}'); // Debug print
    vehicle.Balance = (vehicle.Offload ?? 0) - ( (vehicle.Amount_Paid ?? 0));
    print('After update: Balance=${vehicle.Balance}'); // Debug print
    Get.find<VehiclesController>().update(); // Ensure UI is updated
  }
}

class FuelController extends GetxController {
  bool isLoading = false;
  bool isUpdating = false;

  Future<void> updateDepot() async {
    isUpdating = true;
    update();
    try {
      await DepotFuel().updatedepot(Get.find<DepotController>().depottrans);
      Get.snackbar('Success', 'Depot updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update depot: $e');
    } finally {
      isUpdating = false;
      update();
    }
  }
}