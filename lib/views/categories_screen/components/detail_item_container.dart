import 'package:emart/consts/consts.dart';
import 'package:flutter/material.dart';

class DetailItemContainer extends StatelessWidget {
  final String text;
  final Widget child;
  const DetailItemContainer({
    super.key,
    required this.text,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: text.text.color(textfieldGrey).make(),
          ),
          child,
        ],
      ),
    );
  }
}
