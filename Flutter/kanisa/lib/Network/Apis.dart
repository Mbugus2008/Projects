// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kanisa/Network/results.dart';
import 'package:kanisa/models/account_model.dart';
import 'package:kanisa/models/dimensions.dart';
import 'package:kanisa/services/logger.dart';


class ApiClient extends ChangeNotifier {
   final LoggerService logger = Get.find();
  String baseUrl = "http://trimline.co.ke:4006/api";
  //String baseUrl = "http://192.168.100.47:898/api";
  //String baseUrl = "http://192.168.1.118:898/api";
  //String baseUrl = "http://192.168.100.54:898/api";

  Future<http.Response> postdata(String url, {String? data, bool isPost = true}) async {
    http.Response response;
    try {
        logger.debug(data);
      final headers = {
        'Content-Type': 'application/json',
        'X-Client-Identifier': "kirigiti", // Custom header
      };

      logger.info('$baseUrl$url');
      logger.info("out: $data");
      if (isPost) {
        response = await http.post(
          Uri.parse('$baseUrl$url'),
          body: data,
          headers: headers
        );
      } else {
        response = await http.get(Uri.parse('$baseUrl$url'), headers: headers);
      }
      logger.debug(response.statusCode.toString());
      logger.debug(response.body);
    } catch (e) {
      logger.debug("Network exception: ${e.toString()}");
      response = http.Response(e.toString(), 400);
    }
    return response;
  }

  // Updated method to check if customer exists using phone number
  Future<Customer?> checkCustomerExists(String phoneNumber) async {
    var response = await postdata('/customer?phoneNo=$phoneNumber',data:  null, isPost: true);
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      Results<Customer> data = Results.fromJson(response.body, (item) => Customer.fromJson(item as Map<String, dynamic>));
      return data.Contents;
    } else {
      return null;
    }
  }

  // Method to register a new customer
  Future<Customer?> registerCustomer(Customer customer) async {
    var response = await postdata('/register-customer', data:  json.encode(customer.toJson()),isPost: true);
    if (response.statusCode != 200) {
      throw Exception('Failed to register customer');
    }
     Results<Customer> data = Results.fromJson(response.body, (item) => Customer.fromJson(item as Map<String, dynamic>));
      
    return data.Contents;
  }

  Future<List<Dimension>> fetchDimensions() async {
    try {
      final response = await postdata('/dimensions', isPost: true, data: json.encode({"key": "value"}));
      if (response.statusCode == 200) {
        //var jsonResponse = json.decode(response.body);
           ListResults<Dimension> results =
              ListResults<Dimension>.fromJson(response.body, Dimension.fromMap);
        return results.Contents ?? [];
      } else {
        throw Exception('Failed to load dimensions');
      }
    } catch (e) {
      throw Exception('Failed to load dimensions: $e');
    }
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
