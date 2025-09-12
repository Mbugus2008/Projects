import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matatu/common/Controller.dart';
import 'package:matatu/main.dart';
import 'package:matatu/member/Trans/collectionspage.dart';
import 'package:matatu/utilities.dart';

import 'vehicle_types.dart';
import 'vehicles.dart';

class Vehicles_widgets extends Vehicles {
  double w = 60;
  SizedBox vehicledetails(BuildContext context, Vehicles veh) {
    return SizedBox(
      width: w,
      child: Column(
        children: [
          Text(
            veh.Vehicle_Number.toString(),
            style: Theme.of(context).textTheme.vamounts_header,
          ),
          Text(
            '${veh.Vehicle_Type?.value}',
            style: TextStyle(fontSize: 10),
          ),
          Text(
            utilities.formatter.format(veh.Start_Date!),
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }

  Container parking(BuildContext context, Vehicles veh) {
    return Container(
      width: w,
      color: veh.Parking_Balance! < 0 ? Colors.red : Colors.white,
      //decoration: widgets().container3(context),
      child: Column(
        children: [
          Spacer(),
          Align(
              alignment: Alignment.centerRight,
              child: Text(
                utilities.formatcurrency.format(veh.Parking_Balance),
                style: Theme.of(context).textTheme.vamounts,
              )),
          Spacer(),
          Align(
              alignment: Alignment.centerRight,
              child: Text(
                '/ ${utilities.formatcurrency.format(veh.Parking_Fee)}',
                style: TextStyle(fontSize: 10, color: Colors.black),
              )),
        ],
      ),
    );
  }

  SizedBox todaycollections(BuildContext context, Vehicles veh) {
    return SizedBox(
      width: w,
      child: Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              utilities.formatcurrency.format(veh.Total_collection),
              style: Theme.of(context).textTheme.vamounts,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  SizedBox savings(BuildContext context, Vehicles veh) {
    return SizedBox(
      width: w,
      child: Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              utilities.formatcurrency.format(veh.Savings_and_xmas),
              style: Theme.of(context).textTheme.vamounts,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  SizedBox operation2(BuildContext context, Vehicles veh) {
    return SizedBox(
      width: w,
      child: Column(
        children: [
          Spacer(),
          Align(
              alignment: Alignment.centerRight,
              child: Text(
                utilities.formatcurrency.format(veh.Operation_2),
                style: Theme.of(context).textTheme.vamounts,
              )),
          Spacer(),
        ],
      ),
    );
  }

  buildItem(BuildContext context, int index, List<Vehicles> vehicles) {
    MemberController controller = Get.find();
    return Row(
      children: [
        Card(
          margin: EdgeInsets.only(bottom: 2, left: 5),
          elevation: 20,
          child: SizedBox(
              width: MediaQuery.of(context).size.width - 17,
              height: 40,
              child: GestureDetector(
                onTap: () {
                  controller.getvcollections(vehicles[index]);
                  Get.to(() => collectionspage(veh: vehicles[index]));
                },
                child: Row(
                  children: [
                    vehicledetails(context, vehicles[index]),
                    Spacer(),
                    parking(context, vehicles[index]),
                    Spacer(),
                    operation2(context, vehicles[index]),
                    Spacer(),
                    savings(context, vehicles[index]),
                    Spacer(),
                    todaycollections(context, vehicles[index]),
                  ],
                ),
              )),
        )
      ],
    );
  }
}

class Vsummary extends StatelessWidget {
  Vsummary({
    Key? key,
    required this.vehicles,
  }) : super(key: key);

  final List<Vehicles>? vehicles;
  double w = 60;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        totalvehicles(context),
        Spacer(),
        parkingsummary(context),
        Spacer(),
        operation2(context),
        Spacer(),
        savings(context),
        Spacer(),
        todays(context)
      ],
    );
  }

  SizedBox todays(BuildContext context) {
    return SizedBox(
      width: w,
      child: Column(
        children: [
          Text(
            "Todays",
            style: Theme.of(context).textTheme.vamounts_header,
          ),
          Text(
            "Col",
            style: Theme.of(context).textTheme.vamounts_header,
          ),
          Spacer(),
        ],
      ),
    );
  }

  SizedBox savings(BuildContext context) {
    return SizedBox(
      width: w,
      child: Column(
        children: [
          Text(
            "Savings",
            style: Theme.of(context).textTheme.vamounts_header,
          ),
          Text(
            "Xmas",
            style: Theme.of(context).textTheme.vamounts_header,
          ),
        ],
      ),
    );
  }

  SizedBox operation2(BuildContext context) {
    return SizedBox(
        width: w,
        child: Column(
          children: [
            Text(
              "Operation",
              style: Theme.of(context).textTheme.vamounts_header,
            ),
            Text(
              "2",
              style: Theme.of(context).textTheme.vamounts_header,
            ),
            Spacer(),
          ],
        ));
  }

  SizedBox parkingsummary(BuildContext context) {
    return SizedBox(
      width: w,
      child: Column(
        children: [
          Text(
            "Parking",
            style: Theme.of(context).textTheme.vamounts_header,
          ),
          Spacer(),
          Text(
              '(${utilities.formatcurrency.format(vehicles?.map((item) => item.Parking_Fee).reduce((value, element) => value! + element!))})',
              style: Theme.of(context).textTheme.vamounts),
        ],
      ),
    );
  }

  SizedBox totalvehicles(BuildContext context) {
    return SizedBox(
        width: w,
        child: Column(
          children: [
            Text(
              "Vehicles",
              style: Theme.of(context).textTheme.vamounts_header,
            ),
            Spacer(),
          ],
        ));
  }
}

class Vtotals extends StatelessWidget {
  Vtotals({
    Key? key,
    required this.vehicles,
  }) : super(key: key);

  final List<Vehicles>? vehicles;
  double w = 60;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        totalvehicles(context),
        Spacer(),
        parkingsummary(context),
        Spacer(),
        operation2(context),
        Spacer(),
        savings(context),
        Spacer(),
        todays(context)
      ],
    );
  }

  SizedBox todays(BuildContext context) {
    return SizedBox(
      width: w,
      child: Column(
        children: [
          Spacer(),
          Text(
              utilities.formatcurrency.format(vehicles
                  ?.map((item) => item.Total_collection)
                  .reduce((value, element) => value! + element!)),
              style: Theme.of(context).textTheme.vamounts_header),
        ],
      ),
    );
  }

  SizedBox savings(BuildContext context) {
    return SizedBox(
      width: w,
      child: Column(
        children: [
          Spacer(),
          Text(
              utilities.formatcurrency.format(vehicles
                  ?.map((item) => item.Savings_and_xmas)
                  .reduce((value, element) => value! + element!)),
              style: Theme.of(context).textTheme.vamounts_header),
        ],
      ),
    );
  }

  SizedBox operation2(BuildContext context) {
    return SizedBox(
        width: w,
        child: Column(
          children: [
            Spacer(),
            Text(
                utilities.formatcurrency.format(vehicles
                    ?.map((item) => item.Operation_2)
                    .reduce((value, element) => value! + element!)),
                style: Theme.of(context).textTheme.vamounts_header),
          ],
        ));
  }

  SizedBox parkingsummary(BuildContext context) {
    return SizedBox(
      width: w,
      child: Column(
        children: [
          Spacer(),
          Text(
              utilities.formatcurrency.format(vehicles
                  ?.map((item) => item.Parking_Balance)
                  .reduce((value, element) => value! + element!)),
              style: Theme.of(context).textTheme.vamounts_header),
        ],
      ),
    );
  }

  SizedBox totalvehicles(BuildContext context) {
    return SizedBox(
        width: w,
        child: Column(
          children: [
            Spacer(),
            Text('${(vehicles?.length)}',
                style: Theme.of(context).textTheme.vamounts_header),
          ],
        ));
  }
}
