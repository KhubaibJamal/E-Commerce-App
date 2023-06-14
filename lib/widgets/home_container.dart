import 'package:emart/consts/consts.dart';
import 'package:flutter/material.dart';

Widget homeContainer(
    {required double height,
    required double width,
    required String icon,
    required String title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 28,
      ),
      10.heightBox,
      title.text.color(darkFontGrey).fontFamily(semibold).make(),
    ],
  ).box.rounded.white.size(width, height).make();
}
