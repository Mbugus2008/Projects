import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:t_matatu/controllers/Members.dart';
import 'package:t_matatu/controllers/header.dart';
import 'package:t_matatu/controllers/main.dart';
import 'package:t_matatu/controllers/vehicles/vehicles.dart';
import 'package:t_matatu/models/Utils/veh_mem.dart';
import 'package:t_matatu/models/vehicles/vehicle.dart';

import '../../controllers/TypesController.dart';
import '../../models/Utils/util.dart';

// class M_Autocomplete extends StatelessWidget {
//   TextEditingController textEditingController = TextEditingController();

//   String? caption;

//   FocusNode? focusNode = FocusNode();
//   final GlobalKey _autocompleteKey = GlobalKey();

//   M_Autocomplete(
//       {Key? key, required this.textEditingController, this.focusNode})
//       : super(key: key);

//   void clear() {
//     textEditingController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TypeAheadField<InputSuggetions>(
//       direction: VerticalDirection.down,
//       controller: textEditingController,
//       suggestionsCallback: (search) {
//         List<InputSuggetions>? returnResult = [];
//         if (search.length >= 2) {
//           returnResult = Get.find<HeaderController>()
//               .suggestions
//               .where((InputSuggetions option) {
//             return option
//                 .toString()
//                 .toLowerCase()
//                 .contains(search.toLowerCase());
//           }).toList();
//         }
//         if (search.isEmpty) {
//           Get.find<MemberController>().clearcurrentvehicle();
//         }
//         return Future.value(returnResult);
//       },
//       builder: (context, controller, focusNode) {
//         return TextField(
//           controller: controller,
//           focusNode: focusNode,
//           autofocus: true,
//           textAlign: TextAlign.center,
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(
//               prefixIcon: Icon(
//                 Icons.bus_alert,
//                 color: Colors.blue,
//               ),
//               contentPadding: EdgeInsets.only(left: 50),
//               labelText: 'Vehicle / Member',
//               floatingLabelAlignment: FloatingLabelAlignment.center),
//         );
//       },
//       itemBuilder: (context, city) {
//         if (city.type == SuggestionType.vehicle) {
//           return ListTile(
//             tileColor: Color.fromARGB(255, 198, 231, 198),
//             leading: Icon(Icons.bus_alert),
//             title: Text(city.Vehicle.toString()),
//             subtitle: Text(
//               '${city.Account.toString()} - ${vehicle_type_desc.desc[city.Vehicle_Type]} - ${city.Fleet.toString()}',
//               overflow: TextOverflow.ellipsis,
//             ),
//             trailing: Text(city.Fleet ?? ""),
//           );
//         } else {
//           return ListTile(
//               leading: Icon(Icons.supervised_user_circle),
//               tileColor: Color.fromARGB(255, 222, 230, 222),
//               title: Text(city.Account.toString()),
//               subtitle: Text(
//                 '${city.Fleet.toString()} - ${city.Account.toString()} - ${city.Fleet.toString()}',
//                 overflow: TextOverflow.ellipsis,
//               ),
//               trailing: Text(city.Vehicle ?? ""));
//         }
//       },

//       onSelected: (selection) {
//         Get.find<HeaderController>().createheader();
//         Get.find<HeaderController>().currTrans.clear();
//         Get.find<MainController>().vehsummary.clear();
//         Get.find<MemberController>().initialize();
//         //Get.find<TransTypeController>().loading..value = true;
//         switch (selection.type) {
//           case SuggestionType.vehicle:
//             {
//               textEditingController.text = selection.Vehicle.toString();
//               Get.find<HeaderController>().currHeader.value.Account =
//                   selection.Account;
//               Get.find<HeaderController>().currHeader.value.Vehicle =
//                   selection.Vehicle;
//               Get.find<HeaderController>().currHeader.value.Fleet =
//                   selection.Fleet;
//               Get.find<MemberController>()
//                   .getcurrentcrew(selection.Vehicle.toString());
//               Get.find<VehiclesController>()
//                   .getvehtrans(selection.Vehicle.toString(), getdate());
//               Get.find<VehiclesController>().Currentvehicle.value = null;
//               //Get.find<VehiclesController>()
//               //.getcurrvehicle(selection.Vehicle.toString());
//               break;
//             }
//           default:
//             textEditingController.text = selection.Account.toString();
//             Get.find<HeaderController>().currHeader.value.Account =
//                 selection.Account;
//             // Get.find<TransTypeController>().vehicleTrantypes.clear();
//             Get.find<TransTypeController>().alltrantypes.forEach((element) {
//               if (element.Code == "SAVINGSCREW") {
//                 element.Name = '${element.Name2}(${selection.Account})';
//               }
//             });
//             break;
//           // TODO: Handle this case.
//         }

//         // FocusScope.of(context).requestFocus(focusNode);
//       },

//       debounceDuration: const Duration(seconds: 0), // debounceDuration,
//       hideOnSelect: true, // settings.hideOnSelect.value,
//       hideOnUnfocus: true, // settings.hideOnUnfocus.value,
//       hideWithKeyboard: true, // settings.hideOnUnfocus.value,
//       retainOnLoading: true,
//       hideOnEmpty: true,
//       // settings.retainOnLoading.value,
//     );
//   }
// }
