import 'package:emart/consts/consts.dart';
import 'package:emart/widgets/applogo_widget.dart';
import 'package:emart/widgets/bg_widget.dart';
import 'package:emart/widgets/custom_button.dart';
import 'package:emart/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return bgWidget(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              // forget password
              // privacy policy
              // sign up button
              // already have an account
              (context.screenHeight * 0.1).heightBox,
              appLogoWidget(),
              5.heightBox,
              "$login to $appName".text.white.make(),
              10.heightBox,
              Column(
                children: [
                  inputTextField(title: name, hint: nameHint),
                  inputTextField(title: email, hint: emailHint),
                  inputTextField(title: password, hint: passwordHint),
                  inputTextField(title: confirmPassword, hint: passwordHint),
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
                        value: false,
                        onChanged: (newValue) {},
                        checkColor: redColor,
                      ),
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "I agree to the ",
                                style: TextStyle(
                                  fontFamily: bold,
                                  color: fontGrey,
                                ),
                              ),
                              TextSpan(
                                text: "$termAndCondition & $privacyPolicy",
                                style: TextStyle(
                                  fontFamily: bold,
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
                      onPress: () {},
                      color: redColor,
                      txtColor: whiteColor,
                      width: width - 50),
                  10.heightBox,
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "$alreadyHaveAnAccount? ",
                          style: TextStyle(
                            fontFamily: bold,
                            color: fontGrey,
                          ),
                        ),
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            fontFamily: bold,
                            color: redColor,
                          ),
                        ),
                      ],
                    ),
                  ).onTap(() {
                    Get.back();
                  }),
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
    );
  }
}
