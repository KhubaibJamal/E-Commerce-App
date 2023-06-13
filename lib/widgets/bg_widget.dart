import 'package:flutter/material.dart';

import '../consts/consts.dart';

Widget bgWidget({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage(imgBackground)),
    ),
    child: child,
  );
}
