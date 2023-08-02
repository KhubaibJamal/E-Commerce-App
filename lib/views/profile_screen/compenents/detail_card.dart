import 'package:emart/consts/consts.dart';
import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final String count;
  final String title;
  const DetailCard({
    super.key,
    required this.count,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      height: 80,
      width: MediaQuery.sizeOf(context).width / 3.5,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          count.text.fontFamily(bold).size(16).color(darkFontGrey).make(),
          5.heightBox,
          title.text.fontFamily(semibold).color(darkFontGrey).make()
        ],
      ),
    );
  }
}
