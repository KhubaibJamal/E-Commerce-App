import 'package:emart/consts/list.dart';
import 'package:emart/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:emart/consts/consts.dart';

import 'components/detail_item_container.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: darkFontGrey, size: 28),
        // centerTitle: true,
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // swiper
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 350,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),

                    // item title
                    10.heightBox,
                    "title"
                        .text
                        .fontFamily(semibold)
                        .size(22)
                        .color(darkFontGrey)
                        .make(),

                    // rating
                    10.heightBox,
                    VxRating(
                      onRatingUpdate: (value) {},
                      count: 5,
                      selectionColor: golden,
                      normalColor: textfieldGrey,
                      stepInt: true,
                      size: 25,
                    ),

                    // price
                    10.heightBox,
                    "\$3000"
                        .text
                        .fontFamily(bold)
                        .size(22)
                        .color(redColor)
                        .make(),

                    // seller contact
                    10.heightBox,
                    Container(
                      padding: const EdgeInsets.all(12),
                      height: 70,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: textfieldGrey,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "seller"
                                    .text
                                    .fontFamily(semibold)
                                    .color(whiteColor)
                                    .make(),
                                5.heightBox,
                                "In house brands"
                                    .text
                                    .fontFamily(semibold)
                                    .size(16)
                                    .color(darkFontGrey)
                                    .make(),
                              ],
                            ),
                          ),
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.message_rounded,
                              color: darkFontGrey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // color, quantity section, price
                    10.heightBox,
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 197, 197, 197),
                              blurRadius: 5),
                        ],
                      ),
                      child: Column(
                        children: [
                          // color
                          DetailItemContainer(
                            text: "Color: ",
                            child: Row(
                              children: List.generate(
                                3,
                                (index) => VxBox()
                                    .roundedFull
                                    .size(40, 40)
                                    .color(Vx.randomPrimaryColor)
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4))
                                    .make(),
                              ),
                            ),
                          ),

                          // quantity
                          DetailItemContainer(
                            text: "Quantity: ",
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove),
                                ),
                                "0"
                                    .text
                                    .size(22)
                                    .color(darkFontGrey)
                                    .fontFamily(semibold)
                                    .make(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                ),
                                "(0 available)"
                                    .text
                                    .color(textfieldGrey)
                                    .make(),
                              ],
                            ),
                          ),

                          // price section
                          DetailItemContainer(
                              text: "Price: ",
                              child: "\$0.000"
                                  .text
                                  .color(redColor)
                                  .size(18)
                                  .make())
                        ],
                      ),
                    ),

                    // item description
                    10.heightBox,
                    "Description"
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,
                    "Dummy Description".text.color(darkFontGrey).make(),

                    // item list
                    10.heightBox,
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        itemDetailButton.length,
                        (index) => ListTile(
                          title: itemDetailButton[index]
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          trailing: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ),

                    // product you may like
                    10.heightBox,
                    productYouMayLike.text
                        .color(darkFontGrey)
                        .fontFamily(bold)
                        .size(18.0)
                        .make(),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          5,
                          (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                imgP1,
                                width: 150,
                                fit: BoxFit.cover,
                                // height: 100,
                              ),
                              10.heightBox,
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
                              .padding(const EdgeInsets.all(8))
                              .margin(const EdgeInsets.symmetric(horizontal: 6))
                              .make(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // add to cart button
          customButton(
            title: "Add to Cart",
            onPress: () {},
            color: redColor,
            txtColor: whiteColor,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
