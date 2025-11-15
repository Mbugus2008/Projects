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
import '../helpers/security_helper.dart';
import '../loans/loan_entries.dart';
import '../member/account_entries.dart';
import '../member/accounts.dart';
import '../member/member_accounts.dart';
import '../member/member_data.dart';
import 'Apis.dart';

class MemberController extends GetxController {
  Rx<member> data = member().obs;

  Rx<Statistic> stats = Statistic().obs;
  RxList<Loan> loan = <Loan>[].obs;
  RxList<Loan> Outstandingloan = <Loan>[].obs;
  RxList<Loan> pastloan = <Loan>[].obs;
  RxList<accounts> maccounts = <accounts>[].obs;
  RxList<MemberAccount> memberAccounts = <MemberAccount>[].obs;
  RxList<AccountEntry> accountEntries = <AccountEntry>[].obs;
  RxList<LoanEntry> loanEntries = <LoanEntry>[].obs;
  RxBool isLoadingAccountEntries = false.obs;
  RxBool isLoadingLoanEntries = false.obs;
  RxList<ledgers> ledgerentries = <ledgers>[].obs;
  RxList<Collections> collections = <Collections>[].obs;

  /// Determines the type of login identifier and formats it appropriately
  String formatLoginIdentifier(String identifier) {
    String cleaned = identifier.trim().replaceAll(' ', '');

    // Check if it's a phone number (starts with + or numbers, 10-15 digits)
    if (SecurityHelper.isValidKenyanPhone(cleaned)) {
      return SecurityHelper.formatKenyanPhone(cleaned);
    }

    // Check if it's a vehicle number (contains letters and numbers, typically 3-8 chars)
    if (RegExp(r'^[A-Za-z0-9]{3,8}$').hasMatch(cleaned)) {
      return cleaned.toUpperCase(); // Vehicle numbers are typically uppercase
    }

    // Otherwise treat as member number or account number
    return cleaned;
  }

  void getvehicles(String memberNo) {
    var request = VehiclesRequest(Member: memberNo);
    ApiClient()
        .postdataLegacy("Members/GetMemberVehicles", request.toJson())
        .then((value) {
      if (value.statusCode == 200) {
        Vehicles_Results results = Vehicles_Results.fromJson(value.body);
        switch (results.Code) {
          case 0:
            {
              data.value.vehicles = results.Contents;
              update();
            }
            break;
          default:
            {}
        }
      }
    });
  }

  void getloans(String memberNo) {
    var request = LoansRequest(Member: memberNo);
    ApiClient()
        .postdataLegacy("Members/GetMemberLoans", request.toJson())
        .then((value) {
      if (value.statusCode == 200) {
        Loans_Results results = Loans_Results.fromJson(value.body);
        switch (results.Code) {
          case 0:
            {
              data.value.loans = results.Contents;
              loan.value = results.Contents!;
              Outstandingloan.value = loan
                  .where((e) => (e.Loan_Balance ?? e.Credit_Balance ?? 0) > 0)
                  .toList();
              pastloan.value = loan
                  .where((e) => (e.Loan_Balance ?? e.Credit_Balance ?? 0) == 0)
                  .toList();
              update(); // Trigger GetBuilder rebuild
            }
            break;
          default:
            {}
        }
      }
    });
  }

  void getmemberaccounts(String memberNo) {
    var request = Request(header: Header(), Member: memberNo);
    ApiClient()
        .postdataLegacy("Members/GetMemberAccounts", request.toJson())
        .then((value) {
      if (value.statusCode == 200) {
        MemberAccountsResults results =
            MemberAccountsResults.fromJson(value.body);
        switch (results.Code) {
          case 0:
            {
              memberAccounts.value = results.Contents ?? [];
              // Convert to legacy accounts format for display
              maccounts.clear();
              for (var acc in memberAccounts) {
                maccounts.add(accounts(
                  No: acc.No,
                  name: acc.Name,
                  balance: acc.Net_Change,
                ));
              }
              update();
            }
            break;
          default:
            {}
        }
      }
    });
  }

