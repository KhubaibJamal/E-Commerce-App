import 'package:emart/consts/consts.dart';
import 'package:emart/consts/list.dart';
import 'package:emart/controller/auth_controller.dart';
import 'package:emart/views/auth_screen/login_screen.dart';
import 'package:emart/views/profile_screen/compenents/detail_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              // edit profile icon
              Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.edit_sharp,
                        color: whiteColor,
                      ),
                    ),

                    // picture name and email
                    Row(
                      children: [
                        // account picture
                        Image.asset(
                          imgProfile2,
                          width: 90,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),

                        // name and email
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "name"
                                  .text
                                  .fontFamily(semibold)
                                  .size(20)
                                  .white
                                  .make(),
                              5.heightBox,
                              "email@gmail.com".text.white.make(),
                            ],
                          ),
                        ),

                        // logout button
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: whiteColor),
                            ),
                            onPressed: () async {
                              Get.put(AuthController().userLogOut(context));
                              Get.offAll(LoginScreen());
                            },
                            child:
                                "Logout".text.white.fontFamily(semibold).make())
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                // width: MediaQuery.sizeOf(context).width,
                color: redColor,
                child: Column(
                  children: [
                    20.heightBox,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DetailCard(count: "00", title: "Cart"),
                        DetailCard(count: "50", title: "wishlist"),
                        DetailCard(count: "100", title: "Your Order"),
                      ],
                    ),

                    // wishlist, order, message
                    20.heightBox,

                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: profileScreenList.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          title: profileScreenList[index]
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .size(18)
                              .make(),
                          leading: Image.asset(
                            pragmaScreenIconList[index],
                            width: 22,
                          ),
                        );
                      }),
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: darkFontGrey,
                        );
                      },
                    )
                        .box
                        .white
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .margin(const EdgeInsets.all(12))
                        .rounded
                        .shadowSm
                        .make()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
