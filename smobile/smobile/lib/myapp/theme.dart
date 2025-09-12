import 'package:flutter/material.dart';

import 'Utilities.dart';


class TempWidget extends StatelessWidget {
  final double temp;
  final Function(double) changeTemp;

  const TempWidget({Key? key, required this.temp, required this.changeTemp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TransparentCard(
        child: Column(

          children: [
            Center(
              child: const Text(
                "Color Scheme",

                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),

            Row(

              children: [

                Expanded(
                  child: Slider(
                      min: 16,
                      max: 30,
                      value: temp,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white30,
                      onChanged: changeTemp),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
