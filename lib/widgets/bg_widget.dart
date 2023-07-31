import 'package:flutter/material.dart';

import '../consts/consts.dart';

Widget bgWidget({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
      // color: Colors.amber,
      image: DecorationImage(
        image: AssetImage(imgBackground),
        fit: BoxFit.fitWidth,
      ),
    ),
    child: child,
  );
}
