import 'package:flutter/material.dart';

class Sms extends StatefulWidget {
  const Sms({Key? key}) : super(key: key);

  @override
  State<Sms> createState() => _MysmsState();
}

class _MysmsState extends State<Sms> {
  String? _textContent = 'Waiting for messages...';
  String? contact;
  @override
  void initState() {
    super.initState();
    _startListening();
  }

  void _startListening() {
    setState(() {
      _textContent = 'SMS listener unavailable';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SMS Listener App'),
        ),
        body: Center(
          child: Text(_textContent ?? 'empty'),
        ),
      ),
    );
  }
}
