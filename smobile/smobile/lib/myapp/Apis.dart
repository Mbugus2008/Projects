import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:smobile/myapp/Results.dart';

class ApiClient extends ChangeNotifier {
  //String baseUrl = "https://mobile.apsbarakasacco.co.ke:2100/";
  //String baseUrl = "http://192.168.100.123/Aps";
  String baseUrl = "http://192.168.150.100/Aps";
  //String baseUrl = "http://192.168.0.33/Aps";
  //String baseUrl = "http://192.168.216.105/Aps";976j
  Future<Results> getmember(String url, String data) async {
    var r;
    try {
      var responseJson;
      print(baseUrl);
      final request = await http
          .post(Uri.parse(baseUrl + '/api/member2'), body: data, headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      });
      print(request.statusCode);
      print(request.body);
      responseJson = request.body;
      r = Results.fromJson(responseJson.toString());
      // var results = Results.fromJson(responseJson.toString());
      //print(results.content);
    } catch (e, stacktrace) {
      print(stacktrace);
      print(e);
    }
    return r;
    // Member.fromJson(jsonDecode(jsonEncode(results.content.toString())));
  }

  Future<Results> getdata(String url, String data) async {
    Results r = Results();
    try {
      var responseJson;
      print(baseUrl);
      final request = await http.get(Uri.parse(baseUrl + '/' + url), headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      });
      print(request.statusCode);
      print(request.body);
      responseJson = request.body;
      r = Results.fromJson(responseJson.toString());
      print(r.content);
      // var results = Results.fromJson(responseJson.toString());
      //print(results.content);
    } catch (e, stacktrace) {
      print(stacktrace);
      print(e);
    }
    return r;
    // Member.fromJson(jsonDecode(jsonEncode(results.content.toString())));
  }

  Future<Results> postdata(String url, String data) async {
    var r;
    try {
      var responseJson;
      print(baseUrl);
      print(data);
      final request =
          await http.post(Uri.parse(baseUrl + '/' + url), body: data, headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      });
      print(request.statusCode);
      print(request.body);
      responseJson = request.body;
      r = Results.fromJson(responseJson.toString());
      // var results = Results.fromJson(responseJson.toString());
      //print(results.content);
    } catch (e, stacktrace) {
      print(stacktrace);
      print(e);
    }
    return r;
    // Member.fromJson(jsonDecode(jsonEncode(results.content.toString())));
  }

  Future<void> eligibility(String phone) async {
    getdata('/api/loanProducts', "");

    notifyListeners();
  }
}
