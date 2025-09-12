// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_matatu/controllers/main.dart';
import 'package:t_matatu/providers/clients/Citihoppa.dart';
import 'package:t_matatu/providers/clients/Kmos.dart';

class ThemeConfig {
  String primaryColor;
  String accentColor;

  ThemeConfig({required this.primaryColor, required this.accentColor});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'primaryColor': primaryColor,
      'accentColor': accentColor,
    };
  }

  factory ThemeConfig.fromMap(Map<String, dynamic> map) {
    return ThemeConfig(
      primaryColor: (map['primaryColor'] ?? '') as String,
      accentColor: (map['accentColor'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThemeConfig.fromJson(String source) =>
      ThemeConfig.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AppConfig {
  String? apiBaseUrl;
  String? clientId;
  String? clientName;
  String? logo;
  ThemeConfig? theme;

  AppConfig({
    this.apiBaseUrl,
    this.clientId,
    this.clientName,
    this.logo,
    this.theme,
  });

  AppConfig.init();
  static Future<AppConfig?> loadConfig(String client) async {
    // Load the JSON file
    String jsonContent = await rootBundle.loadString('assets/config.json');
    Map<String, dynamic> parsedJson = jsonDecode(jsonContent);
    List<AppConfig> clients = List<AppConfig>.from(
        parsedJson['clients'].map((x) => AppConfig.fromJson(jsonEncode(x))));
    AppConfig? config =
        clients.firstWhereOrNull((element) => element.clientId == client);
    switch (client) {
      case "01":
        {
          Get.find<MainController>().CurrentClient = Cityhoppa().obs;
        }
      case "02":
        {
          Get.find<MainController>().CurrentClient = Kmos().obs;
        }
    }

    return config;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'apiBaseUrl': apiBaseUrl,
      'clientId': clientId,
      'clientName': clientName,
      'logo': logo,
      'theme': theme?.toMap(),
    };
  }

  String toJson() => json.encode(toMap());
  factory AppConfig.fromMap(Map<String, dynamic> map) {
    return AppConfig(
      apiBaseUrl:
          map['apiBaseUrl'] != null ? map['apiBaseUrl'] as String : null,
      clientId: map['clientId'] != null ? map['clientId'] as String : null,
      clientName:
          map['clientName'] != null ? map['clientName'] as String : null,
      logo: map['logo'] != null ? map['logo'] as String : null,
      theme: map['theme'] != null
          ? ThemeConfig.fromMap(map['theme'] as Map<String, dynamic>)
          : null,
    );
  }
  factory AppConfig.fromJson(String source) =>
      AppConfig.fromMap(json.decode(source) as Map<String, dynamic>);
}
