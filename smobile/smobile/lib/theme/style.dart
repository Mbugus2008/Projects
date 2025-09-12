import 'package:flutter/material.dart';
import 'package:smobile/myapp/Utilities.dart';

ThemeData appTheme() => ThemeData(
      // backgroundColor: HexColor('#E2EDF8'),
      // primaryColor: HexColor('#E2EDF8'),
      // scaffoldBackgroundColor: HexColor('#E2EDF8'),
      primarySwatch: Colors.lime,

      accentColor: Colors.orange,
      cursorColor: Colors.orange,
      textTheme: TextTheme(
        headline3: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 45.0,
          color: Colors.orange,
        ),
        button: TextStyle(
          fontFamily: 'OpenSans',
        ),
        subtitle1: TextStyle(fontFamily: 'NotoSans'),
        bodyText2: TextStyle(fontFamily: 'NotoSans'),
      ),


    );
