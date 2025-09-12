// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:sqflite/sqflite.dart';
import 'package:trimline_sms_reader/Controller.dart';
import 'package:trimline_sms_reader/transaction.dart';

class transProvider {
  Database? db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tabletransactions ( 
    
  $columnId_Receipt_No text primary key , 
  $columnId_A_C_No_ text ,
  $columnId_Reference text ,
  $columnId_Phone text ,
  $columnId_Sent bit ,
  $columnId_Comments text ,
  $columnId_Detaills text ,
  $columnId_Completion_Time DateTime ,
  $columnId_District text ,
  $columnId_Other_Party_Info text ,
  $columnId_Paid_In float ,
  $columnId_Charge float,
  $columnId_Purpose text ,
  $columnId_Transtype int,
  $columnId_Name text)
''');
    });
  }

  Future<transaction> insert(transaction todo) async {
    todo.id = await db!.insert(tabletransactions, todo.tabletoMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return todo;
  }

  Future<List<transaction>?> getalltrans() async {
    final List<Map<String, dynamic>> maps =
        await db!.query(tabletransactions, columns: [
      columnId_Receipt_No,
      columnId_Completion_Time,
      columnId_Reference,
      columnId_Detaills,
      columnId_Paid_In,
      columnId_Other_Party_Info,
      columnId_A_C_No_,
      columnId_Phone,
      columnId_Name,
      columnId_Sent,
      columnId_Comments,
      columnId_Purpose,
      columnId_District,
      columnId_Charge,
      columnId_Transtype,
    ]);
    if (maps.isNotEmpty) {
      return maps.map((row) {
        return transaction.fromtableMap(row);
      }).toList();
    }
    return Future.value(null);
  }

  Future<transaction?> gettrans(String id) async {
    List<Map<String, Object?>>? maps = await db!.query(tabletransactions,
        columns: [
          columnId_Receipt_No,
          columnId_Reference,
          columnId_Completion_Time,
          columnId_Detaills,
          columnId_Paid_In,
          columnId_Other_Party_Info,
          columnId_A_C_No_,
          columnId_Phone,
          columnId_Name,
          columnId_Sent,
          columnId_Comments,
          columnId_Purpose,
          columnId_District,
          columnId_Charge,
          columnId_Transtype,
        ],
        where: '$columnId_Receipt_No = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return transaction.fromtableMap(maps.first);
    }

    return Future.value(null);
  }

  Future<int> delete(String id) async {
    return await db!.delete(tabletransactions,
        where: '$columnId_Receipt_No = ?', whereArgs: [id]);
  }

  Future<int> update(transaction todo) async {
    return await db!.update(tabletransactions, todo.tabletoMap(),
        where: '$columnId_Receipt_No = ?', whereArgs: [todo.Receipt_No]);
  }

  Future close() async => db!.close();
}