  void getAccountEntries(String accountNo) {
    accountEntries.clear();
    isLoadingAccountEntries.value = true;
    var request = AccountRequest(Account: accountNo);
    ApiClient()
        .postdataLegacy("Members/GetAccountEntries", request.toJson())
        .then((value) {
      if (value.statusCode == 200) {
        AccountEntriesResults results =
            AccountEntriesResults.fromJson(value.body);
        switch (results.Code) {
          case 0:
            {
              accountEntries.value = results.Contents ?? [];
              isLoadingAccountEntries.value = false;
              update();
            }
            break;
          default:
            {
              isLoadingAccountEntries.value = false;
              update();
            }
        }
      } else {
        isLoadingAccountEntries.value = false;
        update();
      }
    }).catchError((error) {
      isLoadingAccountEntries.value = false;
      update();
    });
  }

  void getLoanEntries(String loanNo) {
    loanEntries.clear();
    isLoadingLoanEntries.value = true;
    var request = LoanEntriesRequest(loanNo: loanNo);
    ApiClient()
        .postdataLegacy("Members/GetLoanEntries", request.toJson())
        .then((value) {
      if (value.statusCode == 200) {
        LoanEntriesResults results = LoanEntriesResults.fromJson(value.body);
        switch (results.Code) {
          case 0:
            {
              loanEntries.value = results.Contents ?? [];
              isLoadingLoanEntries.value = false;
              update();
            }
            break;
          default:
            {
              isLoadingLoanEntries.value = false;
              update();
            }
        }
      } else {
        isLoadingLoanEntries.value = false;
        update();
      }
    }).catchError((error) {
      isLoadingLoanEntries.value = false;
      update();
    });
  }

  void getledgers(accounts acc) {
    ledgerentries.clear();
    var request = ledger_request(
        header: Header(),
        body: acc.No,
        size: 1000,
        TType: acc.transaction_types);
    ApiClient()
        .postdataLegacy("ledgerentries_bytype", request.toJson())
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
    ledgerentries.clear();
    var request = trequest(
        header: Header(),
        size: 1000,
        vehicle: acc.Vehicle_Number,
        Account: acc.Code);
    ApiClient().postdataLegacy("collections", request.toJson()).then((value) {
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

    maccounts.clear();
    maccounts.addAll([
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

  Future<void> GetMember(String identifier) async {
    // Format the identifier (phone, member number, or vehicle number)
    String formattedIdentifier = formatLoginIdentifier(identifier);

    // Fetch member data from API
    var request = Request(header: Header(), No: formattedIdentifier);
    await ApiClient()
        .postdataLegacy("Members/GetMember", request.toJson())
        .then((r) async {
      if (r.statusCode == 200) {
        Member_Results results = Member_Results.fromJson(r.body);
        data.value = results.Contents!;
        data.value.Logged_In = true;

        // Fire background requests
        if (data.value.No != null) {
          getvehicles(data.value.No!);
          getloans(data.value.No!);
          getmemberaccounts(data.value.No!);
        }

        // Load accounts if statistics are available
        if (data.value.statistics != null) {
          stats.value = data.value.statistics!;
          getlistaccounts();
        }

        update(); // Notify GetBuilder widgets to rebuild
      }
    });
  }

  Future<void> login(
      String identifier, String Password, BuildContext context) async {
    // Format the identifier (phone, member number, or vehicle number)
    String formattedIdentifier = formatLoginIdentifier(identifier);

    // Simulate an async operation (e.g., fetching data from an API)
    var request = Request(header: Header(), No: formattedIdentifier);
    await ApiClient()
        .postdataLegacy("Members/GetMember", request.toJson())
        .then((r) async {
      if (r.statusCode == 200) {
        Member_Results results = Member_Results.fromJson(r.body);
        data.value = results.Contents!;
        data.value.Logged_In = true;

        if (data.value.Password == Password) {
          // Navigate immediately
          Get.to(() => MyHomePage());

          // Fire background requests after navigation
          if (data.value.No != null) {
            getvehicles(data.value.No!);
            getloans(data.value.No!);
            getmemberaccounts(data.value.No!);
          }

          // Load accounts if statistics are available
          if (data.value.statistics != null) {
            stats.value = data.value.statistics!;
            getlistaccounts();
          }
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
