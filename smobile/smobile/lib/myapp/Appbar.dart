import 'package:flutter/material.dart';
import 'package:smobile/myapp/Utilities.dart';

class GradientAppBar extends StatelessWidget with PreferredSizeWidget {
  static const _defaultHeight = 56.0;

  final double elevation;

  final Widget title;
  final double barHeight;

  GradientAppBar(
      {this.elevation = 3.0,

        required this.title,
        this.barHeight = _defaultHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.white,
              activeColor[progressVal.value].withOpacity(0.5),
              activeColor[progressVal.value]
            ]),
      ),
      child: AppBar(
        title: title,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(barHeight);
}