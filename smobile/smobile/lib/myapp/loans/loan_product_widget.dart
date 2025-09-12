import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Loan_Products.dart';
class Loan_product_tilewidget extends StatelessWidget {
  final Loan_Products product;
  final bool isNative;
  final bool isSelected;
  final ValueChanged<Loan_Products> onSelectedproduct;

  const Loan_product_tilewidget({
    Key key,
    @required this.product,
    @required this.isNative,
    @required this.isSelected,
    @required this.onSelectedproduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).primaryColor;
    final style = isSelected
        ? TextStyle(
            fontSize: 18,
            color: selectedColor,
            fontWeight: FontWeight.bold,
          )
        : TextStyle(fontSize: 18);

    return ListTile(
      onTap: () => onSelectedproduct(product),
      leading: FlagWidget(code: product.code),
      title: Text(
        isNative ? product.nativeName : product.name,
        style: style,
      ),
      trailing:
          isSelected ? Icon(Icons.check, color: selectedColor, size: 26) : null,
    );
  }
}