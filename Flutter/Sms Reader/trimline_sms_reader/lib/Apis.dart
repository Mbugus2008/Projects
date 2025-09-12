// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiClient extends ChangeNotifier {
  //String baseUrl = "http://192.168.150.100/investor/api";
  //
  //String baseUrl = "http://192.168.100.48/S_Mobile/api";
  String baseUrl = "http://5.189.167.52:4006/api/";
  Future<Response> postdata(String url, String data, String client) async {
    Response? r = Response("", 200);
    try {
      //var responseJson;
      print('$baseUrl/$url');
      print(data);

      final headers = {
        'Content-Type': 'application/json',
        'X-Client-Identifier': client, // Add your custom header here
      };

      r = await http.post(
        Uri.parse('$baseUrl/$url'),
        body: data,
        headers: headers,
      );
      print(r.statusCode);
      print(r.body);
    } catch (e) {
      if (e is SocketException) {
        //treat SocketException
      }
      print("Socket exception: ${e.toString()}");
      r = Response(e.toString(), 400);
    }
    return await Future.value(r);
    // Member.fromJson(jsonDecode(jsonEncode(results.content.toString())));
  }
}
