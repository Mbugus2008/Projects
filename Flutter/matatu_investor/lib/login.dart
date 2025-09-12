import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matatu/common/Apis.dart';
import 'package:matatu/common/Controller.dart';
import 'package:matatu/home.dart';
import 'package:matatu/member/member.dart';
import 'package:matatu/member/member_data.dart';
import 'package:matatu/widgets/widgets.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final usernamec = TextEditingController(text: "");
  late final passwordc = TextEditingController(text: "");
  String? error, usererror;
  String? newpass;
  member? mem;
  bool? _isButtonDisabled = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> getlastuser() async {
    final SharedPreferences prefs = await _prefs;
    final String user = (prefs.getString('user') ?? "");

    setState(() {
      usernamec.text = user;
    });
  }

  @override
  void dispose() {
    usernamec.dispose();
    passwordc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    usernamec.addListener(_printLatestValue);
    passwordc.addListener(_passwordchanged);
    getlastuser();
  }

  void _printLatestValue() {
    print('Second text field: ${usernamec.text}');
  }

  void _passwordchanged() {
    setState(() {
      error = "";
    });
  }

  final space = const Padding(
    padding: EdgeInsets.all(10.0),
  );

  Future<void> login(BuildContext context, String phone) async {
    if (_isButtonDisabled == false) {
      usererror = "";
      error = "";
      setState(() {
        if (usernamec.text == "") {
          usererror = "Account required";
          return;
        }

        _isButtonDisabled = true;
      });
      if (error != "") return;

      var request = Request(header: Header(), body: phone);
      await ApiClient().postdata("member", request.toJson()).then((r) async {
        if (r.statusCode == 200) {
          Member_Results results = Member_Results.fromJson(r.body);
          switch (results.Code) {
            case 0:
              {
                mem = results.Contents;
                if (mem == null) {
                  if (!mounted) return;
                  MotionToast.error(
                    description: Text("Account/Vehicle not found"),
                    title: Text("Login"),
                  ).show(context);
                  return;
                }
                if (mem?.Logged_In == false) {
                  var random = Random();
                  int? otp = random.nextInt(999999) + 100000;
                  String phone;

                  var request = Request(
                      header: Header(),
                      phone: mem?.Phone_No,
                      body: "0710563359", // results.Contents?.Phone_No,
                      Otp: otp.toString(),
                      Otp_message: "Your registration otp is $otp");
                  await ApiClient().postdata("Otp", request.toJson());
                  Otp(context, otp.toString()).then((value) async {
                    if (value == true) {
                      ApiClient()
                          .postdata("memberupdate", mem!.toJson())
                          .then((r) {
                        if (r.statusCode == 200) {
                          Member_Results results =
                              Member_Results.fromJson(r.body);
                          if (results.Code == 0) {
                            if (mounted) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => MyHomePage()));

                              final SharedPreferences prefs =
                                  _prefs as SharedPreferences;
                              prefs.setString('user', usernamec.text);
                            }
                          } else {
                            error =
                                "Error setting up your account, please try again later";
                          }
                        }
                      });
                    } else {}
                  });
                } else {
                  if (passwordc.text == "") {
                    error = "Password required";
                    return;
                  }
                  print(mem?.Password);
                  if (mem?.Password == passwordc.text) {
                    if (mounted) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MyHomePage()));

                      final SharedPreferences prefs = await _prefs;
                      prefs.setString('user', usernamec.text);
                    }
                  } else {
                    error = "Invalid username/Password";
                  }
                }
              }
              break;
            default:
              {
                if (!mounted) return;
                MotionToast.error(
                  description: Text("Unable to authenticate"),
                  title: Text("Login"),
                ).show(context);
              }
          }
        } else {
          if (!mounted) return;
          MotionToast.error(
            description: Text(r.body.toString()),
            title: Text("Login"),
          ).show(context);
        }
      });
      setState(() {
        _isButtonDisabled = false;
        print("Enable");
      });
    }
  }

  Future<void> forgotpass(BuildContext context, String phone) async {
    error = "";
    setState(() {
      if (usernamec.text == "") {
        error = "Account required";
        return;
      }
    });

    if (error != "") return;
    var request = Request(header: Header(), body: phone);
    await ApiClient().postdata("member", request.toJson()).then((r) async {
      if (r.statusCode == 200) {
        Member_Results results = Member_Results.fromJson(r.body);
        switch (results.Code) {
          case 0:
            {
              mem = results.Contents;
              if (mem == null) {
                if (!mounted) return;
                MotionToast.error(
                  description: Text("Account/Vehicle not found"),
                  title: Text("Login"),
                ).show(context);
                return;
              }

              var random = Random();
              int? otp = random.nextInt(999999) + 100000;
              var request = Request(
                  header: Header(),
                  phone: mem?.Phone_No,
                  body: "0710563359", // results.Contents?.Phone_No,
                  Otp: otp.toString(),
                  Otp_message: "Your registration otp is $otp");
              var rr = await ApiClient().postdata("Otp", request.toJson());
              Otp(context, otp.toString()).then((value) async {
                if (value == true) {
                  ApiClient().postdata("memberupdate", mem!.toJson()).then((r) {
                    if (r.statusCode == 200) {
                      Member_Results results = Member_Results.fromJson(r.body);
                      if (results.Code == 0) {
                        if (mounted) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => MyHomePage()));

                          final SharedPreferences prefs =
                              _prefs as SharedPreferences;
                          prefs.setString('user', usernamec.text);
                        }
                      } else {
                        error =
                            "Error setting up your account, please try again later";
                      }
                    }
                  });
                } else {}
              });
            }
            break;
          default:
            {
              if (!mounted) return;
              MotionToast.error(
                description: Text("Unable to authenticate"),
                title: Text("Login"),
              ).show(context);
            }
        }
      } else {
        if (!mounted) return;
        MotionToast.error(
          description: Text(r.body.toString()),
          title: Text("Login"),
        ).show(context);
      }
    });
    setState(() {
      _isButtonDisabled = false;
      print("Enable");
    });
  }

  Future<bool> Otp(
    BuildContext context,
    String compareotp,
  ) async {
    bool? otpok;
    String? otperror;
    String? newpasserror;
    String? confirmpasserror;
    late final otp = TextEditingController(text: "");
    late final newpass = TextEditingController(text: "");
    late final confirmpass = TextEditingController(text: "");
    return await showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
            builder: (context, setState) => AlertDialog(
                  title: Text("Login Otp"),
                  content: SizedBox(
                    height: 250,
                    child: Column(
                      children: [
                        TextField(
                          controller: otp,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Otp',
                              hintText: 'Enter Otp sent on sms ',
                              errorText: otperror,
                              hintStyle:
                                  Theme.of(context).textTheme.bodyMedium),
                        ),
                        TextField(
                          controller: newpass,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'New Password',
                              hintText: 'Enter New Password ',
                              errorText: newpasserror,
                              hintStyle:
                                  Theme.of(context).textTheme.bodyMedium),
                        ),
                        TextField(
                          controller: confirmpass,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Confirm Password',
                              hintText: 'Confirm Password ',
                              errorText: confirmpasserror,
                              hintStyle:
                                  Theme.of(context).textTheme.bodyMedium),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text(
                        "Cancel",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    MaterialButton(
                      child: Text("Confirm"),
                      onPressed: () {
                        setState(() {
                          otperror = "";
                          newpasserror = "";
                          confirmpasserror = "";
                          if (otp.text != compareotp) {
                            otperror = "Invalid Otp";
                            return;
                          }
                          if (newpass.text == "") {
                            newpasserror = "Required";
                            return;
                          }
                          if (confirmpass.text == "") {
                            confirmpasserror = "Required";
                            return;
                          }
                          if (confirmpass.text != newpass.text) {
                            confirmpasserror = "Password does not match";
                            return;
                          }
                          mem?.Logged_In = true;
                          mem?.Password = confirmpass.text;
                          Navigator.pop(context, true);
                        });
                      },
                    ),
                  ],
                )));
  }

  @override
  Widget build(BuildContext context) {
    final MemberController controller = Get.find();
    usernamec.text = "00132";
    passwordc.text = "1234";
    return Scaffold(
      //backgroundColor: Colors.transparent,
      body: Container(
        //decoration: widgets().backgroundimage(context),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 20,
            child: Container(
              height: 400,
              width: 250,
              decoration: widgets().container1(context),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: usernamec,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Account',
                        errorText: usererror,
                        hintText: 'Mem No/phone/vehicle no(no space)',
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    space,
                    TextField(
                      controller: passwordc,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Password or Leave blank if first time use',
                          errorText: error,
                          hintStyle: Theme.of(context).textTheme.bodyMedium),
                    ),
                    MaterialButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        controller.login(
                            usernamec.text, passwordc.text, context);
                        //login(context, usernamec.text);
                      },
                      child: Text(
                        _isButtonDisabled == true ? "Please wait" : 'Login',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Obx(() {
                      print(controller.data);
                      if (controller.data.isBlank == true) {
                        return CircularProgressIndicator();
                      } else {
                        return Text((controller.data.value.Name.toString()));
                      }
                    }),
                    TextButton(
                      onPressed: () {
                        forgotpass(context, usernamec.text);
                        //TODO FORGOT PASSWORD SCREEN GOES HERE
                      },
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
