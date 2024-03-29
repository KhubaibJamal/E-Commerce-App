import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/consts/list.dart';
import 'package:emart/controller/auth_controller.dart';
import 'package:emart/controller/profile_controller.dart';
import 'package:emart/firebase_services/firebase_services.dart';
import 'package:emart/views/auth_screen/login_screen.dart';
import 'package:emart/views/profile_screen/compenents/detail_card.dart';
import 'package:emart/views/profile_screen/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var profileController = Get.put(ProfileController());
    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseService.getUser(currentUser!.uid),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              );
            } else {
              var data = snapshot.data!.docs[0];

              return SafeArea(
                child: Column(
                  children: [
                    // edit profile icon
                    Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                profileController.nameController.text =
                                    data['name'];
                                profileController.emailController.text =
                                    data['email'];
                                Get.to(() => EditProfileScreen(data: data));
                              },
                              child: const Icon(
                                Icons.edit_sharp,
                                color: whiteColor,
                              ),
                            ),
                          ),

                          // picture name and email
                          Row(
                            children: [
                              // account picture
                              // Image.asset(
                              //   imgProfileIcon,
                              //   width: 90,
                              //   fit: BoxFit.cover,
                              // ).box.roundedFull.clip(Clip.antiAlias).make(),
                              profileController.imagePath.isEmpty
                                  ? Image.asset(
                                      imgProfileIcon,
                                      width: 90,
                                      fit: BoxFit.cover,
                                    )
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make()
                                  : Image.file(
                                      File(profileController.imagePath.value),
                                      width: 90,
                                      fit: BoxFit.cover,
                                    )
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make(),

                              // name and email
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "${data['name']}"
                                        .text
                                        .fontFamily(semibold)
                                        .size(20)
                                        .white
                                        .make(),
                                    5.heightBox,
                                    "${data['email']}".text.white.make(),
                                  ],
                                ),
                              ),

                              // logout button
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: whiteColor),
                                  ),
                                  onPressed: () async {
                                    Get.put(
                                        AuthController().userLogOut(context));
                                    Get.offAll(LoginScreen());
                                  },
                                  child: "Logout"
                                      .text
                                      .white
                                      .fontFamily(semibold)
                                      .make())
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
                              .padding(
                                  const EdgeInsets.symmetric(horizontal: 16))
                              .margin(const EdgeInsets.all(12))
                              .rounded
                              .shadowSm
                              .make()
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
