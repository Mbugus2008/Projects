// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:t_matatu/controllers/vehicles/vehicles.dart';
import 'package:t_matatu/models/Utils/util.dart';
import 'package:t_matatu/models/expences.dart';
import 'package:t_matatu/models/mappings.dart';
import 'package:t_matatu/models/vehicles/vehicle.dart';
import 'package:t_matatu/network/Apis.dart';
import 'package:t_matatu/network/errors.dart';
import 'package:t_matatu/network/request.dart';
import 'package:t_matatu/network/results/results.dart';

class DepotFuel implements Tomaps {
  String? Key;
  String? Vehicle;
  String? Fleet;
  bool? _On_route;
  bool? get On_route => _On_route;
  set On_route(bool? value) {
    _On_route = value;
    DepotController().updateCheckAll();
  }
  bool? _Run_Back ;
  bool? get Run_Back => _Run_Back;
  set Run_Back(bool? value) {
    _Run_Back = value;
  }
  DateTime? Run_Bak_Time;
  



  DateTime? From;
  String? Nro_Defects;
  String? _Descrition;
  String? get Descrition => _Descrition;
  set Descrition(String? value) {
    print("New description: $value");
   _Descrition = value;
    desc_editor.text = value ?? '';
  }
  DateTime? Date;
  String? User;
  vehicle_type? Capacity;
  int? _Millage;

  int? get Millage => _Millage;

  set Millage(int? value) {
    _Millage = value;
    //milleage_editor.text =  value.toString();
  }
  String? Driver;
  String? Conductor;
  double? Offload;
  double? _Fuel;
  double? get Fuel => _Fuel;
  set Fuel(double? value) {
    _Fuel = value;
    Balance= (Amount_Paid ?? 0) - (value ??0);
    //fuel_editor.text =  value.toString();
  }
  double? _Amount_Paid;
  double? get Amount_Paid => _Amount_Paid;
  set Amount_Paid(double? value) {
    _Amount_Paid = value;
    Balance= (value ?? 0) - (Fuel ??0);
    //amountpaid_editor.text = value.toString();
  }
  double? Balance;
  double? Net_Offload;
  double? _Total_litres;
  double? get Total_litres => _Total_litres;
  set Total_litres(double? value) {
    _Total_litres = value;
  
    //litres_editor.text = value.toString();
  }
  double? Km_Litre;
  String? Fuel_Agent;
  String? Driver_Name;
  String? Conductor_Name;

