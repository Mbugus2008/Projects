import 'package:flutter/material.dart';
import 'package:s_mobile/common/utilities.dart';
import 'package:s_mobile/members/accounts.dart';

import '../common/menu.dart';
import '../common/widgets.dart';
import '../members/member.dart';

class accounts extends StatefulWidget {
  const accounts({
    Key? key,
    required this.member,
  }) : super(key: key);

  final Member? member;

  @override
  State<accounts> createState() => _accountsState();
}

class _accountsState extends State<accounts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widgets().backgroundimage(context),
      child: Column(
        children: [
//Menu
          ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: 20,
                  maxHeight: MediaQuery.of(context).size.height / 3),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.member?.Accounts == null
                        ? 0
                        : widget.member?.Accounts?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildItem(context, index,
                          widget.member?.Accounts as List<Account>);
                    }),
              )),
          Spacer(),
          Spacer()
        ],
      ),
    );
  }

  buildItem(BuildContext context, int index, List<Account> acc) {
    // var d = acc[index].Product_Category,
    return Row(
      children: [
        Card(
          elevation: 2,
          color: Color.fromRGBO(164, 92, 113, 0.5),
          child: SizedBox(
              width: MediaQuery.of(context).size.width - 17,
              height: 40,
              child: Row(
                children: [
                  Text(
                    '${acc[index].No}',
                   // style: TextStyle(fontSize: 10),
                  ),
                  Spacer(),
                  Text(
                    '${acc[index].Name.toString()}',
                    style: TextStyle(fontSize: 10),
                  ),
                  Spacer(),
                  Text(
                    utilities.formatcurrency.format(acc[index].Balance),
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  )
                ],
              )),
        )
      ],
    );
  }
}
