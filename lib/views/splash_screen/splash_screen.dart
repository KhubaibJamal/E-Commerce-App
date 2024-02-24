import 'package:emart/views/auth_screen/login_screen.dart';
import 'package:emart/widgets/applogo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // method to change screen after 3 seconds
  changeToScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => LoginScreen());
    });
  }

  @override
  void initState() {
    changeToScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  icSplashBg,
                  width: 300,
                ),
              ),
              20.heightBox,
              appLogoWidget(),
              20.heightBox,
              appName.text.fontFamily(bold).size(22).white.make(),
              10.heightBox,
              appVersion.text.white.make(),
              const Spacer(),
              credits.text.fontFamily(semibold).white.make(),
              10.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
