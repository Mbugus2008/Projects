import 'package:flutter/material.dart';
import 'package:t_matatu/pages/widgets/Groupbox.dart';

import '../models/Header.dart';
import '../models/summary/Tsummary.dart';

abstract class BaseClients {
  Widget homelist();
  Future<List<int>> printReceipt(Header header);
  Future<List<int>> getZreport(Tsummary summary);
  String v_description(Header header);
  bool? Auto_Assign;
  Future<void> init();
  GroupBox? clientMenu();
 
  String? clientName;
}
