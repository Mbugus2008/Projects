import 'package:flutter/material.dart';

import 'package:s_mobile/members/member.dart';

import 'common/utilities.dart';
import 'common/widgets.dart';

class Master extends StatefulWidget {
  Master({
    Key? key,
    this.member,
    required this.widgets,
    this.title
  }) : super(key: key);

  final Member? member;
  final Widget? widgets;
  final String? title;

  @override
  State<Master> createState() => _MasterPageState();
}

class _MasterPageState extends State<Master> {
  _MasterPageState();

  @override
  void initState() {
    super.initState();
  }

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widgets().backgroundimage(context),
      child: Scaffold(
        appBar:utilities(). appbar(widget.member,widget.title),
        body: Container(

            decoration: widgets().backgroundimage(context),
            child: widget.widgets),
      ),
    );
  }
}
