import 'package:first_getx_api_project/logic/controllers/auth_controller.dart';
import 'package:first_getx_api_project/logic/controllers/theme_controller.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/setting/dark_mode_widget.dart';
import 'package:first_getx_api_project/view/widgets/setting/language_widget.dart';
import 'package:first_getx_api_project/view/widgets/setting/logout_widget.dart';
import 'package:first_getx_api_project/view/widgets/setting/profile__widget.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,

      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          ProfileImage(),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode?minWhite:mingrey,
            thickness: 2,
          ),
          SizedBox(
            height: 20,
          ),
          TextUtils(
              text: 'GENERAL'.tr,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              colorText:Get.isDarkMode?minpink: minColor,
          ),
          SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          SizedBox(
            height: 20,
          ),
       LanguageWidget(),
          SizedBox(
            height: 20,
          ),
          LogOutWidget(),
        ],
      ),

    );
  }
}
