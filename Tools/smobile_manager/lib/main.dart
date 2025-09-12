import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'nav_setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SMobile Manager',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavSettingController navSettingController = Get.put(NavSettingController());
    return Scaffold(
      appBar: AppBar(title: const Text('Edit NAV Settings')),
      body: Form(
        key: navSettingController.formKey,
        child: ListView.builder(
          itemCount: navSettingController.navSettings.length,
          itemBuilder: (context, index) {
            final navSetting = navSettingController.navSettings[index];
            return Column(
              children: <Widget>[
                TextFormField(
                  initialValue: navSetting.Serverip,
                  decoration: const InputDecoration(labelText: 'Server IP'),
                  onSaved: (value) => navSetting.Serverip = value,
                ),
                TextFormField(
                  initialValue: navSetting.Port,
                  decoration: const InputDecoration(labelText: 'Port'),
                  onSaved: (value) => navSetting.Port = value,
                ),
                // Add more fields as needed
              ],
            );
          },
        ),
      ),
    );
  }
}

class NavSettingController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxList<NavSetting> navSettings = <NavSetting>[].obs;

  void updateNavSettings() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      update();
    }
  }
}
