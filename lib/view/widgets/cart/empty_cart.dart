import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Icon(
             Icons.shopping_cart,
              size: 150,
           color: Get.isDarkMode?minWhite:minblack,
         ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextUtils(
                  text: 'your Cart is '.tr,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  colorText: Get.isDarkMode ?minWhite:minblack),
              TextUtils(
                  text: 'Empty'.tr,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  colorText: Get.isDarkMode ? minpink: minColor),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          TextUtils(
              text: 'Add item to get started'.tr,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              colorText: Get.isDarkMode ? minWhite:minblack),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary:Get.isDarkMode?minpink: minColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 21,
                vertical: 20,
              ),
            ),
            onPressed: () {
              Get.toNamed('/mainScreen');
            },
            child: TextUtils(
              text: 'Go to Home',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              colorText:minWhite,
            ),
          ),
        ],
      ),
    );
  }
}
