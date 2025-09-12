import 'package:flutter/material.dart';

class widgets {
  BoxDecoration container1(BuildContext context) => BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Theme.of(context).primaryColor.withAlpha(100),
              offset: Offset(0.0, 0.75),
              blurRadius: 20,
              spreadRadius: 2)
        ],
        color: Theme.of(context).primaryColor.withAlpha(80),
      );
  BoxDecoration container2(BuildContext context) => BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Theme.of(context).primaryColor.withAlpha(100),
            offset: Offset(0.0, 0.75),
            blurRadius: 20,
            spreadRadius: 2)
      ],
      gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: const [Color.fromARGB(255, 209, 209, 206), Colors.blue]));

  BoxDecoration container3(BuildContext context) => BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Theme.of(context).primaryColor.withAlpha(200),
            offset: Offset(0.0, 0.75),
            blurRadius: 5,
            spreadRadius: 1)
      ],
      gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomRight,
          colors: const [
            Color.fromARGB(255, 209, 209, 206),
            Color.fromARGB(255, 210, 218, 223)
          ]));

  BoxDecoration border(BuildContext context) =>
      BoxDecoration(color: Colors.transparent, border: Border.all());

  BoxDecoration backgroundimage(BuildContext context) => BoxDecoration(
        image: DecorationImage(
          image: AssetImage("Assets/lopha.png"),
          fit: BoxFit.cover,
          opacity: 0.2,
          filterQuality: FilterQuality.high,
        ),
      );
}
