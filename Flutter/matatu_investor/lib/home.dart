import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:matatu/common/Controller.dart';
import 'package:matatu/vehicles/vehicle_types.dart';

import 'helpers/init.dart';
import 'screens/account_entries_screen.dart';
import 'screens/loan_entries_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MemberController>(initState: (state) {
      // Refresh member data when home page loads
      final controller = Get.find<MemberController>();
      if (controller.data.value.No != null) {
        controller.GetMember(controller.data.value.No.toString());
      }
    }, builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              controller.data.value.Name?.isNotEmpty == true
                  ? controller.data.value.Name!
                  : controller.memberAccounts.isNotEmpty
                      ? controller.memberAccounts[0].Name_2 ??
                          controller.data.value.No ??
                          'Member'
                      : controller.data.value.No ?? 'Member',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.blue.shade700,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.refresh_rounded),
                onPressed: () {
                  if (controller.data.value.No != null) {
                    controller.GetMember(controller.data.value.No.toString());
                  }
                },
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade700, Colors.blue.shade900],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person,
                            size: 40, color: Colors.blue.shade700),
                      ),
                      SizedBox(height: 10),
                      Text(
                        controller.data.value.Name?.isNotEmpty == true
                            ? controller.data.value.Name!
                            : controller.memberAccounts.isNotEmpty
                                ? controller.memberAccounts[0].Name_2 ??
                                    'Member'
                                : 'Member',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'No: ${controller.data.value.No ?? ''}',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading:
                      Icon(Icons.person_outline, color: Colors.blue.shade700),
                  title: Text('Member Number'),
                  subtitle: Text(controller.data.value.No ?? 'N/A'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.phone, color: Colors.blue.shade700),
                  title: Text('Phone Number'),
                  subtitle: Text(controller.data.value.Phone_No ?? 'N/A'),
                ),
                ListTile(
                  leading: Icon(Icons.email, color: Colors.blue.shade700),
                  title: Text('Email'),
                  subtitle: Text(controller.data.value.E_Mail ?? 'N/A'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.badge, color: Colors.blue.shade700),
                  title: Text('ID Number'),
                  subtitle: Text(controller.data.value.ID_No ?? 'N/A'),
                ),
                ListTile(
                  leading:
                      Icon(Icons.account_balance, color: Colors.blue.shade700),
                  title: Text('Bank'),
                  subtitle: Text(
                      '${controller.data.value.Bank_Name ?? 'N/A'}${controller.data.value.Bank_Account != null ? ' - ${controller.data.value.Bank_Account}' : ''}'),
                ),
                Divider(),
                ListTile(
                  leading:
                      Icon(Icons.info_outline, color: Colors.blue.shade700),
                  title: Text('Status'),
                  subtitle: Text(controller.data.value.Blocked == 0
                      ? 'Active'
                      : 'Blocked'),
                ),
                ListTile(
                  leading: Icon(Icons.people, color: Colors.blue.shade700),
                  title: Text('Crew Type'),
                  subtitle: Text(
                      controller.data.value.Crew_Type?.toString() ?? 'N/A'),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Hero Metrics Section
                Container(
                  margin: EdgeInsets.all(12),
                  child: _buildHeroMetrics(controller),
                ),

                // Quick Summary Cards
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: _buildQuickSummary(controller),
                ),

                SizedBox(height: 8),

                // Accounts Section Header
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
                  child: Row(
                    children: [
                      Icon(Icons.account_balance_wallet,
                          size: 20, color: Colors.blue.shade700),
                      SizedBox(width: 8),
                      Text(
                        'Accounts',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${controller.maccounts.length}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),

                // Accounts Section - Horizontal Scroll
                Container(
                  height: MediaQuery.of(context).size.height / 6,
                  margin: EdgeInsets.only(bottom: 12),
                  child: controller.maccounts.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          itemCount: controller.maccounts.length,
                          itemBuilder: (context, index) {
                            // Sort accounts: positive, then negative, then zero
                            final sortedAccounts =
                                List.from(controller.maccounts);
                            sortedAccounts.sort((a, b) {
                              final balanceA = a.balance ?? 0;
                              final balanceB = b.balance ?? 0;

                              // Positive balances first
                              if (balanceA > 0 && balanceB <= 0) return -1;
                              if (balanceA <= 0 && balanceB > 0) return 1;

                              // Negative balances before zero
                              if (balanceA < 0 && balanceB == 0) return -1;
                              if (balanceA == 0 && balanceB < 0) return 1;

                              // Within same category, sort by absolute value (larger first)
                              return balanceB.abs().compareTo(balanceA.abs());
                            });

                            final acc = sortedAccounts[index];
                            final balance = acc.balance ?? 0;
                            final isPositive = balance > 0;
                            final isNegative = balance < 0;

                            // Color scheme based on balance
                            final gradientColors = isPositive
                                ? [Colors.green.shade400, Colors.green.shade600]
                                : isNegative
                                    ? [Colors.red.shade400, Colors.red.shade600]
                                    : [
                                        Colors.grey.shade300,
                                        Colors.grey.shade400
                                      ];

                            return Container(
                              width: 120,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 8),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: gradientColors,
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: gradientColors[1].withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    // Navigate to account entries screen
                                    Get.to(() => AccountEntriesScreen(
                                          accountNo: acc.No ?? '',
                                          accountName: acc.name ?? 'Account',
                                        ));
                                  },
                                  borderRadius: BorderRadius.circular(20),
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Account icon and name
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Icon(
                                                isPositive
                                                    ? Icons
                                                        .account_balance_wallet
                                                    : isNegative
                                                        ? Icons.trending_down
                                                        : Icons.account_balance,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Account name
                                        Text(
                                          acc.name ?? 'Account',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        // Balance
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Balance',
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontSize: 9,
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              utilities.formatcurrency
                                                  .format(balance.abs()),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(height: 8),
                                Text('Loading accounts...',
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                ),
                //Vehicles
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
                  child: Row(
                    children: [
                      Icon(Icons.directions_bus_rounded,
                          size: 20, color: Colors.blue.shade700),
                      SizedBox(width: 8),
                      Text(
                        'Vehicles',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${(controller.data.value.vehicles ?? []).length}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),

                // Vehicles Section
                Container(
                  height: 400,
                  child: Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        // Summary Section
                        if (controller.data.value.vehicles?.isNotEmpty ?? false)
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.blue.shade200,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Builder(builder: (context) {
                              // Calculate totals
                              var vehicles =
                                  controller.data.value.vehicles ?? [];
                              double totalToday = vehicles.fold(
                                  0,
                                  (sum, vehicle) =>
                                      sum + (vehicle.Total_collection ?? 0));
                              int totalVehicles = vehicles.length;
                              int activeVehicles = vehicles
                                  .where(
                                      (v) => v.Status == vehicle_Status.Active)
                                  .length;

                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _buildSummaryItem(
                                    'Total Today',
                                    utilities.formatcurrency.format(totalToday),
                                    Icons.today,
                                    Colors.blue.shade700,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 1,
                                    color: Colors.blue.shade300,
                                  ),
                                  _buildSummaryItem(
                                    'Active',
                                    '$activeVehicles',
                                    Icons.check_circle,
                                    Colors.blue.shade800,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 1,
                                    color: Colors.blue.shade300,
                                  ),
                                  _buildSummaryItem(
                                    'Total',
                                    '$totalVehicles',
                                    Icons.directions_bus_rounded,
                                    Colors.blue.shade600,
                                  ),
                                ],
                              );
                            }),
                          ),

                        // ListView to display vehicle data
                        Expanded(
                          child: (controller.data.value.vehicles?.isEmpty ??
                                  true)
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(
                                        color: Colors.blue,
                                      ),
                                      SizedBox(height: 16),
                                      Text('Loading vehicles...',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey.shade600)),
                                    ],
                                  ),
                                )
                              : ListView.builder(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      controller.data.value.vehicles?.length ??
                                          0,
                                  itemBuilder: (context, index) {
                                    var vehicle =
                                        controller.data.value.vehicles?[index];
                                    var isActive = vehicle?.Status ==
                                        vehicle_Status.Active;

                                    return Card(
                                      elevation: isActive ? 3 : 1,
                                      margin: EdgeInsets.symmetric(vertical: 4),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: BorderSide(
                                          color: isActive
                                              ? Colors.blue.shade200
                                              : Colors.grey.shade300,
                                          width: isActive ? 1.5 : 1,
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          // Handle tap event
                                        },
                                        borderRadius: BorderRadius.circular(12),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Icon
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: isActive
                                                      ? Colors.blue.shade50
                                                      : Colors.grey.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Icon(
                                                  Icons.directions_bus_rounded,
                                                  size: 24,
                                                  color: isActive
                                                      ? Colors.blue.shade700
                                                      : Colors.grey.shade500,
                                                ),
                                              ),
                                              SizedBox(width: 12),

                                              // Vehicle details
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // Registration number
                                                    Text(
                                                      vehicle?.Vehicle_Number ??
                                                          'N/A',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: isActive
                                                            ? Colors.black87
                                                            : Colors
                                                                .grey.shade600,
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),

                                                    // Capacity
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .event_seat_rounded,
                                                          size: 14,
                                                          color: Colors
                                                              .grey.shade500,
                                                        ),
                                                        SizedBox(width: 4),
                                                        Text(
                                                          vehicle?.Vehicle_Type
                                                                  ?.value ??
                                                              'Unknown',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors
                                                                .grey.shade600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 4),

                                                    // Start date
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .calendar_today_rounded,
                                                          size: 12,
                                                          color: Colors
                                                              .grey.shade500,
                                                        ),
                                                        SizedBox(width: 4),
                                                        Text(
                                                          'Started: ${DateFormat('dd MMM yyyy').format(vehicle?.Start_Date ?? DateTime(2019, 01, 01))}',
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            color: Colors
                                                                .grey.shade600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              // Collection amount
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    utilities.formatcurrency
                                                        .format(vehicle
                                                                ?.Total_collection ??
                                                            0),
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: isActive
                                                          ? Colors.blue.shade700
                                                          : Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    'Today',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.grey.shade600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Loans Section
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
                  child: Row(
                    children: [
                      Icon(Icons.account_balance_wallet_rounded,
                          size: 20, color: Colors.orange.shade700),
                      SizedBox(width: 8),
                      Text(
                        'Loans',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${(controller.data.value.loans ?? []).length}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),

                // Loans Container
                Container(
                  height: 450,
                  child: Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        // Summary Section
                        if (controller.data.value.loans?.isNotEmpty ?? false)
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.blue.shade200,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Builder(builder: (context) {
                              // Calculate totals
                              var loans = controller.data.value.loans ?? [];
                              double totalBalance = loans.fold(
                                  0,
                                  (sum, loan) =>
                                      sum + (loan.loan_balance ?? 0));
                              double totalArrears = loans.fold(
                                  0,
                                  (sum, loan) =>
                                      sum + (loan.Amount_In_Arreares ?? 0));
                              double totalMonthly = loans.fold(
                                  0,
                                  (sum, loan) =>
                                      sum +
                                      (loan.Monthly_Installment ??
                                          loan.Monthly_Repayment ??
                                          0));

                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _buildSummaryItem(
                                    'Total Balance',
                                    utilities.formatcurrency
                                        .format(totalBalance),
                                    Icons.account_balance,
                                    Colors.blue.shade700,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 1,
                                    color: Colors.blue.shade300,
                                  ),
                                  _buildSummaryItem(
                                    'Total Arrears',
                                    utilities.formatcurrency
                                        .format(totalArrears),
                                    Icons.warning_amber_rounded,
                                    Colors.blue.shade800,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 1,
                                    color: Colors.blue.shade300,
                                  ),
                                  _buildSummaryItem(
                                    'Monthly',
                                    utilities.formatcurrency
                                        .format(totalMonthly),
                                    Icons.calendar_month,
                                    Colors.blue.shade600,
                                  ),
                                ],
                              );
                            }),
                          ),

                        // ListView to display loan data
                        Expanded(
                          child: (controller.data.value.loans?.isEmpty ?? true)
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(
                                        color: Colors.orange,
                                      ),
                                      SizedBox(height: 16),
                                      Text('Loading loans...',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey.shade600)),
                                    ],
                                  ),
                                )
                              : ListView.builder(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  itemCount:
                                      controller.data.value.loans?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    // Sort loans: ones with balance on top
                                    var sortedLoans = List.from(
                                        controller.data.value.loans ?? []);
                                    sortedLoans.sort((a, b) {
                                      var balanceA = a.loan_balance ?? 0;
                                      var balanceB = b.loan_balance ?? 0;
                                      return balanceB.compareTo(balanceA);
                                    });

                                    var loan = sortedLoans[index];
                                    var hasBalance =
                                        (loan.loan_balance ?? 0) > 0;
                                    var balance = loan.loan_balance ?? 0;
                                    var monthly = loan.Monthly_Installment ??
                                        loan.Monthly_Repayment ??
                                        0;

                                    return Card(
                                      elevation: hasBalance ? 3 : 1,
                                      margin: EdgeInsets.symmetric(vertical: 4),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: BorderSide(
                                          color: hasBalance
                                              ? Colors.blue.shade200
                                              : Colors.grey.shade300,
                                          width: hasBalance ? 1.5 : 1,
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(() => LoanEntriesScreen(
                                                loanNo: loan.Loan_No ??
                                                    loan.Credit_Number ??
                                                    '',
                                                loanName: loan.Product_Name ??
                                                    loan.Loan_Type ??
                                                    'Loan',
                                                loan: loan,
                                              ));
                                        },
                                        borderRadius: BorderRadius.circular(12),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Icon
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: hasBalance
                                                      ? Colors.blue.shade50
                                                      : Colors.grey.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Icon(
                                                  Icons
                                                      .account_balance_wallet_rounded,
                                                  size: 24,
                                                  color: hasBalance
                                                      ? Colors.blue.shade700
                                                      : Colors.grey.shade500,
                                                ),
                                              ),
                                              SizedBox(width: 12),

                                              // Loan details
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // Loan type
                                                    Text(
                                                      loan.Product_Name ??
                                                          loan.Loan_Type ??
                                                          loan.Credit_Type ??
                                                          'Loan',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: hasBalance
                                                            ? Colors.black87
                                                            : Colors
                                                                .grey.shade600,
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),

                                                    // Loan number
                                                    Text(
                                                      loan.Loan_No ??
                                                          loan.Credit_Number ??
                                                          '',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors
                                                            .grey.shade600,
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),

                                                    // Start date
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .calendar_today_rounded,
                                                          size: 12,
                                                          color: Colors
                                                              .grey.shade500,
                                                        ),
                                                        SizedBox(width: 4),
                                                        Text(
                                                          DateFormat(
                                                                  'dd MMM yyyy')
                                                              .format(loan
                                                                      .Repayment_Start_Date ??
                                                                  loan
                                                                      .Credit_Application_Date ??
                                                                  DateTime(2019,
                                                                      01, 01)),
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            color: Colors
                                                                .grey.shade600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              // Amounts
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  // Balance
                                                  Text(
                                                    utilities.formatcurrency
                                                        .format(balance),
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: hasBalance
                                                          ? Colors
                                                              .orange.shade700
                                                          : Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    'Balance',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.grey.shade600,
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),

                                                  // Monthly payment
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 4),
                                                    decoration: BoxDecoration(
                                                      color: hasBalance
                                                          ? Colors
                                                              .orange.shade100
                                                          : Colors
                                                              .grey.shade200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          utilities
                                                              .formatcurrency
                                                              .format(monthly),
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: hasBalance
                                                                ? Colors.orange
                                                                    .shade900
                                                                : Colors.grey
                                                                    .shade700,
                                                          ),
                                                        ),
                                                        Text(
                                                          '/month',
                                                          style: TextStyle(
                                                            fontSize: 9,
                                                            color: Colors
                                                                .grey.shade600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Card(
                //   elevation: 20,
                //   //color: Colors.transparent,
                //   child: Container(
                //     decoration: widgets().border(context),
                //     //padding: EdgeInsets.only(bottom: 10),
                //     child: Column(
                //       children: [
                //         if ((controller.data.value.vehicles != null))
                //           Card(
                //             elevation: 20,
                //             margin: EdgeInsets.only(left: 1, bottom: 2),
                //             child: Container(
                //               height: 30,
                //               decoration: widgets().container3(context),
                //               width: MediaQuery.of(context).size.width - 2,
                //               padding: EdgeInsets.only(left: 5),
                //               child: Vsummary(
                //                   vehicles: controller.data.value.vehicles),
                //             ),
                //           ),
                //         // Divider(color: Colors.black),
                //         ConstrainedBox(
                //             constraints: BoxConstraints(
                //                 minHeight: 20,
                //                 maxHeight:
                //                     MediaQuery.of(context).size.height /
                //                         2.3),
                //             child: MediaQuery.removePadding(
                //               removeTop: true,
                //               context: context,
                //               child: ListView.builder(
                //                   shrinkWrap: true,
                //                   itemCount:
                //                       controller.data.value.vehicles == null
                //                           ? 0
                //                           : controller
                //                               .data.value.vehicles?.length,
                //                   itemBuilder:
                //                       (BuildContext context, int index) {
                //                     return Vehicles_widgets().buildItem(
                //                         context,
                //                         index,
                //                         controller.data.value.vehicles
                //                             as List<Vehicles>);
                //                   }),
                //             )),
                //         if ((controller.data.value.vehicles != null))
                //           Card(
                //             elevation: 20,
                //             margin: EdgeInsets.only(left: 1, top: 2),
                //             child: Container(
                //               height: 20,
                //               decoration: widgets().container3(context),
                //               //width: MediaQuery.of(context).size.width - 2,
                //               //padding: EdgeInsets.only(left: 5),
                //               child: Vtotals(
                //                   vehicles: controller.data.value.vehicles),
                //             ),
                //           ),
                //       ],
                //     ),
                //   ),
                // ),

                //Loans

                // Card(
                //   color: Colors.transparent,
                //   elevation: 20,
                //   child: SizedBox(
                //     //height: MediaQuery.of(context).size.height / 4,
                //     //decoration: widgets().border(context),
                //     child: Column(
                //       children: [
                //         //Obx(() {
                //         controller.Outstandingloan.value.isNotEmpty
                //             ? Column(children: [
                //                 Card(
                //                   elevation: 20,
                //                   child: Container(
                //                     height: 30,
                //                     decoration:
                //                         widgets().container3(context),
                //                     //padding: EdgeInsets.only(left: 5),
                //                     child: Loans_summary(),
                //                   ),
                //                 ),
                //                 //Divider(color: Colors.black),
                //                 MediaQuery.removePadding(
                //                   removeTop: true,
                //                   context: context,
                //                   child: ListView.builder(
                //                       shrinkWrap: true,
                //                       itemCount: controller
                //                           .Outstandingloan.value.length,
                //                       itemBuilder: (BuildContext context,
                //                           int index) {
                //                         return Loans_widgets(
                //                           loans: controller
                //                               .Outstandingloan.value[index],
                //                           index: index,
                //                         );
                //                       }),
                //                 ),
                //
                //                 Card(
                //                   elevation: 20,
                //                   child: Container(
                //                     height: 30,
                //                     decoration:
                //                         widgets().container3(context),
                //                     padding: EdgeInsets.only(left: 5),
                //                     child: Loans_Totals(
                //                         loans: controller
                //                             .Outstandingloan.value),
                //                   ),
                //                 ),
                //               ])
                //             : CircularProgressIndicator(
                //                 semanticsLabel: "Getting loans")
                //
                //         // }),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ));
    });
  }

  Widget _buildSummaryItem(
      String label, String value, IconData icon, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: color),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: color,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 9,
            color: Colors.grey.shade700,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildHeroMetrics(MemberController controller) {
    // Calculate key metrics
    final totalAccountBalance = controller.maccounts
        .fold<double>(0, (sum, acc) => sum + (acc.balance ?? 0));
    final totalLoanBalance = (controller.data.value.loans ?? [])
        .fold<double>(0, (sum, loan) => sum + (loan.loan_balance ?? 0));
    final totalVehicleCollection = (controller.data.value.vehicles ?? [])
        .fold<double>(
            0, (sum, vehicle) => sum + (vehicle.Total_collection ?? 0));
    final netWorth = totalAccountBalance - totalLoanBalance;

    return Card(
      elevation: 0,
      color: Colors.blue.shade700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade700, Colors.blue.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Net Worth',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.trending_up, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text(
                        'Today',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              utilities.formatcurrency.format(netWorth),
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w800,
                letterSpacing: -1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            Text(
              'Collections: ${utilities.formatcurrency.format(totalVehicleCollection)}',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickSummary(MemberController controller) {
    final activeVehicles = (controller.data.value.vehicles ?? [])
        .where((v) => v.Status == vehicle_Status.Active)
        .length;
    final activeLoans = (controller.data.value.loans ?? [])
        .where((l) => (l.loan_balance ?? 0) > 0)
        .length;
    final totalAccounts = controller.maccounts.length;

    return Row(
      children: [
        Expanded(
          child: _buildMetricCard(
            'Vehicles',
            '$activeVehicles Active',
            Icons.directions_bus_rounded,
            Colors.blue.shade50,
            Colors.blue.shade700,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: _buildMetricCard(
            'Loans',
            '$activeLoans Active',
            Icons.account_balance_wallet_rounded,
            Colors.blue.shade100,
            Colors.blue.shade800,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: _buildMetricCard(
            'Accounts',
            '$totalAccounts Total',
            Icons.account_balance,
            Colors.blue.shade100,
            Colors.blue.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon,
      Color bgColor, Color iconColor) {
    return Card(
      elevation: 0,
      color: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor, size: 24),
            SizedBox(height: 12),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: iconColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
