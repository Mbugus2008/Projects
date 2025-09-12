import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matatu/member/accounts.dart';

final fakeCreditCardProvider = Provider((ref) => [
      accountsmodel(
        acc: accounts(
          name: "Savings",
          balance: 5750.20,
          lastdateupdated: DateTime.now().add(const Duration(days: 28)),
        ),
      ),
      accountsmodel(
        acc: accounts(
          name: "XMas",
          balance: 10985.84,
          lastdateupdated: DateTime.now().add(const Duration(days: 35)),
        ),
      ),
    ]);
