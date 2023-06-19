import 'package:emart/consts/consts.dart';
import 'package:flutter/material.dart';

Widget featuredWidget({required String img, required String title}) {
  return Row(
    children: [
      Image.asset(
        img,
        width: 80,
        fit: BoxFit.cover,
      ),
      10.widthBox,
      title.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  )
      .box
      .white
      .width(200)
      .rounded
      .margin(const EdgeInsets.symmetric(horizontal: 4))
      .padding(const EdgeInsets.all(8))
      .make();
}
