// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../common/Apis.dart';

class Collections {
  String? Key;
  String? Document_No;
  DateTime? Transaction_Date;
  String? Account_No;
  String? Description;
  double? Amount;
  bool? Posted;
  DateTime? Transaction_Time;
  DateTime? Date_Posted;
  DateTime? Time_Posted;
  String? Messages;
  String? OTTN;
  String? Transaction_Location;
  String? Transaction_By;
  String? Agent_Code;
  String? Loan_No;
  String? Account_Name;
  String? Telephone;
  String? Id_No;

  String? Constituency;
  String? Ward;
  String? Type;
  DateTime? Creation_time;
  String? Date;
  String? Time;
  Collections({
    this.Key,
    this.Document_No,
    this.Transaction_Date,
    this.Account_No,
    this.Description,
    this.Amount,
    this.Posted,
    this.Transaction_Time,
    this.Date_Posted,
    this.Time_Posted,
    this.Messages,
    this.OTTN,
    this.Transaction_Location,
    this.Transaction_By,
    this.Agent_Code,
    this.Loan_No,
    this.Account_Name,
    this.Telephone,
    this.Id_No,
    this.Constituency,
    this.Ward,
    this.Type,
    this.Creation_time,
    this.Date,
    this.Time,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Key': Key,
      'Document_No': Document_No,
      'Transaction_Date': Transaction_Date?.millisecondsSinceEpoch,
      'Account_No': Account_No,
      'Description': Description,
      'Amount': Amount,
      'Posted': Posted,
      'Transaction_Time': Transaction_Time?.millisecondsSinceEpoch,
      'Date_Posted': Date_Posted?.millisecondsSinceEpoch,
      'Time_Posted': Time_Posted?.millisecondsSinceEpoch,
      'Messages': Messages,
      'OTTN': OTTN,
      'Transaction_Location': Transaction_Location,
      'Transaction_By': Transaction_By,
      'Agent_Code': Agent_Code,
      'Loan_No': Loan_No,
      'Account_Name': Account_Name,
      'Telephone': Telephone,
      'Id_No': Id_No,
      'Constituency': Constituency,
      'Ward': Ward,
      'Type': Type,
      'Creation_time': Creation_time?.millisecondsSinceEpoch,
      'Date': Date,
      'Time': Time,
    };
  }

  factory Collections.fromMap(Map<String, dynamic> map) {
    return Collections(
      Key: map['Key'] != null ? map['Key'] as String : null,
      Document_No:
          map['Document_No'] != null ? map['Document_No'] as String : null,
      Transaction_Date: map['Transaction_Date'] != null
          ? DateTime.tryParse((map['Transaction_Date'] ?? 0))
          : null,
      Account_No:
          map['Account_No'] != null ? map['Account_No'] as String : null,
      Description:
          map['Description'] != null ? map['Description'] as String : null,
      Amount: map['Amount'] != null ? map['Amount'] as double : null,
      Posted: map['Posted'] != null ? map['Posted'] as bool : null,
      Transaction_Time: map['Transaction_Time'] != null
          ? DateTime.tryParse((map['Transaction_Time'] ?? 0))
          : null,
      Date_Posted: map['Date_Posted'] != null
          ? DateTime.tryParse((map['Date_Posted'] ?? 0))
          : null,
      Time_Posted: map['Time_Posted'] != null
          ? DateTime.tryParse((map['Time_Posted'] ?? 0))
          : null,
      Messages: map['Messages'] != null ? map['Messages'] as String : null,
      OTTN: map['OTTN'] != null ? map['OTTN'] as String : null,
      Transaction_Location: map['Transaction_Location'] != null
          ? map['Transaction_Location'] as String
          : null,
      Transaction_By: map['Transaction_By'] != null
          ? map['Transaction_By'] as String
          : null,
      Agent_Code:
          map['Agent_Code'] != null ? map['Agent_Code'] as String : null,
      Loan_No: map['Loan_No'] != null ? map['Loan_No'] as String : null,
      Account_Name:
          map['Account_Name'] != null ? map['Account_Name'] as String : null,
      Telephone: map['Telephone'] != null ? map['Telephone'] as String : null,
      Id_No: map['Id_No'] != null ? map['Id_No'] as String : null,
      Constituency:
          map['Constituency'] != null ? map['Constituency'] as String : null,
      Ward: map['Ward'] != null ? map['Ward'] as String : null,
      Type: map['Type'] != null ? map['Type'] as String : null,
      Creation_time: map['Creation_time'] != null
          ? DateTime.tryParse((map['Creation_time'] ?? 0))
          : null,
      Date: map['Date'] != null ? map['Date'] as String : null,
      Time: map['Time'] != null ? map['Time'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Collections.fromJson(String source) =>
      Collections.fromMap(json.decode(source) as Map<String, dynamic>);
}

class trequest extends Request {
  String? Account;
  String? vehicle;
  trequest(
      {Header? header,
      String? body,
      String? Otp,
      String? phone,
      String? Otp_message,
      String? bookmark,
      int? size,
      this.Account,
      this.vehicle})
      : super(
            header: header,
            body: body,
            Otp: Otp,
            phone: phone,
            Otp_message: Otp_message,
            bookmark: bookmark,
            size: size);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'header': header?.toMap(),
      'body': body,
      'Otp': Otp,
      'phone': phone,
      'Otp_message': Otp_message,
      'bookmark': bookmark,
      'size': size,
      'Account': Account,
      'vehicle': vehicle,
    };
  }

  factory trequest.fromMap(Map<String, dynamic> map) {
    return trequest(
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
      Account: map['Account'] != null ? map['Account'] as String : null,
      vehicle: map['vehicle'] != null ? map['vehicle'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory trequest.fromJson(String source) =>
      trequest.fromMap(json.decode(source) as Map<String, dynamic>);
}

class collection_Results {
  int? Code = 0;
  String? Desc = "Successful";
  List<Collections>? Contents;
  collection_Results({
    int? code,
    String? desc,
    this.Code,
    this.Desc,
    this.Contents,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Code': Code,
      'Desc': Desc,
      'Contents': Contents?.map((x) => x.toMap()).toList(),
    };
  }

  factory collection_Results.fromMap(Map<String, dynamic> map) {
    return collection_Results(
      Code: map['Code'] != null ? map['Code'] as int : null,
      Desc: map['Desc'] != null ? map['Desc'] as String : null,
      Contents: map['Contents'] != null
          ? List<Collections>.from(
              (map['Contents'] as List<dynamic>).map<Collections?>(
                (x) => Collections.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory collection_Results.fromJson(String source) =>
      collection_Results.fromMap(json.decode(source) as Map<String, dynamic>);
}
