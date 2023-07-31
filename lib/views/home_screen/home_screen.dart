import 'package:emart/consts/consts.dart';
import 'package:emart/consts/list.dart';
import 'package:emart/views/home_screen/components/featured_card.dart';
import 'package:emart/views/home_screen/components/home_container.dart';
import 'package:emart/views/home_screen/components/swiper_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: context.screenHeight,
      width: context.screenWidth,
      color: lightGrey,
      child: SafeArea(
        child: Column(
          children: [
            // input text field
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: searchAnything,
                  hintStyle: TextStyle(
                    color: textfieldGrey,
                  ),
                  suffixIcon: Icon(Icons.search, size: 26),
                  filled: true,
                  fillColor: whiteColor,
                  border: InputBorder.none,
                ),
              ),
            ),
            10.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // slider function
                    swiperWidget(list: sliderList),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        2,
                        (index) {
                          return homeContainer(
                            height: context.screenHeight * 0.15,
                            width: context.screenWidth / 2.5,
                            icon: index == 0 ? icTodaysDeal : icFlashDeal,
                            title: index == 0 ? todayDeal : flashSales,
                          );
                        },
                      ),
                    ),
                    10.heightBox,
                    swiperWidget(list: sliderList2),
                    10.heightBox,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        3,
                        (index) {
                          return homeContainer(
                            height: context.screenHeight * 0.15,
                            width: context.screenWidth / 3.5,
                            icon: index == 0
                                ? icTopCategories
                                : index == 1
                                    ? icBrands
                                    : icTopSeller,
                            title: index == 0
                                ? topCategories
                                : index == 1
                                    ? brands
                                    : topSellers,
                          );
                        },
                      ),
                    ),
                    20.heightBox,
                    // featured Text
                    Align(
                        alignment: Alignment.centerLeft,
                        child: featuredCategories.text
                            .color(darkFontGrey)
                            .fontFamily(semibold)
                            .size(18)
                            .make()),

                    15.heightBox,
                    // featured card
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          3,
                          (index) {
                            return Column(
                              children: [
                                featuredWidget(
                                    img: featuredCategoryImage1[index],
                                    title: featuredCategoryTitle1[index]),
                                10.heightBox,
                                featuredWidget(
                                    img: featuredCategoryImage2[index],
                                    title: featuredCategoryTitle2[index]),
                              ],
                            );
                          },
                        ),
                      ),
                    ),

                    20.heightBox,
                    // feature product
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(color: redColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featureProduct.text
                              .fontFamily(bold)
                              .white
                              .size(18)
                              .make(),
                          10.heightBox,
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
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4))
                                    .make(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    20.heightBox,
                    // slider 3
                    swiperWidget(list: sliderList),

                    20.heightBox,
                    // all product
                    "All products".text.fontFamily(bold).white.size(18).make(),
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          mainAxisExtent: 300,
                        ),
                        itemBuilder: ((context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                imgP6,
                                width: 200,
                                height: 200,
                                fit: BoxFit.fill,
                              ),
                              const Spacer(),
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
                              .make();
                        })),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
