import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/category/category_widget.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
          padding: EdgeInsets.only(left: 15,top: 15,right: 15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: 15,top: 15),
                 child: TextUtils(
                   colorText: Get.isDarkMode? minWhite : minblack,
                   fontSize: 30,
                   fontWeight: FontWeight.bold,
                   text: 'Category'.tr,
                 ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              CategoryWidget(),
            ],
          ),
      ),
    );
  }
}