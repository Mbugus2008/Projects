import 'package:flutter/material.dart';

class widgets {
  BoxDecoration container1(BuildContext context) => BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors
                  .transparent, // Theme.of(context).primaryColor.withAlpha(100),
              offset: Offset(0.0, 0.75),
              blurRadius: 20,
              spreadRadius: 2)
        ],
        //color: Theme.of(context).primaryColor.withAlpha(10),
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
          colors: [Color.fromARGB(255, 209, 209, 206), Colors.blue]));

  BoxDecoration container3(BuildContext context) => BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Theme.of(context).primaryColor.withAlpha(100),
            offset: Offset(0.0, 0.75),
            blurRadius: 20,
            spreadRadius: 2)
      ],
      gradient: const LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 209, 209, 206),
            Color.fromARGB(255, 210, 218, 223)
          ]));

  BoxDecoration border(BuildContext context) =>
      BoxDecoration(color: Colors.transparent, border: Border.all());

  BoxDecoration backgroundimage(BuildContext context) => const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/baraka.jpg"),
          fit: BoxFit.cover,
          opacity: 0.08,
          filterQuality: FilterQuality.high,
        ),
      );
}

Card mycard(BuildContext context, Widget widget) {
  return Card(
    elevation: 2000,
    shadowColor: Theme.of(context).primaryColor,
    color: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 1.0,
      ),
    ),
    child: widget,
  );
}