  final TextEditingController Nro_Defects_editor = TextEditingController();
  final TextEditingController desc_editor = TextEditingController();
  final TextEditingController fuel_editor = TextEditingController();
  final TextEditingController amountpaid_editor = TextEditingController();
  final TextEditingController milleage_editor = TextEditingController();
 final TextEditingController litres_editor = TextEditingController();
  DepotFuel({
    this.Key,
    this.Vehicle,
    this.Fleet,
    bool? On_route,
    this.From,
    this.Nro_Defects,
    String? Descrition,
    this.Date,
    this.User,
    this.Capacity,
    int? Millage,
    this.Driver,
    this.Conductor,
    this.Offload,
    double? Fuel,
    double? Amount_Paid,
    this.Balance,
    this.Net_Offload,
    double? Total_litres,
    double? Km_Litre,
    String? Fuel_Agent,
    String? Driver_Name,
    String? Conductor_Name,
    bool? Run_Back,
    DateTime? Run_Bak_Time,
  }) : _Millage = Millage, _Amount_Paid = Amount_Paid, _Fuel = Fuel, _On_route = On_route,_Descrition = Descrition,_Total_litres = Total_litres,_Run_Back = Run_Back;
  @override
  String toString() {
    return '$Vehicle $Fleet';
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'Vehicle': Vehicle,
      'Fleet': Fleet,
      'On_route': On_route,
      'From': From != null ? formattedTime.format(From!) : null,
      'Nro_Defects': Nro_Defects,
      'Descrition': Descrition,
      'Date': formattedDate.format(Date ?? getdate()),
      'User': User,
      'Capacity': Capacity?.index,
      'Millage': Millage,
      'Driver': Driver,
      'Conductor': Conductor,
      'Offload': Offload,
      'Fuel': Fuel,
      'Amount_Paid': Amount_Paid,
      'Balance': Balance,
      'Net_Offload': Net_Offload,
      'Total_litres': Total_litres,
      'Km_Litre': Km_Litre,
      'Fuel_Agent': Fuel_Agent,
      'Driver_Name': Driver_Name,
      'Conductor_Name': Conductor_Name,
      'Run_Back': Run_Back,
      'Run_Bak_Time': Run_Bak_Time != null ? formattedTime.format(Run_Bak_Time!) : null,
    };
  }

  factory DepotFuel.fromMap(Map<String, dynamic> map) {
    final dateFormat = DateFormat('HH:mm:ss');
    DateTime? parsedDate,runbacktime;
    try {
      parsedDate = dateFormat.parse(map['From'] as String);
      runbacktime =dateFormat.parse(map['Run_Bak_Time'] as String);
    } catch (e) {}
    return DepotFuel(
      Key: map['Key'] != null ? map['Key'] as String : null,
      Vehicle: map['Vehicle'] != null ? map['Vehicle'] as String : null,
      Fleet: map['Fleet'] != null ? map['Fleet'] as String : null,
      On_route: map['On_route'] != null ? map['On_route'] as bool : null,
      From: parsedDate,
      Nro_Defects:
          map['Nro_Defects'] != null ? map['Nro_Defects'] as String : null,
      Descrition:
          map['Descrition'] != null ? map['Descrition'] as String : null,
      Date: map['Date'] != null
          ? DateFormat("MM/dd/yyyy").parse((map['Date'] ?? 0))
          : null,
      User: map['User'] != null ? map['User'] as String : null,
      Capacity: map['Capacity'] != null
          ? vehicle_type.values[(map['Capacity']) as int]
          : null,
      Millage: map['Millage'] != null ? map['Millage'] as int : null,
      Driver: map['Driver'] != null ? map['Driver'] as String : null,
      Conductor: map['Conductor'] != null ? map['Conductor'] as String : null,
      Offload: map['Offload'] != null ? map['Offload'] as double : null,
      Fuel: map['Fuel'] != null ? map['Fuel'] as double : null,
      Amount_Paid:
          map['Amount_Paid'] != null ? map['Amount_Paid'] as double : null,
      Balance: map['Balance'] != null ? map['Balance'] as double : null,
      Net_Offload:
          map['Net_Offload'] != null ? map['Net_Offload'] as double : null,
      Total_litres:
          map['Total_litres'] != null ? map['Total_litres'] as double : null,
      Km_Litre: map['Km_Litre'] != null ? map['Km_Litre'] as double : null,
      Fuel_Agent:
          map['Fuel_Agent'] != null ? map['Fuel_Agent'] as String : null,
      Driver_Name:
          map['Driver_Name'] != null ? map['Driver_Name'] as String : null,
      Conductor_Name: map['Conductor_Name'] != null
          ? map['Conductor_Name'] as String
          : null,
      Run_Back: map['Run_Back'] != null ? map['Run_Back'] as bool : null,
      Run_Bak_Time: runbacktime,
    );
  }
  String toJson() => json.encode(toMap());
  factory DepotFuel.fromJson(String source) =>
      DepotFuel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  fromMap_table(Map<String, dynamic> map) {
    return DepotFuel.fromMap(map);
  }

  Future<void> getNRODefects() async {
    try {
      var request = Request(body: null);
      ApiClient().postdata("NRODefects", request.toJson()).then((r) async {
        if (r.statusCode == 200) {
          Results<Expenses> results =
              Results<Expenses>.fromJson(r.body, Expenses.fromMap);
          if (results.Code == 0) {
            if (results.Contents != null) {
              Get.find<VehiclesController>().NRODefects.value =
                  results.Contents as List<Expenses>;
            }
          }
        }
      });
    } on Exception catch (e) {
      Errors().report(e);
    }
  }

  Future<void> getdata(DateTime date) async {
    var request = Request(body: null, date: date);
    await ApiClient()
        .postdata("getdepotdata", request.toJson())
        .then((r) async {
      if (r.statusCode == 200) {
        Results<DepotFuel> results =
            Results<DepotFuel>.fromJson(r.body, DepotFuel.fromMap);
        if (results.Code == 0) {
          if (results.Contents != null) {
            var ll = (results.Contents ?? []);
            ll.sort((a, b) => a.Fleet!.compareTo(b.Fleet.toString()));
            Get.find<DepotController>().updateDepotTrans(ll); // Use the new method
            Get.find<DepotController>().depottrans1.value = ll;
          }
        }
      }
    });
  }

  Future<void> updatedepot(List<DepotFuel> depots) async {
    Get.find<DepotController>().updating .value = true;
    for (var depot in depots) {
      ApiClient().postdata("setdepotdata", depot.toJson()).then((r) async {
        if (r.statusCode == 200) {
          Results2<DepotFuel> results =
              Results2<DepotFuel>.fromJson(r.body, DepotFuel.fromMap);
          if (results.Code == 0) {
            if (results.Contents != null) {
              if (results.Contents != null) {
                depot = results.Contents!;
              }
            }
          }
        }
      });
    }
    Get.find<DepotController>().updating .value = false;
  }

String serializeDepotList(List<DepotFuel> depots) {
  List<Map<String, dynamic>> jsonList = depots.map((depot) => depot.toMap()).toList();
  return json.encode(jsonList);
}

}

class DepotController extends GetxController {
  RxBool checkall = false.obs;
  RxBool updating = false.obs;
  final RxList<DepotFuel> depottrans = <DepotFuel>[].obs;
  final RxList<DepotFuel> depottrans1 = <DepotFuel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize depottrans here if it's not being initialized elsewhere
    depottrans.value = [];
    //depottrans1.value = [];
    // Fetch initial data
    DepotFuel().getdata(DateTime.now());
  }

  void updateCheckAll() {
    var selected = Get.find<DepotController>()
        .depottrans.any((dt)=> dt.On_route== false);

    checkall.value = !selected;// Get.find<VehiclesController>().depottrans.any((dt)=> dt.On_route== false);

    update();
  }

  @override
  void onClose() {
    // Clean up resources if needed
    super.onClose();
  }

  void checkallvehicles(bool check) {
    for (var element in Get.find<DepotController>().depottrans) {
      element.On_route = check;
      element.From = getdatetime();
    }
    updateCheckAll();
  }

  void updateDepotTrans(List<DepotFuel> newDepotTrans) {
    Get.find<DepotController>().depottrans.value = newDepotTrans;
    update(); // This will notify all GetBuilder widgets to rebuild
  }
    void filterDepotTrans(String value) {
    value = value.toUpperCase();
    print("Filtering1 ${Get.find<DepotController>().depottrans1.length}");
    print("Filtering ${Get.find<DepotController>().depottrans.length}");
    Get.find<DepotController>().depottrans.value = Get.find<DepotController>().depottrans1.where((item) {
      return item.toString().toUpperCase().contains(value);
    }).toList();
  }
}
