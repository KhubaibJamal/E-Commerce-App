import 'package:flutter/material.dart';

import '../consts/consts.dart';

Widget swiperWidget({required List list}) {
  return VxSwiper.builder(
    aspectRatio: 16 / 9,
    autoPlay: true,
    enlargeCenterPage: true,
    height: 150,
    itemCount: list.length,
    itemBuilder: (context, index) {
      return Image.asset(
        list[index],
        fit: BoxFit.fill,
      )
          .box
          .rounded
          .clip(Clip.antiAlias)
          .margin(const EdgeInsets.symmetric(horizontal: 12))
          .make();
    },
  );
}
