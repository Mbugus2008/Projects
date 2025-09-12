// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print, non_constant_identifier_names
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:s_mobile/main.dart';

import 'Interface.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class ApiClient<T extends investor> extends ChangeNotifier {
  String baseUrl = "http://192.168.54.119/S_Mobile/api";
  //String baseUrl = "http://192.168.28.105/S_Mobile/api";
  //String baseUrl = "http://192.168.1.106/S_Mobile/api";
  Future<Response> postdata(String url, String data) async {
    Response? r = Response("", 200);
    try {
      print('$baseUrl/$url');
      final header = {
        'Content-Type': 'application/json',
        'X-Client-Identifier': Clients().Name, // Add your custom header here
      };

      print(header);
      print(data);

      var client = IOClient(
          HttpClient()..badCertificateCallback = (cert, host, port) => true);
      r = await client.post(
        Uri.parse('$baseUrl/$url'),
        body: data,
        headers: header,
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

@JsonSerializable(includeIfNull: false)
class Params {
  String? Phone;
  String? Acc;
  String? CS_Number;
  String? Id_No;
  String? text;
  String? Agent_Code;
  String? Application_No;
  String? Loan_Type;
  String? Image;
  String? Loan_No;
  Params({
    this.Phone,
    this.Acc,
    this.CS_Number,
    this.Id_No,
    this.text,
    this.Agent_Code,
    this.Application_No,
    this.Loan_Type,
    this.Image,
    this.Loan_No,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Phone': Phone,
      'Acc': Acc,
      'CS_Number': CS_Number,
      'Id_No': Id_No,
      'text': text,
      'Agent_Code': Agent_Code,
      'Application_No': Application_No,
      'Loan_Type': Loan_Type,
      'Image': Image,
      'Loan_No': Loan_No,
    };
  }

  factory Params.fromMap(Map<String, dynamic> map) {
    return Params(
      Phone: map['Phone'] != null ? map['Phone'] as String : null,
      Acc: map['Acc'] != null ? map['Acc'] as String : null,
      CS_Number: map['CS_Number'] != null ? map['CS_Number'] as String : null,
      Id_No: map['Id_No'] != null ? map['Id_No'] as String : null,
      text: map['text'] != null ? map['text'] as String : null,
      Agent_Code:
          map['Agent_Code'] != null ? map['Agent_Code'] as String : null,
      Application_No: map['Application_No'] != null
          ? map['Application_No'] as String
          : null,
      Loan_Type: map['Loan_Type'] != null ? map['Loan_Type'] as String : null,
      Image: map['Image'] != null ? map['Image'] as String : null,
      Loan_No: map['Loan_No'] != null ? map['Loan_No'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Params.fromJson(String source) =>
      Params.fromMap(json.decode(source) as Map<String, dynamic>);
}
