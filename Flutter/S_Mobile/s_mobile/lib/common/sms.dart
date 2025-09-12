import 'package:flutter/material.dart';

import 'package:sms_receiver/sms_receiver.dart';

class Sms extends StatefulWidget {
  const Sms({Key? key}) : super(key: key);

  @override
  State<Sms> createState() => _MysmsState();
}

class _MysmsState extends State<Sms> {
  String? _textContent = 'Waiting for messages...';
  SmsReceiver? _smsReceiver;
  String? contact;
  @override
  void initState() {
    super.initState();
    _smsReceiver = SmsReceiver(onSmsReceived, onTimeout: onTimeout);
    _startListening();
  }

  void onSmsReceived(String? message) {
    setState(() {
      _textContent = message;
    });
  }

  void onTimeout() {
    setState(() {
      _textContent = 'Timeout!!!';
    });
  }

  void _startListening() async {
    if (_smsReceiver == null) return;
    await _smsReceiver?.startListening();
    setState(() {
      _textContent = 'Waiting for messages...';
    });
  }

  void _stopListening() async {
    if (_smsReceiver == null) return;
    await _smsReceiver?.stopListening();
    setState(() {
      _textContent = 'Listener Stopped';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SMS Listener App'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: Text(_textContent ?? 'empty'),
            ),
            ElevatedButton(
              child: const Text('Listen Again'),
              onPressed: _startListening,
            ),
            ElevatedButton(
              child: const Text('Stop Listener'),
              onPressed: _stopListening,
            ),
          ],
        ),
      ),
    );
  }
}
