import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:s_mobile/common/Results.dart';
import 'package:s_mobile/members/controller.dart';
import 'package:s_mobile/members/member.dart';
import 'package:s_mobile/registration/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/Apis.dart';
import 'common/widgets.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final usernamec = TextEditingController(text: "");
  late final passwordc = TextEditingController(text: "");
  String? error;
  late final otp = TextEditingController(text: "");
  String? otperror;
  RxBool? _isButtonDisabled = false.obs;
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
    otp.addListener(otptext);
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

  void _showForgotPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Forgot Password'),
        content: const Text(
          'Please contact your SACCO administrator to reset your password.\n\n'
          'You can also visit your nearest branch office for assistance.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  final space = const Padding(
    padding: EdgeInsets.all(10.0),
  );

  Future<void> login(BuildContext context, String phone) async {
    if (_isButtonDisabled == false) {
      _isButtonDisabled?.value = true;
      var request = Params(Phone: phone);
      var r = await ApiClient().postdata("member", request.toJson());
      if (r.statusCode == 200) {
        Results2<Member> results =
            Results2<Member>.fromJson(r.body, Member.fromMap);
        switch (results.Code) {
          case 0:
            {
            final SharedPreferences prefs = await _prefs;
              prefs.setString('user', usernamec.text);
              if (mounted) {
                Get.find<MemberController>().currentCustomer.value =
                    results.Contents!;
                Get.to(MyHomePage(
                    member: results.Contents));
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (_) => MyHomePage(
                //               member: results.Contents,
                //             )));
              }
              // if ((results.Contents?.Member_info == null) ||
              //     (results.Contents?.Member_info?.Logged_In == null)) {
              //   String? ran = utilities().Getrandom().toString();
              //   var request =
              //       Params(Phone: phone, text: "Your registration otp is $ran");
              //   var r =
              //       await ApiClient().postdata("Otp", request.toJson()).then(
              //     (value) {
              //       Results res = Results.fromJson(value.body);
              //       if (res.Code == 0) {
              //         otp.text = "";
              //         utilities().Otp(context, ran).then(
              //           (value) async {
              //             if (value == true) {
              //               var memberinfo = member_info(
              //                 Member_No: results.Contents?.No,
              //                 Phone_No: results.Contents?.Mobile_Phone_No,
              //                 First_Pin: utilities().Getrandom().toString(),
              //               );
              //               var r = await ApiClient()
              //                   .postdata("Createaccount", memberinfo.toJson())
              //                   .then((value) {
              //                 utilities().changpin(context, memberinfo);
              //               });
              //             }
              //           },
              //         );
              //       } else {
              //         if (!mounted) return;
              //         MotionToast.error(
              //           description: Text(res.Desc.toString()),
              //           title: Text("Login"),
              //         ).show(context);
              //       }
              //     },
              //   );
              // } else {
              //   setState(() {
              //     if (passwordc.text == "") {
              //       error = "Password required";
              //       return;
              //     } else {
              //       error = "";
              //     }
              //     if (error != "") return;
              //   });
              //   if (mounted) {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (_) => MyHomePage(
              //                   member: results.Contents,
              //                 )));

              //     final SharedPreferences prefs = await _prefs;
              //     prefs.setString('user', usernamec.text);
              //   }
              // }
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
      setState(() {
        _isButtonDisabled?.value = false;
        print("Enable");
      });
    }
  }

  void otptext() {
    setState(() {});
  }

  Future<bool> Otps(BuildContext context, String compareotp) async {
    bool? otpok;
    return await showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
            builder: (context, setState) => AlertDialog(
                  title: Center(child: Text("Otp")),
                  content: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: 20,
                        maxHeight: MediaQuery.of(context).size.height / 7),
                    child: Column(
                      children: [
                        TextField(
                          controller: otp,
                          //obscureText: true,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                          onChanged: (value) {
                            setState(() {
                              otperror = "";
                            });
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Otp',
                              hintText: 'Enter Otp',
                              errorText: otperror,
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
                      child: Text("Yes"),
                      onPressed: () {
                        setState(() {
                          if (otp.text == compareotp) {
                            otpok = true;
                            Navigator.pop(context, otpok);
                          } else {
                            otpok = false;
                            otperror = "Invalid otp";
                          }
                        });
                      },
                    ),
                  ],
                )));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
        decoration: widgets().backgroundimage(context),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: mycard(
            context,
            Container(
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
                        labelText: 'Phone No',
                        hintText: 'Enter account/phone No',
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
                    TextButton(
                      onPressed: () {
                        if (usernamec.text.trim().isEmpty) {
                          MotionToast.warning(
                            description: const Text(
                                'Please enter your phone number first.'),
                            title: const Text('Forgot Password'),
                          ).show(context);
                          return;
                        }
                        _showForgotPasswordDialog(context);
                      },
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                    Obx(() =>
                       Container(
                        width: MediaQuery.of(context).size.width,
                        child: MaterialButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            login(context, usernamec.text);
                          },
                          child: _isButtonDisabled?.value == false ?  Text(
                            'Login',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ):CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Registration_widget()));
                      },
                      child: const Text(
                        'Register',
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
