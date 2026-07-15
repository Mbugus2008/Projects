import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:s_mobile/members/controller.dart';
import 'package:s_mobile/members/entries.dart';
import 'package:s_mobile/members/member.dart';

import 'Loans/Loan.dart';
import 'common/Apis.dart';
import 'common/Results.dart';
import 'common/enums.dart';
import 'common/utilities.dart';
import 'login.dart';
import 'master_page.dart';
import 'members/accounts.dart';
import 'pages/accounts.dart';
import 'pages/dashboard.dart';
import 'pages/ledgerEntries.dart';
import 'pages/loan_list.dart';
import 'pages/member_edit.dart';
import 'pages/eligibility_checker.dart';
import 'pages/newloan.dart';
import 'pages/payment_cart_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.member}) : super(key: key);
  final Member? member;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState() {}
  DateTime? _lastBackPress;
  Future<List<entries>?> getstatements() async {
    List<entries>? ln;
    var request =
        Params(Acc: Get.find<MemberController>().currentCustomer.value.No);
    final r = await ApiClient().postdata("Statement", request.toJson());
    if (r.statusCode == 200) {
      Results3<entries> results =
          Results3<entries>.fromJson(r.body, entries.fromMap);
      switch (results.Code) {
        case 0:
          {
            ln = results.Contents;
            Get.find<MemberController>().currentCustomer.value.Entries = ln;
          }
          break;
        default:
          {
            if (!mounted) return ln;
            MotionToast.error(
              description: Text(results.Desc.toString()),
              title: const Text("Login"),
            ).show(context);
          }
      }
    } else {
      if (!mounted) return ln;
      MotionToast.error(
        description: Text(r.body.toString()),
        title: const Text("Login"),
      ).show(context);
    }
    return ln;
  }

  @override
  void initState() {
    super.initState();
    // Entries are now loaded on-demand when an account is tapped (dashboard/accounts page)
    // getstatements();
  }

  int pageIndex = 0;

  get pages => [
        dashboard(),
        accounts(member: widget.member),
        loans_page(member: widget.member),
      ];

  Container buildMyNavBar(BuildContext context) {
    final navItems = [
      {
        'icon': Icons.grid_view_rounded,
        'iconOff': Icons.grid_view_outlined,
        'label': 'Overview'
      },
      {
        'icon': Icons.account_balance_wallet_rounded,
        'iconOff': Icons.account_balance_wallet_outlined,
        'label': 'Accounts'
      },
      {
        'icon': Icons.receipt_long_rounded,
        'iconOff': Icons.receipt_long_outlined,
        'label': 'Credit'
      },
    ];

    final bottomSafe = MediaQuery.of(context).padding.bottom;
    return Container(
      height: 80 + bottomSafe,
      padding: EdgeInsets.only(bottom: bottomSafe),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2E7D32), Color(0xFF9C27B0)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navItems.length, (i) {
          final active = pageIndex == i;
          return GestureDetector(
            onTap: () => setState(() => pageIndex = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    active
                        ? navItems[i]['icon'] as IconData
                        : navItems[i]['iconOff'] as IconData,
                    color: Colors.white,
                    size: 26,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    navItems[i]['label'] as String,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: active ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 4),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: active ? 3 : 0,
                    width: active ? 24 : 0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    List<Loan>? loans = widget.member?.Loans;
    List<Loan>? activeloans;
    if (loans != null) {
      activeloans = loans.where((e) => e.Outstanding_Balance! > 0).toList();
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        final now = DateTime.now();
        if (_lastBackPress == null ||
            now.difference(_lastBackPress!) > const Duration(seconds: 2)) {
          _lastBackPress = now;
          MotionToast.warning(
            description: const Text('Press again to exit'),
            title: const Text(''),
          ).show(context);
          return;
        }
        // Second press — exit app
        _lastBackPress = null;
        SystemNavigator.pop();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: buildMyNavBar(context),
        drawer: _buildDrawer(context),
        body: pages[pageIndex],
      ),
    );
  }

  // ── Drawer Navigation ─────────────────────────────────────────
  Widget _buildDrawer(BuildContext context) {
    final member = Get.find<MemberController>().currentCustomer.value;
    final String initials = (member.Name ?? '?')
        .split(' ')
        .where((s) => s.isNotEmpty)
        .take(2)
        .map((s) => s[0].toUpperCase())
        .join();

    return Drawer(
      child: Column(
        children: [
          // ── Drawer Header ─────────────────────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2E7D32), Color(0xFF9C27B0)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  child: Text(
                    initials,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  (member.Name ?? 'Member').toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${member.No ?? ''}  |  ${member.Mobile_Phone_No ?? ''}',
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),

          // ── Menu Items ────────────────────────────────────
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _drawerItem(
                  icon: Icons.dashboard_outlined,
                  title: 'Dashboard',
                  onTap: () {
                    setState(() => pageIndex = 0);
                    Navigator.pop(context);
                  },
                ),
                _drawerItem(
                  icon: Icons.account_balance_outlined,
                  title: 'My Accounts',
                  onTap: () {
                    setState(() => pageIndex = 1);
                    Navigator.pop(context);
                  },
                ),
                _drawerItem(
                  icon: Icons.credit_card_outlined,
                  title: 'My Loans',
                  onTap: () {
                    setState(() => pageIndex = 2);
                    Navigator.pop(context);
                  },
                ),
                const Divider(indent: 16, endIndent: 16),
                _drawerItem(
                  icon: Icons.edit_outlined,
                  title: 'Edit Profile',
                  onTap: () {
                    Navigator.pop(context);
                    Get.to(() => Master(
                          member: member,
                          widgets: MemberEditPage(member: member),
                          title: 'Edit Profile',
                        ));
                  },
                ),
                _drawerItem(
                  icon: Icons.add_circle_outline,
                  title: 'Apply for Loan',
                  onTap: () {
                    Navigator.pop(context);
                    Get.to(() => Master(
                          member: member,
                          widgets: NewLoanPage(member: member),
                          title: 'New Loan',
                        ));
                  },
                ),
                _drawerItem(
                  icon: Icons.check_circle_outline,
                  title: 'Check Eligibility',
                  onTap: () {
                    Navigator.pop(context);
                    Get.to(() => Master(
                          member: member,
                          widgets: const EligibilityCheckerPage(),
                          title: 'Eligibility',
                        ));
                  },
                ),
                _drawerItem(
                  icon: Icons.swap_horiz_outlined,
                  title: 'Transfer Funds',
                  onTap: () {
                    Navigator.pop(context);
                    _showTransferSheet(context, member);
                  },
                ),
                _drawerItem(
                  icon: Icons.payment_outlined,
                  title: 'Make Payment',
                  onTap: () {
                    Navigator.pop(context);
                    Get.to(() => Master(
                          member: member,
                          widgets: const PaymentCartPage(),
                          title: 'Payment Cart',
                        ));
                  },
                ),
                _drawerItem(
                  icon: Icons.receipt_long_outlined,
                  title: 'Transaction History',
                  onTap: () {
                    Navigator.pop(context);
                    final entriess =
                        entries().calculateRunningBalance(member.Entries);
                    Get.to(() => Master(
                          member: member,
                          widgets: Ledgerentries(Entries: entriess),
                          title: 'All Transactions',
                        ));
                  },
                ),
                const Divider(indent: 16, endIndent: 16),
                _drawerItem(
                  icon: Icons.logout,
                  title: 'Logout',
                  color: Colors.red,
                  onTap: () {
                    Navigator.pop(context);
                    _showLogoutDialog(context);
                  },
                ),
              ],
            ),
          ),

          // ── Footer ────────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, size: 16, color: Colors.grey),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'S_Mobile v1.0.0',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = Colors.black87,
  }) {
    return ListTile(
      leading: Icon(icon, color: color, size: 24),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      horizontalTitleGap: 12,
      dense: true,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Get.offAll(() => const Login());
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showTransferSheet(BuildContext context, Member member) {
    Account? sourceAcc;
    Account? destAcc;
    final amountController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheetState) => Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Transfer Funds',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D32),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<Account>(
                decoration: const InputDecoration(
                  labelText: 'From Account',
                  border: OutlineInputBorder(),
                ),
                value: sourceAcc,
                items: (member.Accounts ?? [])
                    .where((a) =>
                        a.direction == AccountDirection.Withdrawable ||
                        a.direction == AccountDirection.Both)
                    .map((a) => DropdownMenuItem(
                          value: a,
                          child: Text(
                            '${a.Name ?? a.Product_Name ?? a.No}  [${utilities.formatcurrency.format(a.Balance ?? 0)}]',
                            style: const TextStyle(fontSize: 13),
                          ),
                        ))
                    .toList(),
                onChanged: (v) => setSheetState(() => sourceAcc = v),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<Account>(
                decoration: const InputDecoration(
                  labelText: 'To Account',
                  border: OutlineInputBorder(),
                ),
                value: destAcc,
                items: (member.Accounts ?? [])
                    .where((a) => a.No != sourceAcc?.No)
                    .map((a) => DropdownMenuItem(
                          value: a,
                          child: Text(
                            '${a.Name ?? a.Product_Name ?? a.No}  [${utilities.formatcurrency.format(a.Balance ?? 0)}]',
                            style: const TextStyle(fontSize: 13),
                          ),
                        ))
                    .toList(),
                onChanged: (v) => setSheetState(() => destAcc = v),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                  prefixText: 'KES ',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  if (sourceAcc == null || destAcc == null) {
                    MotionToast.warning(
                      description: const Text('Please select both accounts.'),
                      title: const Text('Transfer'),
                    ).show(ctx);
                    return;
                  }
                  final amt = double.tryParse(amountController.text.trim());
                  if (amt == null || amt <= 0) {
                    MotionToast.warning(
                      description: const Text('Please enter a valid amount.'),
                      title: const Text('Transfer'),
                    ).show(ctx);
                    return;
                  }

                  // Validate source balance
                  final balance = sourceAcc!.Balance ?? 0;
                  if (amt > balance) {
                    MotionToast.error(
                      description: Text(
                          'Insufficient balance. Available: ${utilities.formatcurrency.format(balance)}'),
                      title: const Text('Transfer'),
                    ).show(ctx);
                    return;
                  }

                  try {
                    final body = Params.transactionBody(
                      accountNo: sourceAcc!.No!,
                      transactionType: 9, // Transfer_to_Fosa
                      amount: amt,
                      memberNo: member.No,
                      account2: destAcc!.No,
                    );
                    final response = await ApiClient()
                        .postdata('transaction', json.encode(body));

                    if (!ctx.mounted) return;

                    if (response.statusCode == 200) {
                      final result = Results.fromJson(response.body);
                      if (result.Code == 0) {
                        MotionToast.success(
                          description:
                              Text(result.Desc ?? 'Transfer successful.'),
                          title: const Text('Transfer'),
                        ).show(ctx);
                        Navigator.pop(ctx);
                        _refreshMemberData();
                      } else {
                        MotionToast.error(
                          description: Text(result.Desc ?? 'Transfer failed.'),
                          title: const Text('Transfer'),
                        ).show(ctx);
                      }
                    } else {
                      MotionToast.error(
                        description:
                            Text('Request failed (${response.statusCode}).'),
                        title: const Text('Transfer'),
                      ).show(ctx);
                    }
                  } catch (e) {
                    if (ctx.mounted) {
                      MotionToast.error(
                        description: Text(e.toString()),
                        title: const Text('Transfer'),
                      ).show(ctx);
                    }
                  }
                },
                child: const Text(
                  'Transfer Now',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _refreshMemberData() async {
    final controller = Get.find<MemberController>();
    final phone = controller.loginPhone;
    if (phone == null || phone.isEmpty) return;
    final request = Params(Phone: phone);
    final r = await ApiClient().postdata('member', request.toJson());
    if (r.statusCode == 200) {
      final results = Results2<Member>.fromJson(r.body, Member.fromMap);
      if (results.Code == 0 && results.Contents != null) {
        controller.currentCustomer.value = results.Contents!;
      }
    }
  }
}
