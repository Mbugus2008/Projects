import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_matatu/controllers/main.dart';
import 'package:t_matatu/decorations/input.dart';
import 'package:t_matatu/pages/home.dart';
import 'package:t_matatu/controllers/TypesController.dart';
import 'package:t_matatu/controllers/header.dart';
import 'package:t_matatu/models/agents.dart';
import 'package:t_matatu/providers/db.dart';
import 'package:t_matatu/reports/controller.dart';
import 'package:t_matatu/utils/snackbar_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Rx<TextEditingController> username = TextEditingController().obs;
  final TextEditingController password = TextEditingController();
  final RxBool loggingin = false.obs;

  @override
  void initState() {
    super.initState();
    getuser();
    //Get.find<MainController>().getDeviceInfo();
  }

  Future<void> getuser() async {
    final un = await Get.find<MainController>().getPreference('username');
    if (un != null) username.value.text = un.toString();
  }

  Future<void> login(String username, String password) async {
    try {
      loggingin.value = true;
      //throw Exception('Here');
      final value = await db_Provider().getagent(Agent.columns, Agent.tableagents, username);
      if (value != null) {
        final agent = Agent.fromMap(value);
        if (agent.Password == password) {
          await _handleSuccessfulLogin(agent, username);
        } else 
        {
          SnackbarService.showError('Invalid Username / Password');
        }
      } else {
        SnackbarService.showError('Invalid Username / Password');
      }
    } catch (e,stackTrace) {
      
      stackTrace.printError();
      
      _showErrorSnackbar(e.toString());
    } finally {
      loggingin.value = false;
    }
  }

  Future<void> upload() async {
    // Implement your upload logic here
    // For example:
    try {
      // Perform your upload operation
      print('Uploading data...');
      // You might want to call some service or API here
      await Future.delayed(Duration(seconds: 2)); // Simulating upload time
      print('Upload completed');
    } catch (e) {
      print('Error during upload: $e');
      // Handle any errors that occur during upload
    }
  }

  Future<void> _handleSuccessfulLogin(Agent agent, String username) async {
    final mainController = Get.find<MainController>();
    mainController.agent.value = agent;
    await HeaderController().gettodaystrans();
    await mainController.savePreference('username', username);
    password.clear();

    await mainController.getPreference("printer");
    Get.find<TransTypeController>().start();
    await upload(); // Now this call is valid
    await ReportController().gettodaysdate();
    Get.off(() => HomePage());
  }

  void _showErrorSnackbar(String message) {
    SnackbarService.showError(message);
  }

  @override
  Widget build(BuildContext context) {
    final logoValue = Get.find<MainController>().config?.value.logo;
    final logo = logoValue ?? "";

    return Scaffold(
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: Color.fromARGB(255, 77, 179, 139), width: 1),
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(logo),
                fit: BoxFit.cover,
                opacity: 0.1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Obx(() => TextFormField(
                    controller: username.value,
                    decoration: input.inputdecoration("User Name", const Icon(Icons.email)),
                  )),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: input.inputdecoration("Password", const Icon(Icons.lock)),
                  ),
                  const SizedBox(height: 20),
                  Obx(() => loggingin.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () => login(username.value.text, password.text),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.verified_user),
                            SizedBox(width: 8.0),
                            Text('Login'),
                          ],
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
