import 'package:emart/consts/consts.dart';
import 'package:emart/controller/auth_controller.dart';
import 'package:emart/views/home_screen/home.dart';
import 'package:emart/widgets/applogo_widget.dart';
import 'package:emart/widgets/bg_widget.dart';
import 'package:emart/widgets/custom_button.dart';
import 'package:emart/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isCheck = false;
  var authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  signUpUser() async {
    if (passwordController.text == confirmPasswordController.text) {
      if (isCheck == true) {
        await authController
            .singUp(emailController.text, passwordController.text, context)
            .then((value) {
          authController.storeUserData(emailController.text,
              passwordController.text, nameController.text);
        }).then((value) {
          VxToast.show(context,
              msg: "Sign up successfully",
              bgColor: Colors.green,
              textColor: whiteColor);
          Get.offAll(const Home());
        });
      }
    } else {
      VxToast.show(context,
          msg: "Password doesn't match",
          bgColor: redColor,
          textColor: whiteColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return bgWidget(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                appLogoWidget(),
                5.heightBox,
                "$login to $appName".text.white.make(),
                10.heightBox,
                Column(
                  children: [
                    InputTextField(
                      title: name,
                      hintText: nameHint,
                      controller: nameController,
                    ),
                    InputTextField(
                      title: email,
                      hintText: emailHint,
                      controller: emailController,
                    ),
                    InputTextField(
                        title: password,
                        hintText: passwordHint,
                        controller: passwordController),
                    InputTextField(
                        title: confirmPassword,
                        hintText: passwordHint,
                        controller: confirmPasswordController),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: forgetPassword.text.make(),
                      ),
                    ),
                    5.heightBox,
                    Row(
                      children: [
                        Checkbox(
                          activeColor: redColor,
                          checkColor: whiteColor,
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue!;
                            });
                          },
                        ),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: fontGrey,
                                  ),
                                ),
                                TextSpan(
                                  text: "$termAndCondition & $privacyPolicy",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: redColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    5.heightBox,
                    customButton(
                        title: signUp,
                        onPress: () {
                          signUpUser();
                        },
                        color: isCheck == true ? redColor : lightGrey,
                        txtColor: whiteColor,
                        width: width - 50),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "$alreadyHaveAnAccount? "
                            .text
                            .color(fontGrey)
                            .fontFamily(regular)
                            .make(),
                        login.text
                            .color(redColor)
                            .fontFamily(regular)
                            .make()
                            .onTap(() {
                          Get.back();
                        }),
                      ],
                    ),
                  ],
                )
                    .box
                    .white
                    .padding(const EdgeInsets.all(16))
                    .width(context.screenWidth - 70)
                    .shadowSm
                    .rounded
                    .make(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
