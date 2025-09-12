import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:s_mobile/Loans/Loan_Type.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/common/widgets.dart';
import 'package:s_mobile/master_page.dart';
import 'package:s_mobile/members/accounts.dart';
import 'package:s_mobile/members/controller.dart';
import 'package:s_mobile/members/entries.dart';
import 'package:s_mobile/members/member.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class menu extends StatefulWidget {
  const menu({
    Key? key,
    required this.member,
    required this.Name,
    required this.menus,
  }) : super(key: key);

  final Member? member;
  final String? Name;
  final Menus? menus;

  @override
  State<menu> createState() => _menuState();
}

enum Menus { Balance, Ministatement, Transfer, Pay, Apply_Loan }

class _menuState extends State<menu> {
  final double w = 90;
  List<entries> ent = <entries>[];

  Future<void> trans(BuildContext context, Account source, Account dest,
      double amount) async {}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          switch (widget.menus) {
            case Menus.Ministatement:
              {
                _selectedValue = null;
                await Otp(context);
                if (_selectedValue != null) {
                  entries().Getentries(context, _selectedValue?.No);
                  if (!mounted) return;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Master(
                                member: widget.member,
                                widgets: ministatement(
                                    context: context, m: widget.member),
                              )));
                }
                break;
              }
            case Menus.Balance:
              if (!mounted) return;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => Master(
                          member: widget.member,
                          widgets: balances(m: widget.member),
                          title: 'Balances')));
              break;
            case Menus.Transfer:
              if (!mounted) return;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => Master(
                            member: widget.member,
                            widgets: transfer(widget.member),
                          )));
              break;
            case Menus.Pay:
              if (!mounted) return;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => Master(
                            member: widget.member,
                            widgets: Pay(widget.member),
                          )));
              break;
            case Menus.Apply_Loan:
              if (!mounted) return;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => Master(
                            member: widget.member,
                            widgets: Applyloan(widget.member),
                          )));
              break;
            default:
              if (!mounted) return;
              MotionToast.info(
                description: Text("Coming soon"),
                title: Text("Working on it"),
              ).show(context);
              break;
          }
        },
        child: Expanded(
          child: Row(
            children: [
              Spacer(),
              Text('${widget.Name}'),
              Spacer(),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 35,
              ),
            ],
          ),
        ));
  }

  Future<Account> Otp(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
            builder: (context, setState) => AlertDialog(
                  title: Center(child: Text("Select Account")),
                  content: StatefulBuilder(builder: (context, setState) {
                    return DropdownButton<Account>(
                        value: _selectedValue,
                        onChanged: (Account? newValue) {
                          setState(() {
                            _selectedValue = newValue;
                            entries().Getentries(context, _selectedValue?.No);
                          });
                        },
                        items: widget.member!.Accounts!
                            .map<DropdownMenuItem<Account>>((Account value) {
                          return DropdownMenuItem<Account>(
                            value: value,
                            child: Text('${value.Name}'),
                          );
                        }).toList());
                  }),
                  actions: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context, null);
                      },
                      child: Text(
                        "Cancel",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    MaterialButton(
                      child: Text("Ok"),
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context, _selectedValue);
                        });
                      },
                    ),
                  ],
                )));
  }

  Account? _selectedValue, _sourceacc, _destaccount;
  double? Amount;

  Container transfer(Member? m) {
    return Container(
      margin: EdgeInsets.only(top: 150, bottom: 50),
      decoration: widgets().backgroundimage(context),
      width: MediaQuery.of(context).size.width,
      child: Expanded(
        child: Card(
          color: Theme.of(context).primaryColor,
          elevation: 50,
          child: Column(
            children: [
              Spacer(),
              StatefulBuilder(builder: (context, setState) {
                return Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Source Account"),
                          Spacer(),
                          DropdownButton<Account>(
                              value: _sourceacc,
                              onChanged: (Account? newValue) {
                                setState(() {
                                  _sourceacc = newValue;
                                });
                              },
                              items: widget.member!.Accounts!
                                  .map<DropdownMenuItem<Account>>(
                                      (Account value) {
                                return DropdownMenuItem<Account>(
                                  value: value,
                                  child: Text('${value.Product_Name}'),
                                );
                              }).toList())
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Balance: ${utilities.formatcurrency.format(_sourceacc?.Balance ?? 0)}',
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Row(
                        children: [
                          Text("Destination Account"),
                          Spacer(),
                          DropdownButton<Account>(
                              value: _destaccount,
                              onChanged: (Account? newValue) {
                                setState(() {
                                  _destaccount = newValue;
                                });
                              },
                              items: widget.member!.Accounts!
                                  .map<DropdownMenuItem<Account>>(
                                      (Account value) {
                                return DropdownMenuItem<Account>(
                                  value: value,
                                  child: Text('${value.Product_Name}'),
                                );
                              }).toList())
                        ],
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              'Balance: ${utilities.formatcurrency.format(_destaccount?.Balance ?? 0)}')),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Amount to Transfer'),
                        onFieldSubmitted: (value) => Amount = value as double?,
                      ),
                      MaterialButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          trans(context, _sourceacc!, _destaccount!, Amount!);
                          if (!mounted) return;
                          MotionToast.info(
                            description: Text("Coming soon"),
                            title: Text("Working on it"),
                          ).show(context);
                        },
                        child: const Text(
                          'Transfer Funds',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Container Pay(Member? m) {
    return Container(
      decoration: widgets().backgroundimage(context),
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 20,
        child: Column(
          children: [
            Spacer(),
            StatefulBuilder(builder: (context, setState) {
              return Container(
                child: Column(
                  children: [
                    Card(
                      elevation: 20,
                      child: Row(
                        children: [
                          Text("Source"),
                          Spacer(),
                          DropdownButton<Account>(
                              value: _sourceacc,
                              onChanged: (Account? newValue) {
                                setState(() {
                                  _sourceacc = newValue;
                                });
                              },
                              items: widget.member!.Source_accounts!
                                  .map<DropdownMenuItem<Account>>(
                                      (Account value) {
                                return DropdownMenuItem<Account>(
                                  value: value,
                                  child: Text('${value.Product_Name}'),
                                );
                              }).toList())
                        ],
                      ),
                    ),
                    Text(
                        'Balance: ${utilities.formatcurrency.format(_sourceacc?.Balance ?? 0)}'),
                    Card(
                      elevation: 20,
                      child: Row(
                        children: [
                          Text("Destination Account"),
                          Spacer(),
                          DropdownButton<Account>(
                              value: _destaccount,
                              onChanged: (Account? newValue) {
                                setState(() {
                                  _destaccount = newValue;
                                });
                              },
                              items: widget.member!.Dest_accounts!
                                  .map<DropdownMenuItem<Account>>(
                                      (Account value) {
                                return DropdownMenuItem<Account>(
                                  value: value,
                                  child: Text('${value.Product_Name}'),
                                );
                              }).toList())
                        ],
                      ),
                    ),
                    Text(
                        'Balance: ${utilities.formatcurrency.format(_destaccount?.Balance ?? 0)}'),
                    Card(
                      elevation: 20,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Amount to Transfer'),
                        onFieldSubmitted: (value) => Amount = value as double?,
                      ),
                    ),
                    MaterialButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        trans(context, _sourceacc!, _destaccount!, Amount!);
                        if (!mounted) return;
                        MotionToast.info(
                          description: Text("Coming soon"),
                          title: Text("Working on it"),
                        ).show(context);
                      },
                      child: const Text(
                        'Transfer Funds',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              );
            }),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Loan_Type? lsource;
  Container Applyloan(Member? m) {
    return Container(
      decoration: widgets().backgroundimage(context),
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 20,
        child: Column(
          children: [
            Spacer(),
            StatefulBuilder(builder: (context, setState) {
              return Container(
                child: Column(
                  children: [
                    Card(
                      elevation: 20,
                      child: Row(
                        children: [
                          Text("Loan Type"),
                          Spacer(),
                          DropdownButton<Loan_Type>(
                              value: lsource,
                              onChanged: (Loan_Type? newValue) {
                                setState(() {
                                  lsource = newValue;
                                });
                              },
                              items: widget.member!.LoanTypes!
                                  .map<DropdownMenuItem<Loan_Type>>(
                                      (Loan_Type value) {
                                return DropdownMenuItem<Loan_Type>(
                                  value: value,
                                  child: Text('${value.Description}'),
                                );
                              }).toList())
                        ],
                      ),
                    ),
                    Text(
                        'Eligible Amount: ${utilities.formatcurrency.format(lsource?.Eligible_Amount ?? 0)}'),
                    Card(
                      elevation: 20,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Amount to Borrow'),
                        onFieldSubmitted: (value) => Amount = value as double?,
                      ),
                    ),
                    MaterialButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        trans(context, _sourceacc!, _destaccount!, Amount!);
                        if (!mounted) return;
                        MotionToast.info(
                          description: Text("Coming soon"),
                          title: Text("Working on it"),
                        ).show(context);
                      },
                      child: const Text(
                        'Apply Loan',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              );
            }),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class ministatement extends StatelessWidget {
  const ministatement({
    super.key,
    required this.context,
    required this.m,
  });

  final BuildContext context;
  final Member? m;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Obx(
        () => Column(
          children: [
            Get.find<MemberController>().currentstatement.length > 0
                ? StatefulBuilder(builder: (context, setState) {
                    return SfDataGridTheme(
                      data: SfDataGridThemeData(
                          headerColor: const Color.fromRGBO(164, 92, 113, 0.5)),
                      child: SfDataGrid(
                        source: entriesDataSource(
                            Entries: Get.find<MemberController>()
                                .currentstatement
                                .value),
                        columnWidthMode: ColumnWidthMode.fill,
                        columns: [
                          GridColumn(
                              columnName: "Posting_Date",
                              label: Container(
                                  alignment: Alignment.center,
                                  child: Text("Date"))),
                          GridColumn(
                              columnName: "Desc",
                              label: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text("Desc"))),
                          GridColumn(
                              columnName: "Amount",
                              label: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text("amount")))
                        ],
                      ),
                    );
                  })
                : Text('No data'),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class balances extends StatelessWidget {
  const balances({
    super.key,
    //required this.context,
    required this.m,
  });

  //final BuildContext context;
  final Member? m;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          StatefulBuilder(builder: (context, setState) {
            return SfDataGridTheme(
              data: SfDataGridThemeData(
                  headerColor: const Color.fromRGBO(164, 92, 113, 0.5)),
              child: SfDataGrid(
                source: accountsDataSource(Entries: m?.Accounts ?? []),
                columnWidthMode: ColumnWidthMode.fill,
                columns: [
                  GridColumn(
                      columnName: "Acc",
                      label: Container(
                          alignment: Alignment.center, child: Text("Acc"))),
                  GridColumn(
                      columnName: "Name",
                      label: Container(
                          alignment: Alignment.centerRight,
                          child: Text("Name"))),
                  GridColumn(
                      columnName: "Balance",
                      label: Container(
                          alignment: Alignment.centerRight,
                          child: Text("Balance")))
                ],
              ),
            );
          }),
          Spacer(),
        ],
      ),
    );
  }
}
