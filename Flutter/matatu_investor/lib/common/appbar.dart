import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matatu/common/Controller.dart';

class appbar extends StatelessWidget {
  MemberController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Text(
          controller.data.value.Name.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),

      backgroundColor: Colors.blue, // Custom background color
      elevation: 20, // Remove shadow
    );
  }
}
