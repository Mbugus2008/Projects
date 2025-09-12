import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_matatu/controllers/Members.dart';
import 'package:t_matatu/controllers/main.dart';
import 'package:t_matatu/pages/TwoTabScreen.dart';
import 'package:t_matatu/pages/receipt.dart';
import 'package:t_matatu/pages/setting.dart';


class HomePage extends GetView<MainController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeList = Get.find<MainController>().CurrentClient?.value.homelist();
    return Scaffold(
      appBar: (homeList is! TwoTabScreen) ? AppBar(
        title: Text(Get.find<MainController>().CurrentClient?.value.clientName ?? ''),
        actions: [
           Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: _buildAnimatedAddReceiptButton(),
              )
           
        ],
      ) : null,
      body:
         (controller.isLoading.value == true) ?
           Center(child: CircularProgressIndicator())
        :
         Get.find<MainController>().CurrentClient?.value.homelist() ?? Container(),
      
      drawer: CustomDrawer(),);
  
  }

  Widget _buildAnimatedAddReceiptButton() {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.8, end: 1.0),
      duration: Duration(seconds: 1),
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: ElevatedButton.icon(
        icon: Icon(Icons.receipt_long_rounded, size: 24, color: Colors.white),
        label: Text('Add Receipt', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        onPressed: (){ Get.find<MainController>().vehsummary.clear();  
               Get.find<MemberController>().currentcrew.clear();  
             Get.to(() => Receipt());},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          elevation: 5,
          shadowColor: Colors.greenAccent,
        ),
      ),
    );
  }
}
