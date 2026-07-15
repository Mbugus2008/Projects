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

// ── App Configuration ───────────────────────────────────────────
class AppConfig {
  // Toggle this to switch between environments
  static const bool isProduction = false;

  // Android emulator uses 10.0.2.2 to reach host localhost
  // iOS simulator uses localhost directly
  // Physical device uses your LAN IP (e.g., 192.168.x.x)
  static String get baseUrl {
    if (isProduction) {
      return 'https://your-production-server.com/api';
    }
    // Development — change this to your local IP for physical device testing
    // IIS-hosted Sacco.Core.Api on port 8088
    return 'https://services.trimline.co.ke/Sacco.Core.Api/api';
    //return 'http://10.0.2.2:8088/api';
  }

  // Request timeout in seconds
  static const int requestTimeoutSeconds = 30;
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class ApiClient<T extends investor> extends ChangeNotifier {
  String baseUrl = AppConfig.baseUrl;

  Future<Response> postdata(String url, String data) async {
    Response? r = Response('', 200);
    try {
      final fullUrl = '$baseUrl/$url';
      print('🌐 POST $fullUrl');
      final header = {
        'Content-Type': 'application/json',
        'X-Client-Identifier': Clients().Name,
      };

      print('📋 Headers: $header');
      print('📦 Body: $data');

      var client = IOClient(
          HttpClient()..badCertificateCallback = (cert, host, port) => true);
      r = await client
          .post(
            Uri.parse(fullUrl),
            body: data,
            headers: header,
          )
          .timeout(Duration(seconds: AppConfig.requestTimeoutSeconds));

      print('✅ Status: ${r.statusCode}');
      print(
          '📄 Response: ${r.body.length > 500 ? r.body.substring(0, 500) + '...' : r.body}');
    } on TimeoutException {
      print('⏱️ Request timed out');
      r = Response(
          '{"Code":-1,"Desc":"Request timed out. Please check your connection."}',
          408);
    } on SocketException catch (e) {
      print('🔌 Socket exception: ${e.toString()}');
      r = Response(
          '{"Code":-2,"Desc":"Unable to connect to server. Please check your network."}',
          503);
    } catch (e) {
      print('❌ Unexpected error: ${e.toString()}');
      r = Response('{"Code":-3,"Desc":"An unexpected error occurred."}', 500);
    }
    return await Future.value(r);
  }

  /// GET request helper
  Future<Response> getdata(String url) async {
    Response? r = Response('', 200);
    try {
      final fullUrl = '$baseUrl/$url';
      print('🌐 GET $fullUrl');
      final header = {
        'Content-Type': 'application/json',
        'X-Client-Identifier': Clients().Name,
      };

      var client = IOClient(
          HttpClient()..badCertificateCallback = (cert, host, port) => true);
      r = await client
          .get(
            Uri.parse(fullUrl),
            headers: header,
          )
          .timeout(Duration(seconds: AppConfig.requestTimeoutSeconds));

      print('✅ Status: ${r.statusCode}');
    } on TimeoutException {
      r = Response('{"Code":-1,"Desc":"Request timed out."}', 408);
    } on SocketException {
      r = Response('{"Code":-2,"Desc":"Unable to connect to server."}', 503);
    } catch (e) {
      r = Response('{"Code":-3,"Desc":"An unexpected error occurred."}', 500);
    }
    return await Future.value(r);
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
  int? Transaction_Type;
  String? Account_2;
  String? Document_No;
  double? Amount;
  String? Account_No;
  String? Transaction_Date;
  String? Transaction_Time;
  String? Member_No;
  String? Source;
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
    this.Transaction_Type,
    this.Account_2,
    this.Document_No,
    this.Amount,
    this.Account_No,
    this.Transaction_Date,
    this.Transaction_Time,
    this.Member_No,
    this.Source,
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
      'Transaction_Type': Transaction_Type,
      'Account_2': Account_2,
      'Document_No': Document_No,
      'Amount': Amount,
      'Account_No': Account_No,
      'Transaction_Date': Transaction_Date,
      'Transaction_Time': Transaction_Time,
      'Member_No': Member_No,
      'Source': Source,
    };
  }

  /// Build a complete transaction body. Callers only supply what varies;
  /// all common fields (date, time, source, etc.) are set here once.
  static Map<String, dynamic> transactionBody({
    required String accountNo,
    required int transactionType,
    required double amount,
    String? memberNo,
    String? loanNo,
    String? account2,
    String? phone,
    String? description,
  }) {
    final now = DateTime.now();
    return {
      'Document_No':
          'TXN-${now.millisecondsSinceEpoch}-${DateTime.now().microsecondsSinceEpoch}',
      'Transaction_Date': now.toIso8601String().substring(0, 10),
      'Transaction_Time': now.toIso8601String().substring(11, 19),
      'Transaction_Type': transactionType,
      'Amount': amount,
      'Account_No': accountNo,
      if (memberNo != null) 'Member_No': memberNo,
      if (loanNo != null) 'Loan_No': loanNo,
      if (account2 != null) 'Account_2': account2,
      if (phone != null) 'Mobile_No': phone,
      'Source': 'Mbaraka',
      if (description != null) 'Description': description,
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
