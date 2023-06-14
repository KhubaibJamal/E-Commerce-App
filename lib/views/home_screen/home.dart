import 'package:emart/consts/consts.dart';
import 'package:emart/controller/home_controller.dart';
import 'package:emart/views/account_screen/account_screen.dart';
import 'package:emart/views/cart_screen/cart_screen.dart';
import 'package:emart/views/categories_screen/categories_screen.dart';
import 'package:emart/views/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // get controller
    var controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: account),
    ];

    var screen = [
      const HomeScreen(),
      const CategoriesScreen(),
      const CartScreen(),
      const AccountScreen(),
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(() {
            return Expanded(
              child: screen.elementAt(controller.currentNavBarIndex.value),
            );
          })
        ],
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.currentNavBarIndex.value,
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          items: navbarItem,
          onTap: (value) {
            controller.currentNavBarIndex.value = value;
          },
        );
      }),
    );
  }
}
