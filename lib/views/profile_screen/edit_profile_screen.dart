import 'dart:io';

import 'package:emart/consts/consts.dart';
import 'package:emart/controller/profile_controller.dart';
import 'package:emart/widgets/bg_widget.dart';
import 'package:emart/widgets/custom_button.dart';
import 'package:emart/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var profileController = Get.find<ProfileController>();
    double width = MediaQuery.of(context).size.width;
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: whiteColor,
            ),
          ),
        ),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              profileController.imagePath.isEmpty
                  ? Image.asset(
                      imgProfileIcon,
                      width: 90,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : Image.file(
                      File(profileController.imagePath.value),
                      width: 90,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              customButton(
                title: "Change",
                onPress: () async {
                  profileController.getImage(context);
                },
                color: redColor,
                txtColor: whiteColor,
                width: 100,
              ),
              10.heightBox,
              const Divider(),
              20.heightBox,
              InputTextField(
                title: 'Name',
                hintText: nameHint,
                controller: nameController,
              ),
              InputTextField(
                title: 'Password',
                hintText: passwordHint,
                controller: passwordController,
              ),
              20.heightBox,
              SizedBox(
                width: width - 60,
                child: customButton(
                  title: "save",
                  onPress: () {},
                  color: redColor,
                  txtColor: whiteColor,
                  width: 50,
                ),
              ),
            ],
          )
              .box
              .white
              .shadowSm
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
              .rounded
              .make(),
        ),
      ),
    );
  }
}
