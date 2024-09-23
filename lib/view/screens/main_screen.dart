import 'package:badges/badges.dart';
import 'package:first_getx_api_project/logic/controllers/cart_controller.dart';
import 'package:first_getx_api_project/logic/controllers/main_controller.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {

  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Get.isDarkMode ?minpink:minColor ,
            leading: Container(),
            title: Text(controller.title[controller.currentIndex.value]),
            centerTitle: true,
            actions: [
         Obx(() =>
             Badge(
           position: BadgePosition.topEnd(top: 0, end: 3),
           animationDuration: Duration(milliseconds: 300),
           animationType: BadgeAnimationType.slide,
           badgeContent: Text(
            cartController.quantity().toString() ,
             style: TextStyle(color: Colors.white),
           ),
           child:      IconButton(
             onPressed: () {
               Get.toNamed('/cartScreen');
               // Get.isDarkMode? Get.changeThemeMode(ThemeMode.light)
               //               : Get.changeThemeMode(ThemeMode.dark);
             },
             icon: Icon(
               Icons.shopping_cart,
               // size: 150,
               color: minWhite,
             ),
           ),
         ),
         ),
            ],
          ),
          //backgroundColor: Get.isDarkMode ? Colors.white : Colors.black12,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode ? minpink : minWhite,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ?  minblack:minColor ,
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ?   minWhite:minblack ,
                  ),
                  label: 'Home'.tr),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? minblack:minColor ,
                  ),
                  icon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? minWhite:minblack,
                  ),
                  label: 'category'.tr),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? minblack:minColor,
                  ),
                  icon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ?  minWhite:minblack,
                  ),
                  label: 'favorite'.tr
                      ),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? minblack:minColor,
                  ),
                  icon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? minWhite:minblack,
                  ),
                  label: 'settings'.tr),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs.value,

          ),
        );
      }),
    );
  }
}








