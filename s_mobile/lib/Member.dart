import 'package:json_annotation/json_annotation.dart';

part 'Member.g.dart';

@JsonSerializable()
class Member {
  String Key;
  String No;
  String Old_Group_Account_Number;
  String Name;
  String Global_Dimension_2_Code;
  String ID_No;
  String Payroll_Staff_No;
  String FOSA_Account;
  String Section;
  DateTime Registration_Date;
  String Region;
  String Group_Name;
  double Net_Change;
  double Eloan_Limit;
  String MPESA_Mobile_No;
  double Toto_savings;
  double Current_Shares;
  double Chrismas_Contribution;
  double Plaza_Savings;
  double Total_Outstanding_loan_Balance;
  double Shares_Capital;
  double Mobile_Money;
  bool Sending_Mpesa;
  String Comment1;
  String Phone_No;

  Member(
      this.Key,
      this.No,
      this.Old_Group_Account_Number,
      this.Name,
      this.Global_Dimension_2_Code,
      this.ID_No,
      this.Payroll_Staff_No,
      this.FOSA_Account,
      this.Section,
      this.Registration_Date,
      this.Region,
      this.Group_Name,
      this.Net_Change,
      this.Eloan_Limit,
      this.MPESA_Mobile_No,
      this.Toto_savings,
      this.Current_Shares,
      this.Chrismas_Contribution,
      this.Plaza_Savings,
      this.Total_Outstanding_loan_Balance,
      this.Shares_Capital,
      this.Mobile_Money,
      this.Sending_Mpesa,
      this.Comment1,
      this.Phone_No);

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
  Map<String, dynamic> toJson() => _$MemberToJson(this);
}
