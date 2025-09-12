import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smobile/myapp/Apis.dart';
import 'package:smobile/myapp/Home.dart';
import 'package:smobile/myapp/accounts/Member.dart';
import 'package:smobile/myapp/menus.dart';



class LoginPage extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');

    Map<String, dynamic> toJson() {
      return {
        "header": {'Userid': "", 'Password': ""},
        "body": "+254" + data.name.substring(data.name.length - 9),
      };
    }

    print(jsonEncode(toJson()));
    return ApiClient()
        .getmember('/api/member', jsonEncode(toJson()).toString())
        .then((value) {
      if (value.Code == 0) {
        print(value.content);
        Get.to(() => MyHomePage(
              member: Member.fromJson(value.content!),
            ));
        return '';
      } else {
        return 'Unable to login';
      }
    }).onError((error, stackTrace) {
      print(error);
      return "Error";
    });
  }

  Future<String> signup(SignupData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    Map<String, dynamic> toJson() {
      return {
        "header": {'Userid': "", 'Password': ""},
        "body": data.name,
      };
    }

    return Future.delayed(loginTime).then((value) {
      if (value.Code == 0) {
        return 'User not exists';
      } else {
        return 'User not exists1';
      }
    });
  }

  String? validator(String? data) {
    print('Name: ${data}');
    return null;
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      // if (!users.containsKey(name)) {
      return 'User not exists';
      //}
      //return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      // title: 'SMobile',
      logo: 'assets/images/aps-logo.png',
      userType: LoginUserType.phone,
      userValidator: validator,
      onLogin: _authUser,
      onSignup: signup,

      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MyCardsView(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      messages: LoginMessages(
        userHint: 'Telephone',
        passwordHint: 'Pass',
        confirmPasswordHint: 'Confirm',
        loginButton: 'LOG IN',
        signupButton: 'REGISTER',
        forgotPasswordButton: 'Forgot Pass?',
        recoverPasswordButton: 'HELP ME',
        goBackButton: 'GO BACK',
        confirmPasswordError: 'Not match!',
        recoverPasswordDescription:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
        recoverPasswordSuccess: 'Password rescued successfully',
      ),
    );
  }
}
