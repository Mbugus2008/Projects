import 'package:smobile_manager/Apis.dart';

class NavSetting implements Tomaps {
  String? Serverip;
  String? domain;
  String? Instance;
  String? Port;
  String? Username;
  String? pass;
  String? Companyname;
  String? PostIntervalinsec;
  String? Reconnectintervalinsec;
  String? logpath;
  String? database;
  String? IntegratedSecurity;
  String? certpath;
  String? client;
  String? sms_dest;
  String? partnerID;
  String? Apikey;
  bool? send_sms;
  bool? external_sync;
  bool? emails;

  NavSetting({
    this.Serverip,
    this.domain,
    this.Instance,
    this.Port,
    this.Username,
    this.pass,
    this.Companyname,
    this.PostIntervalinsec,
    this.Reconnectintervalinsec,
    this.logpath,
    this.database,
    this.IntegratedSecurity,
    this.certpath,
    this.client,
    this.sms_dest,
    this.partnerID,
    this.Apikey,
    this.send_sms,
    this.external_sync,
    this.emails,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'Serverip': Serverip,
      'domain': domain,
      'Instance': Instance,
      'Port': Port,
      'Username': Username,
      'pass': pass,
      'Companyname': Companyname,
      'PostIntervalinsec': PostIntervalinsec,
      'Reconnectintervalinsec': Reconnectintervalinsec,
      'logpath': logpath,
      'database': database,
      'IntegratedSecurity': IntegratedSecurity,
      'certpath': certpath,
      'client': client,
      'sms_dest': sms_dest,
      'partnerID': partnerID,
      'Apikey': Apikey,
      'send_sms': send_sms,
      'external_sync': external_sync,
      'emails': emails,
    };
  }

  factory NavSetting.fromMap(Map<String, dynamic> map) {
    return NavSetting(
      Serverip: map['Serverip'],
      domain: map['domain'],
      Instance: map['Instance'],
      Port: map['Port'],
      Username: map['Username'],
      pass: map['pass'],
      Companyname: map['Companyname'],
      PostIntervalinsec: map['PostIntervalinsec'],
      Reconnectintervalinsec: map['Reconnectintervalinsec'],
      logpath: map['logpath'],
      database: map['database'],
      IntegratedSecurity: map['IntegratedSecurity'],
      certpath: map['certpath'],
      client: map['client'],
      sms_dest: map['sms_dest'],
      partnerID: map['partnerID'],
      Apikey: map['Apikey'],
      send_sms: map['send_sms'] as bool?,
      external_sync: map['external_sync'] as bool?,
      emails: map['emails'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => toMap();
}

void updateNavSettings(List<NavSetting> settings, String newServerip, String newPort) {
  for (var setting in settings) {
    setting.Serverip = newServerip;
    setting.Port = newPort;
  }
} 