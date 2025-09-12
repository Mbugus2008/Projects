import 'package:s_mobile/transaction/enums.dart';

enum blocked {
  /// <remarks/>
  _blank_,

  /// <remarks/>
  Credit,

  /// <remarks/>
  Debit,

  /// <remarks/>
  All,
}

extension enumm on blocked {
  String get value {
    switch (this) {
      case blocked._blank_:
        return " ";
      case blocked.Credit:
        return "Credit";
      case blocked.Debit:
        return "Debit";
      case blocked.All:
        return "All";
      default:
        return "";
    }
  }
}

/// <remarks/>
enum status {
  /// <remarks/>
  _blank_,

  /// <remarks/>
  New,

  /// <remarks/>
  Active,

  /// <remarks/>
  Dormant,

  /// <remarks/>
  Frozen,

  /// <remarks/>
  Withdrawal_Application,

  /// <remarks/>
  Withdrawn,

  /// <remarks/>
  Deceased,

  /// <remarks/>
  Defaulter,

  /// <remarks/>
  Closed,

  /// <remarks/>
  Blocked,
}

enum product_Category {
  /// <remarks/>
  _blank_,

  /// <remarks/>
  Share_Capital,

  /// <remarks/>
  Deposit_Contribution,

  /// <remarks/>
  Registration_Fee,

  /// <remarks/>
  Benevolent_Fund,

  /// <remarks/>
  Prepayment,

  /// <remarks/>
  Demand_Savings,

  /// <remarks/>
  Travel_Savings,

  /// <remarks/>
  Savings,

  /// <remarks/>
  Fixed_Deposit,

  /// <remarks/>
  Junior,

  /// <remarks/>
  MPesa_Agent,

  /// <remarks/>
  Holiday,

  /// <remarks/>
  Education,

  /// <remarks/>
  Unallocated_Fund,
}

extension product_category on product_Category {
  String get value {
    switch (this) {
      case product_Category.Benevolent_Fund:
        return "Benevolent_Fund";
      case product_Category.Demand_Savings:
        return "Demand_Savings";
      case product_Category.Deposit_Contribution:
        return "Deposit_Contribution";
      case product_Category.Education:
        return "Education";
      case product_Category.Fixed_Deposit:
        return "Fixed_Deposit";
      case product_Category.Holiday:
        return "Holiday";
      case product_Category.Junior:
        return "Junior";
      case product_Category.MPesa_Agent:
        return "MPesa_Agent";
      case product_Category.Prepayment:
        return "Prepayment";
      case product_Category.Registration_Fee:
        return "Registration_Fee";
      case product_Category.Savings:
        return "Savings";
      case product_Category.Share_Capital:
        return "Share_Capital";
      case product_Category.Travel_Savings:
        return "Travel_Savings";
      case product_Category.Unallocated_Fund:
        return "Unallocated_Fund";
      case product_Category._blank_:
        return "	_blank_";
      default:
        return "";
    }
  }
}
