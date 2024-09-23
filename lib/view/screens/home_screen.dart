import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/home/card_items.dart';
import 'package:first_getx_api_project/view/widgets/home/search_text_form.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                  color: Get.isDarkMode ?minpink : minColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      text: 'Find Your'.tr,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      colorText: minWhite ,
                      underLine: TextDecoration.none,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextUtils(
                      text: 'INSPIRATION'.tr,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      colorText: minWhite,
                      underLine: TextDecoration.none,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SearchFormText(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                    text: 'Catigories'.tr,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    colorText:Get.isDarkMode?minWhite :minblack
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CardItem(),
          ],
        ),
      ),
    );
  }
}
