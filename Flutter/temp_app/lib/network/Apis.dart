// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:t_matatu/controllers/main.dart';
import 'package:t_matatu/providers/logger.dart';
import 'package:t_matatu/utils/snackbar_service.dart';

class ApiClient extends ChangeNotifier {
   final LoggerService logger = Get.find();
  String baseUrl = "http://trimline.co.ke:4005/City/api/";
  //String baseUrl = "http://192.168.100.47:898/api";
  //String baseUrl = "http://192.168.1.118:898/api";
  //String baseUrl = "http://192.168.100.54:898/api";

  Future<http.Response> postdata(String url, String? data) async {
    http.Response? r = http.Response("", 200);
    try {
      logger.info('${Get.find<MainController>().config?.value.apiBaseUrl}$url');
      logger.info(data);
      
      r = await http.post(
          Uri.parse(
              '${Get.find<MainController>().config?.value.apiBaseUrl}$url'),
          body: data,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          });
          
      logger.info(r.statusCode.toString());
      logger.info(r.body);
      
      if (r.statusCode >= 400) {
        throw Exception('API request failed with status ${r.statusCode}');
      }
      
    } catch (e, stackTrace) {
      logger.error("API failed", error: e, stackTrace: stackTrace);
      rethrow; // Let the caller handle the error
    }
    return await Future.value(r);
  }

}

class ApiService extends GetxService {
  Future<ApiService> init() async {
    // Initialize your API service here
    print('ApiService initialized');
    return this;
  }

  // ... other API methods
}
