import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:trimline_sms_reader/Apis.dart';
import 'package:trimline_sms_reader/Controller.dart';
import 'package:trimline_sms_reader/Dimensions.dart';
import 'package:trimline_sms_reader/client/client.dart';
import 'package:trimline_sms_reader/client/kirigiti.dart';
import 'package:trimline_sms_reader/t__results.dart';
import 'package:trimline_sms_reader/transaction.dart';
import 'package:trimline_sms_reader/vouchers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(() => SmsController());
  await Get.find<SmsController>().opendb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final SmsController myController =
      Get.put(SmsController()); // Initialize the controller
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Get.find<SmsController>().getsavedtrans();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy sms',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Easy sms'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

  @override
  void initState() {
    super.initState();
    Get.find<SmsController>().vouchers.add(Vouchers());
    cheques();
    dimensions();
    // Ensure SMS permission at app startup
    _ensureSmsPermission();
  }

  Future<void> _ensureSmsPermission() async {
    try {
      var status = await Permission.sms.status;
      if (status.isDenied) {
        status = await Permission.sms.request();
      }
      if (status.isPermanentlyDenied) {
        // Prompt user to open app settings to grant permission
        await openAppSettings();
      }
    } catch (e) {
      // ignore errors here; permission_handler may not be available in all platforms
      print('Failed to request SMS permission at startup: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> cheques() async {
    ApiClient().postdata("cheques", "", 'kirigiti').then((r) async {
      if (r.statusCode == 200) {
        Results<Vouchers> results =
            Results<Vouchers>.fromJson(r.body, Vouchers.fromMap);
        if (results.Code == 0) {
          if (results.Contents != null) {
            Get.find<SmsController>().vouchers.addAll(results.Contents!);
          }
          //db.update(tr!);
        }
      }
    });
  }

  Future<void> dimensions() async {
    ApiClient().postdata("dimensions", "", 'kirigiti').then((r) async {
      if (r.statusCode == 200) {
        Results<Dimensions> results =
            Results<Dimensions>.fromJson(r.body, Dimensions.fromMap);
        if (results.Code == 0) {
          if (results.Contents != null) {
            Get.find<SmsController>().dimensions.addAll(results.Contents!);
          }
          //db.update(tr!);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return GetX<SmsController>(builder: (controller) {
      List<transaction> receipts = controller.messages
          .where(
            (p0) => p0.Transtype == TransType.Receipts,
          )
          .toList();
      List<transaction> payments = controller.messages
          .where(
            (p0) => p0.Transtype == TransType.Payments,
          )
          .toList();
      Vouchers? _selectedItemId;
      final TextEditingController colorController = TextEditingController();
      return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              // TRY THIS: Try changing the color here to a specific color (to
              // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
              // change color while the other colors stay the same.
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(widget.title),
              bottom: const TabBar(
                tabs: [
                  Tab(text: "Receipts", icon: Icon(Icons.receipt)),
                  Tab(text: "Payments", icon: Icon(Icons.payment)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                receipts.isNotEmpty
                    ? ListView.builder(
                        itemCount: receipts
                            .length, // Replace with the actual item count
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 20,
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('${receipts[index].Receipt_No}'),
                                ],
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(formatter.format(receipts[index]
                                          .Completion_Time as DateTime)),
                                      const Spacer(),
                                      Text(
                                        receipts[index].Transtype ==
                                                TransType.Receipts
                                            ? NumberFormat("#,##0.00", "en_US")
                                                .format(
                                                    receipts[index].Paid_In ??
                                                        0)
                                            : NumberFormat("#,##0.00", "en_US")
                                                .format(
                                                    receipts[index].Withdrawn ??
                                                        0),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${receipts[index].Name}',
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Text("No Transactions"),
                payments.isNotEmpty
                    ? ListView.builder(
                        itemCount: payments
                            .length, // Replace with the actual item count
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 20,
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('${payments[index].Receipt_No}'),
                                ],
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('${payments[index].A_C_No}'),
                                    ],
                                  ),
                                  if (payments[index].District != null ||
                                      payments[index].Purpose != null)
                                    Row(
                                      children: [
                                        Text('${payments[index].District}'),
                                        const Spacer(),
                                        Text('${payments[index].Purpose}'),
                                      ],
                                    ),
                                  Row(
                                    children: [
                                      Text(formatter.format(payments[index]
                                          .Completion_Time as DateTime)),
                                      const Spacer(),
                                      Text(
                                        NumberFormat("#,##0.00", "en_US")
                                            .format(
                                                payments[index].Withdrawn ?? 0),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${payments[index].Name}',
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Text("No Transactions")
              ],
            ),

            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                print('getting sms');
                try {
                  // Check and request SMS permission first
                  var status = await Permission.sms.status;
                  if (status.isDenied) {
                    status = await Permission.sms.request();
                  }
                  if (status.isPermanentlyDenied) {
                    await openAppSettings();
                    return;
                  }
                  if (!status.isGranted) {
                    print('SMS permission not granted');
                    return;
                  }

                  // Permission granted, proceed with SMS reading
                  SmsClients client = kiriigiti();
                  await client.getsms();
                } catch (e) {
                  print('Error while handling SMS: $e');
                }
              },
              child: Get.find<SmsController>().reading.value == false
                  ? Text("Read")
                  : CircularProgressIndicator(),
            ),
            //This trailing comma makes auto-formatting nicer for build methods.
          ));
    });
  }
}
