// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:matatu/common/Interface.dart';

class ApiClient<T extends investor> extends ChangeNotifier {
  //String baseUrl = "http://192.168.150.100/investor/api";
  //
  String baseUrl = "http://5.189.167.52:4040/Matatu/api";
  Future<Response> postdata(String url, String data) async {
    Response? r = Response("", 200);
    try {
      var responseJson;
      print('$baseUrl/$url');
      print(data);
      r = await http.post(Uri.parse('$baseUrl/$url'), body: data, headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      });
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

class Request {
  Header? header;
  String? body;
  String? Otp;
  String? phone;
  String? Otp_message;
  String? bookmark;
  int? size;
  Request({
    required this.header,
    this.body = '',
    this.Otp = '',
    this.phone = '',
    this.Otp_message = '',
    this.bookmark,
    this.size,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'header': header?.toMap(),
      'body': body,
      'Otp': Otp,
      'phone': phone,
      'Otp_message': Otp_message,
      'bookmark': bookmark,
      'size': size,
    };
  }

  factory Request.fromMap(Map<String, dynamic> map) {
    return Request(
      header: map['header'] != null
          ? Header.fromMap(map['header'] as Map<String, dynamic>)
          : null,
      body: map['body'] != null ? map['body'] as String : null,
      Otp: map['Otp'] != null ? map['Otp'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      Otp_message:
          map['Otp_message'] != null ? map['Otp_message'] as String : null,
      bookmark: map['bookmark'] != null ? map['bookmark'] as String : null,
      size: map['size'] != null ? map['size'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Request.fromJson(String source) =>
      Request.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Header {
  String? userid;
  String? password;
  Header({
    this.userid = '',
    this.password = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userid': userid,
      'password': password,
    };
  }

  factory Header.fromMap(Map<String, dynamic> map) {
    return Header(
      userid: map['userid'] != null ? map['userid'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Header.fromJson(String source) =>
      Header.fromMap(json.decode(source) as Map<String, dynamic>);
}
