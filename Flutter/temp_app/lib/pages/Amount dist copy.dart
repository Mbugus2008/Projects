import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:t_matatu/models/trantypes.dart';

import '../controllers/TypesController.dart';
import '../controllers/header.dart';
import '../controllers/vehicles/vehicles.dart';
import '../models/Transaction.dart' as tmatatu;
import '../models/vehicles/vehicle.dart';

class Distributes extends StatelessWidget {
  Distributes({
    super.key,
  });
  //BluetoothController bluetoothController = Get.find<BluetoothController>();

  TextEditingController recamount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          title: Obx(() {
            return Get.find<VehiclesController>().Currentvehicle.value != null
                ? Text(
                    '${Get.find<VehiclesController>().Currentvehicle.value?.Vehicle_Number} - ${Get.find<VehiclesController>().Currentvehicle.value?.Fleet_No}')
                : CircularProgressIndicator();
          }),
          titleTextStyle: const TextStyle(fontSize: 20, color: Colors.black),
          centerTitle: true,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height - 20,
          width: MediaQuery.of(context).size.width - 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(),
                    Container(
                      width: 200,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: recamount,
                        decoration: const InputDecoration(
                          labelText: "Amount Received",
                        ),
                        onChanged: (value) {
                          try {
                            if (value.isNotEmpty) {}
                          } catch (e) {
                            // Handle the case where parsing fails (e.g., non-numeric string)
                            print("Error: $e");
                          }
                        },
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Get.find<TransTypeController>()
                            .distribute(double.tryParse(recamount.text) ?? 0);
                      },
                      icon: const Icon(Icons.post_add_sharp),
                      iconSize: 50,
                    )
                  ],
                ),
              ),
              Obx(() {
                var cont = Get.find<TransTypeController>();
                return cont.loading.value == false
                    ? SizedBox(
                        height: 500,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: Get.find<TransTypeController>()
                              .vehicleTrantypes
                              .where((p0) => p0.Name != null)
                              .length,
                          itemBuilder: (context, index) {
                            return GetBuilder<TransTypeController>(
                                builder: (controller) {
                                  print('${controller.vehicleTrantypes[index]}');
                              return Card(
                                elevation: 10,
                                child: CheckboxListTile(
                                  dense: true,
                                  contentPadding:
                                      const EdgeInsets.only(left: 2),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '${controller.vehicleTrantypes[index].Name}(${NumberFormat("#,##0.00", "en_US").format(controller.vehicleTrantypes[index].Amounttoday ?? 0)}/${NumberFormat("#,##0.00", "en_US").format(controller.vehicleTrantypes[index].VehicleAmount ?? 0)})',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        NumberFormat("#,##0.00", "en_US")
                                            .format(controller
                                                    .vehicleTrantypes[index]
                                                    .Amountedited ??
                                                0),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  subtitle: Flexible(
                                    flex: 5,
                                    child: Visibility(
                                        visible: (controller
                                                    .vehicleTrantypes[index]
                                                    .VehicleAmount! ==
                                                0 ||
                                            controller.vehicleTrantypes[index]
                                                    .Code ==
                                                "SAVINGS" ||
                                            controller.vehicleTrantypes[index]
                                                    .Code ==
                                                "SAVINGSCREW"),
                                        child: TextFormField(
                                          focusNode: controller
                                              .vehicleTrantypes[index]
                                              .FocusNodes,
                                          keyboardType: TextInputType.number,
                                          controller: controller
                                              .vehicleTrantypes[index].eAmount,
                                          decoration: const InputDecoration(
                                              //labelText: "Amount",
                                              ),
                                          onChanged: (value) {
                                            try {
                                              controller.vehicleTrantypes[index]
                                                      .Amountedited =
                                                  double.parse(controller
                                                      .vehicleTrantypes[index]
                                                      .eAmount
                                                      .text);
                                            } catch (e) {
                                              // Handle the case where parsing fails (e.g., non-numeric string)
                                              print("Error: $e");
                                            }
                                          },
                                        )),
                                  ),

                                  //controlAffinity: ListTileControlAffinity.leading,
                                  tristate: true,
                                  checkColor: Colors.black,
                                  activeColor: Colors.red,
                                  value: controller
                                      .vehicleTrantypes[index].Checked,

                                  // Get.find<BluetoothController>().connected.value,
                                  onChanged: (bool? value) {
                                    controller.toggle(index);
                                    if (value == true) {
                                      if ((controller.vehicleTrantypes[index]
                                                  .Amounttoday ==
                                              controller.vehicleTrantypes[index]
                                                  .VehicleAmount) &&
                                          controller.vehicleTrantypes[index]
                                                  .VehicleAmount! >
                                              0) {
                                        _showConfirmationDialog(
                                            context,
                                            controller.vehicleTrantypes[index],
                                            index);
                                      } else {
                                        double? vehicleamount = controller
                                            .vehicleTrantypes[index]
                                            .VehicleAmount;

                                        double? bal = vehicleamount! > 0
                                            ? vehicleamount -
                                                controller
                                                    .vehicleTrantypes[index]
                                                    .Amounttoday!
                                            : 0;
                                        bal = bal < 0 ? 0 : bal;
                                        // controller.vehicleTrantypes[index].eAmount
                                        // .text = '$bal';
                                        controller.vehicleTrantypes[index]
                                            .eAmount.text = '$bal';
                                        Get.find<TransTypeController>()
                                            .vehicleTrantypes[index]
                                            .Amountedited = bal;
                                      }
                                    } else {
                                      controller.vehicleTrantypes[index].eAmount
                                          .text = '0.0';
                                      controller.vehicleTrantypes[index]
                                          .Amountedited = 0.0;
                                    }
                                    FocusScope.of(context).requestFocus(
                                        controller.vehicleTrantypes[index]
                                            .FocusNodes);
                                    controller.vehicleTrantypes[index].eAmount
                                        .selection = TextSelection(
                                      baseOffset: 0,
                                      extentOffset: controller
                                          .vehicleTrantypes[index]
                                          .eAmount
                                          .text
                                          .length,
                                    );
                                  },
                                ),
                              );
                            });
                          },
                        ),
                      )
                    : const CircularProgressIndicator();
              }),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Text(
                    NumberFormat("#,##0.00", "en_US")
                        .format(Get.find<TransTypeController>().get_selected()),
                    style: const TextStyle(fontSize: 30),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      HeaderController().createlines();
                      Get.find<HeaderController>().curTran =
                          tmatatu.Trans().obs;
                      Get.find<VehiclesController>().Currentvehicle =
                          Vehicles().obs;
                      Get.back();
                    },
                    icon: const Icon(Icons.check),
                    color: Colors.blue,
                    iconSize: 50,
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(
      BuildContext context, TranTypes types, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${types.Name} '),
          content: Text('${types.Name} is paid in full today. Add?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(false); // Return false to indicate cancellation
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(true); // Return true to indicate confirmation
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    ).then((value) {
      if (value != null && value) {
        double? vehicleamount = Get.find<TransTypeController>()
            .vehicleTrantypes[index]
            .VehicleAmount;

        double? bal = vehicleamount! > 0
            ? vehicleamount -
                Get.find<TransTypeController>()
                    .vehicleTrantypes[index]
                    .Amounttoday!
            : 0;
        bal = bal < 0 ? 0 : bal;
        // controller.vehicleTrantypes[index].eAmount
        // .text = '$bal';
        Get.find<TransTypeController>().vehicleTrantypes[index].eAmount.text =
            '${Get.find<TransTypeController>().vehicleTrantypes[index].VehicleAmount}';
        Get.find<TransTypeController>().vehicleTrantypes[index].Amountedited =
            Get.find<TransTypeController>()
                .vehicleTrantypes[index]
                .VehicleAmount;
      } else {
        Get.find<TransTypeController>().vehicleTrantypes[index].Checked = false;
      }
    });
  }
}
