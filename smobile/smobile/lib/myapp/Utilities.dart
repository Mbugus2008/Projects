import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rainbow_color/rainbow_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class utilities {
  static final DateFormat formatter = DateFormat('dd-MMM-yyyy');
  static final DateFormat loandateformatter = DateFormat('MMM-yyyy');
  static final NumberFormat formatcurrency = NumberFormat.currency(locale: "en_KE", symbol: "");

  static final NumberFormat formatno = NumberFormat("#", "en_Ke");

}
 final currency = "KES ";

double degToRad(num deg) => deg * (pi / 180.0);

double normalize(value, min, max) {


double r =  ((value - min) / (max - min));
// Obtain shared preferences.
 // final prefs = await SharedPreferences.getInstance();
return r;
}

double angleRange(value, min, max)=>(value * (max-min) +min);

const double kDiameter = 200;
const double kMinDegree = 16;
const double kMaxDegree = 30;


void interval(double val){
  progressVal = ValueNotifier( normalize(val, kMinDegree, kMaxDegree));
}

bool isActive = false;
int speed = 1;
double temp = 22.85;

 ValueListenable<double> progressVal =new ValueNotifier(0.2);//   0.2;


var activeColor = Rainbow(spectrum: [
  const Color(0xFF33C0BA),
  const Color(0xFF1086D4),
  const Color(0xFF6D04E2),
  const Color(0xFFC421A0),
  const Color(0xFFE4262F)
], rangeStart: 0.0, rangeEnd: 1.0);

class TransparentCard extends StatelessWidget {
  final Widget child;

  const TransparentCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        color: Colors.white.withOpacity(0.5),
      ),
      child: Padding(padding: const EdgeInsets.all(0.0), child: child),
    );
  }
}
    BoxDecoration decoration = BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
    Colors.white,
    activeColor[progressVal.value].withOpacity(0.5),
    activeColor[progressVal.value]
    ])
    );