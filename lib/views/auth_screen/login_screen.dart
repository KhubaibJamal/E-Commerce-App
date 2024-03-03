import 'package:emart/consts/consts.dart';
import 'package:emart/consts/list.dart';
import 'package:emart/controller/auth_controller.dart';
import 'package:emart/views/auth_screen/sign_up_screen.dart';
import 'package:emart/views/home_screen/home.dart';
import 'package:emart/widgets/bg_widget.dart';
import 'package:emart/widgets/custom_button.dart';
import 'package:emart/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/applogo_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var authController = Get.put(AuthController());
  bool showPassword = false;
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
                Obx(
                  () => Column(
                    children: [
                      InputTextField(
                        title: email,
                        readOnly: false,
                        hintText: emailHint,
                        controller: emailController,
                      ),
                      InputTextField(
                        readOnly: false,
                        obscureText: showPassword,
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: Icon(
                            showPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        title: password,
                        hintText: passwordHint,
                        controller: passwordController,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {},
                          child: forgetPassword.text.make(),
                        ),
                      ),
                      5.heightBox,
                      authController.isLoading.value
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(redColor),
                            )
                          : customButton(
                              title: login,
                              onPress: () {
                                authController.isLoading(true);
                                authController
                                    .login(emailController.text,
                                        passwordController.text, context)
                                    .then((value) {
                                  if (value != null) {
                                    VxToast.show(context,
                                        msg: "Sign up successfully",
                                        bgColor: Colors.green,
                                        textColor: whiteColor);
                                    Get.offAll(const Home());
                                  } else {
                                    authController.isLoading(false);
                                  }
                                });
                              },
                              color: redColor,
                              txtColor: whiteColor,
                              width: width - 50,
                            ),
                      10.heightBox,
                      alreadyHaveAnAccount.text.color(fontGrey).make(),
                      10.heightBox,
                      customButton(
                          title: signUp,
                          onPress: () {
                            Get.to(() => const SignUpScreen());
                          },
                          color: lightGolden,
                          txtColor: redColor,
                          width: width - 50),
                      10.heightBox,
                      loginWith.text.color(fontGrey).make(),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return CircleAvatar(
                            backgroundColor: lightGrey,
                            radius: 25,
                            child: Image.asset(
                              socialIconList[index],
                              width: 30,
                            ),
                          );
                        }),
                      )
                    ],
                  ),
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
