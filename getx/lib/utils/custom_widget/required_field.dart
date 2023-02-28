import 'package:flutter/material.dart';
Widget RequiredFormTitle(String title, {double fontSize = 15.0, FontWeight fontWeight = FontWeight.w500}) {
  return Text.rich(TextSpan(
      text: '$title',
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors.black),
      children: <InlineSpan>[
        TextSpan(text: '*', style: TextStyle(color: Colors.red, fontSize: 17.0))
      ]));
}
