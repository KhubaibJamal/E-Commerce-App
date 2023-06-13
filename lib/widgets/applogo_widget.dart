import 'package:flutter/material.dart';

import '../consts/consts.dart';

Widget appLogoWidget() {
  // using velocity X
  return Image.asset(icAppLogo)
      .box
      .size(77, 77)
      .padding(const EdgeInsets.all(8))
      .white
      .rounded
      .make();
}
