import 'package:emart/views/categories_screen/item_details.dart';
import 'package:emart/widgets/bg_widget.dart';
import 'package:flutter/material.dart';

import 'package:emart/consts/consts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoriesDetails extends StatelessWidget {
  final String? title;
  const CategoriesDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // actions: [Icon(Icons.search)],
          title: title!.text.fontFamily(bold).make(),
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
                        .size(100, 60)
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .make()),
              ),
            ),

            //
            20.heightBox,
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 8,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 250,
                ),
                itemBuilder: ((context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        imgP3,
                        width: 200,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                      "HP laptop"
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make(),
                      10.heightBox,
                      "\$3000"
                          .text
                          .fontFamily(semibold)
                          .color(redColor)
                          .size(16)
                          .make()
                    ],
                  )
                      .box
                      .white
                      .rounded
                      .padding(const EdgeInsets.all(12))
                      .margin(const EdgeInsets.symmetric(horizontal: 4))
                      .make()
                      .onTap(() {
                    Get.to(ItemDetails(title: "hp laptop"));
                  });
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
