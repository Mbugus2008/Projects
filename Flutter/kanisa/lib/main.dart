import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kanisa/Network/Apis.dart';
import 'package:kanisa/controllers/dimension_controller.dart';
import 'package:kanisa/controllers/payment_controller.dart';
import 'package:kanisa/models/account_model.dart';
import 'package:kanisa/screens/my_account_screen.dart';
import 'package:kanisa/screens/payment_history_screen.dart';
import 'package:kanisa/screens/payment_screen.dart';
import 'package:kanisa/screens/registration_screen.dart';
import 'package:kanisa/services/logger.dart';
import 'package:kanisa/splash.dart';
import 'package:open_filex/open_filex.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Get.put(LoggerService(), permanent: true);
  Get.put(ImageSliderController());
  Get.put(DimensionController());
  Get.put(PaymentController());
  Get.put(UpdateController());

  if (Platform.isAndroid) {
    [
      Permission.storage,
    ].request().then((status) async {
      runApp(MyApp());
      // After app starts, check for updates
      Future.delayed(const Duration(seconds: 2), () {
        Get.find<UpdateController>().checkForUpdate();
      });
    });
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ApiClient api = ApiClient();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kanisa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: Colors.green,
        ),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Welcome(),
      getPages: [
        GetPage(
            name: '/myaccount', page: () => MyAccountScreen(cust: Customer())),
        GetPage(name: '/register', page: () => RegistrationScreen()),
        GetPage(
            name: '/payments', page: () => PaymentScreen(customer: Customer())),
        GetPage(
            name: '/payment-history',
            page: () => PaymentHistoryScreen(customer: Customer())),
      ],
    );
  }

  void navigateToAccount() async {
    String? phoneNumber = await getPhoneNumber();
    if (phoneNumber != null) {
      Customer? isRegistered = await api.checkCustomerExists(phoneNumber);
      if (isRegistered != null) {
        Get.to(() => MyAccountScreen(cust: isRegistered));
      } else {
        Get.to(() => RegistrationScreen());
      }
    } else {
      print("No phone number found in preferences.");
    }
  }

  Future<String?> getPhoneNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('phone_number');
  }

  Future<Customer> fetchCustomerData(String phoneNumber) async {
    // Implement fetching customer data logic
    return Customer(); // Placeholder
  }
}

class UpdateController extends GetxController {
  var latestVersion = "".obs;
  var apkUrl = "".obs;
  var changelog = "".obs;
  var isDownloading = false.obs;
  var progress = 0.0.obs;

  Future<void> checkForUpdate() async {
    try {
      final response = await http
          .get(Uri.parse("https://trimline.co.ke/apps/kanisa/update.json"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        latestVersion.value = data["latest_version"];
        apkUrl.value = data["apk_url"];
        changelog.value = data["changelog"];

        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        String currentVersion = packageInfo.version;

        if (latestVersion.value != currentVersion) {
          _showUpdateDialog();
        }
      }
    } catch (e) {
      debugPrint("Update check failed: $e");
    }
  }

  void _showUpdateDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text("Update Available"),
        content: Obx(() {
          if (isDownloading.value) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    "Downloading update... ${progress.value.toStringAsFixed(0)}%"),
                const SizedBox(height: 10),
                LinearProgressIndicator(value: progress.value / 100),
              ],
            );
          }
          return Text(
              "New version ${latestVersion.value} is available.\n\n${changelog.value}");
        }),
        actions: [
          Obx(() => !isDownloading.value
              ? TextButton(
                  child: const Text("Later"),
                  onPressed: () => Get.back(),
                )
              : const SizedBox.shrink()),
          Obx(() => !isDownloading.value
              ? ElevatedButton(
                  child: const Text("Update Now"),
                  onPressed: () {
                    _downloadAndInstallApk(apkUrl.value);
                  },
                )
              : const SizedBox.shrink()),
        ],
      ),
      barrierDismissible: false,
    );
  }

  Future<void> _downloadAndInstallApk(String url) async {
    try {
      isDownloading.value = true;
      final dir = await getExternalStorageDirectory();
      final filePath = "${dir!.path}/update.apk";

      await Dio().download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            progress.value = (received / total * 100);
          }
        },
      );

      isDownloading.value = false;
      Get.back(); // close dialog
      await OpenFilex.open(filePath); // triggers Android install prompt
    } catch (e) {
      isDownloading.value = false;
      Get.snackbar("Update Failed", "Could not download update: $e");
    }
  }
}
