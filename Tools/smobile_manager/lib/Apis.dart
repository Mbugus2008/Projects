// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smobile_manager/nav_setting.dart';



class ApiClient extends ChangeNotifier {
  String baseUrl = "http://trimline.co.ke:4006/api";
  //String baseUrl = "http://192.168.100.47:898/api";
  //String baseUrl = "http://192.168.1.118:898/api";
  //String baseUrl = "http://192.168.100.54:898/api";

  Future<http.Response> postdata(String url, {String? data, bool isPost = true}) async {
    http.Response response;
    try {
        print(data);
      final headers = {
        'Content-Type': 'application/json',
        'X-Client-Identifier': "kirigiti", // Custom header
      };

      if (isPost) {
        response = await http.post(
          Uri.parse('$baseUrl$url'),
          body: data,
          headers: headers
        );
      } else {
        response = await http.get(Uri.parse('$baseUrl$url'), headers: headers);
      }
      print(response.statusCode);
      print(response.body);
    } catch (e) {
      print("Network exception: ${e.toString()}");
      response = http.Response(e.toString(), 400);
    }
    return response;
  }

 
  Future<List<NavSetting>> fetchDimensions() async {
    try {
      final response = await postdata('/dimensions', isPost: true, data: json.encode({"key": "value"}));
      if (response.statusCode == 200) {
        //var jsonResponse = json.decode(response.body);
           ListResults<NavSetting> results =
              ListResults<NavSetting>.fromJson(response.body, NavSetting.fromMap);
        return results.Contents ?? [];
      } else {
        throw Exception('Failed to load dimensions');
      }
    } catch (e) {
      throw Exception('Failed to load dimensions: $e');
    }
  }
}
abstract class Tomaps {
  Map<String, dynamic> toMap();
}
class ListResults<T extends Tomaps> {
  int? Code = 0;
  String? Desc = "Successful";
  List<T>? Contents;
  ListResults({
    int? code,
    String? desc,
    this.Code,
    this.Desc,
    this.Contents,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Code': Code,
      'Desc': Desc,
      'Contents': Contents?.map((x) => x.toMap()).toList(),
    };
  }

  factory ListResults.fromMap(
      Map<String, dynamic> map, T Function(Map<String, dynamic>) createT) {
    return ListResults(
      Code: map['Code'] != null ? map['Code'] as int : null,
      Desc: map['Desc'] != null ? map['Desc'] as String : null,
      Contents: map['Contents'] != null
          ? (map['Contents'] as List<dynamic>)
              .map((x) => createT(x as Map<String, dynamic>))
              .toList()
          : null,
    );
  }
  String toJson() => json.encode(toMap());
  factory ListResults.fromJson(
          String source, T Function(Map<String, dynamic>) createT) =>
      ListResults.fromMap(json.decode(source) as Map<String, dynamic>, createT);
}
class ApiService extends GetxService {
  Future<ApiService> init() async {
    // Initialize your API service here
    print('ApiService initialized');
    return this;
  }

  // ... other API methods
}
