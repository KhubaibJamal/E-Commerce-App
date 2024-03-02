import 'package:emart/consts/consts.dart';
import 'package:flutter/material.dart';

Widget customButton(
    {required String title,
    required VoidCallback onPress,
    required Color color,
    required Color txtColor,
    required double width}) {
  return InkWell(
    onTap: onPress,
    child: Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: title.text.color(txtColor).fontFamily(bold).make(),
      ),
    ),
  );
}
