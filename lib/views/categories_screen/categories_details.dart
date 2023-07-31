import 'package:emart/widgets/bg_widget.dart';
import 'package:flutter/material.dart';

import 'package:emart/consts/consts.dart';

class CategoriesDetails extends StatelessWidget {
  final String? title;
  const CategoriesDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          // actions: [Icon(Icons.search)],
          title: title!.text.make(),
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    6,
                    (index) => "Sport"
                        .text
                        .size(15)
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .makeCentered()
                        .box
                        .white
                        .rounded
                        .size(120, 60)
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .make()),
              ),
            ),

            //
          ],
        ),
      ),
    );
  }
}
