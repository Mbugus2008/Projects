import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matatu/home.dart';
import 'package:matatu/loans/loan.dart';
import 'package:matatu/member/Trans/collections.dart';
import 'package:matatu/member/ledger/ledgers.dart';
import 'package:matatu/member/member.dart';
import 'package:matatu/member/statistics.dart';
import 'package:matatu/vehicles/vehicles.dart';
import 'package:motion_toast/motion_toast.dart';

import '../helpers/ledge_response.dart';
import '../member/accounts.dart';
import '../member/member_data.dart';
import 'Apis.dart';

class MemberController extends GetxController {
  Rx<member> data = member().obs;

  Rx<Statistic> stats = Statistic().obs;
  RxList<Loan> loan = <Loan>[].obs;
  RxList<Loan> Outstandingloan = <Loan>[].obs;
  RxList<Loan> pastloan = <Loan>[].obs;
  RxList<accounts> maccounts = <accounts>[].obs;
  RxList<ledgers> ledgerentries = <ledgers>[].obs;
  RxList<Collections> collections = <Collections>[].obs;
  void getloans(String phone) {
    var request = Request(header: Header(), body: phone);
    ApiClient().postdata("loans", request.toJson()).then((value) {
      if (value.statusCode == 200) {
        Loans_Results results = Loans_Results.fromJson(value.body);
        switch (results.Code) {
          case 0:
            {
              data.value.loans = results.Contents;
              loan.value = results.Contents!;
              Outstandingloan.value =
                  loan.value.where((e) => e.Credit_Balance! > 0).toList();
              pastloan.value =
                  loan.value.where((e) => e.Credit_Balance! == 0).toList();
            }
            break;
          default:
            {}
        }
      }
    });
  }

  void getstats(String phone) {
    var request = Request(header: Header(), body: phone);
    ApiClient().postdata("statistics", request.toJson()).then((value) {
      if (value.statusCode == 200) {
        Statistics_Results results = Statistics_Results.fromJson(value.body);
        switch (results.Code) {
          case 0:
            {
              data.value.statistics = results.Contents;
              stats.value = results.Contents!;
              getlistaccounts();
            }
            break;
          default:
            {}
        }
      }
    });
  }

  void getledgers(accounts acc) {
    ledgerentries.value.clear();
    var request = ledger_request(
        header: Header(),
        body: acc.No,
        size: 1000,
        TType: acc.transaction_types);
    ApiClient()
        .postdata("ledgerentries_bytype", request.toJson())
        .then((value) {
      if (value.statusCode == 200) {
        Ledger_Results results = Ledger_Results.fromJson(value.body);
        switch (results.Code) {
          case 0:
            {
              ledgerentries.value = results.Contents!;
            }
            break;
          default:
            {}
        }
      }
    });
  }

  void getvcollections(Vehicles acc) {
    ledgerentries.value.clear();
    var request = trequest(
        header: Header(),
        size: 1000,
        vehicle: acc.Vehicle_Number,
        Account: acc.Code);
    ApiClient().postdata("collections", request.toJson()).then((value) {
      if (value.statusCode == 200) {
        collection_Results results = collection_Results.fromJson(value.body);
        switch (results.Code) {
          case 0:
            {
              collections.value = results.Contents!;
            }
            break;
          default:
            {}
        }
      }
    });
  }

  getlistaccounts() {
// ,Service Fee Paid,Deposit Payment,Capital Payment,Loan,Repayment,Interest Debit,Interest Credit,Insurance,Housing,Xmas,Welfare,Super Save,Savings,Penalty Charged,Penalty Paid,Land,Investment,Parking,Collateral,Buses,Registration

    maccounts.value.clear();
    maccounts.value.addAll([
      accounts(
          No: stats.value.No,
          name: "Savings",
          balance: stats.value.Savings,
          transaction_types: [Transaction_Types.Savings]),
      accounts(
          No: stats.value.No,
          name: "Xmas",
          balance: stats.value.Xmas,
          transaction_types: [Transaction_Types.Xmas]),
      accounts(
          No: stats.value.No,
          name: "Capital",
          balance: stats.value.Capital_Balance,
          transaction_types: [Transaction_Types.Capital_Payment]),
      accounts(
          No: stats.value.No,
          name: "Deposit",
          balance: stats.value.Deposit_Balance,
          transaction_types: [Transaction_Types.Deposit_Payment]),
      accounts(
          No: stats.value.No,
          name: "Operation 2",
          balance: stats.value.Operation,
          transaction_types: [Transaction_Types.Super_Save]),
      accounts(
          No: stats.value.No,
          name: "Operation",
          balance: stats.value.Operation_Cost,
          transaction_types: [Transaction_Types.Service_Fee_Paid]),
      accounts(
          No: stats.value.No,
          name: "Parking",
          balance: stats.value.Parking,
          transaction_types: [Transaction_Types.Parking]),
      accounts(
          No: stats.value.No,
          name: "Welfare",
          balance: stats.value.Welfare,
          transaction_types: [Transaction_Types.Welfare]),
      accounts(
          No: stats.value.No,
          name: "Loans",
          balance: stats.value.Total_loans_Balances,
          transaction_types: [
            Transaction_Types.Loan,
            Transaction_Types.Repayment,
            Transaction_Types.Interest_Credit,
            Transaction_Types.Interest_Debit
          ]),
    ]);
  }

  Future<void> login(
      String phone, String Password, BuildContext context) async {
    // Simulate an async operation (e.g., fetching data from an API)
    var request = Request(header: Header(), body: phone);
    await ApiClient().postdata("member", request.toJson()).then((r) async {
      if (r.statusCode == 200) {
        Member_Results results = Member_Results.fromJson(r.body);
        data.value = results.Contents!;
        data.value.Logged_In = true;
        getloans(phone);
        getstats(phone);
        //getledgers(data.value.No.toString());
        if (data.value.Password == Password) {
          Get.to(() => MyHomePage());
        } else {
          if (!context.mounted) return;
          MotionToast.error(
            description: Text("Unable to login"),
            title: Text("Login"),
          ).show(context);
        }
      }
    });
  }
}
