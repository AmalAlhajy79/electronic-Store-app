import 'package:first_getx_api_project/logic/controllers/setting_controller.dart';
import 'package:first_getx_api_project/logic/controllers/theme_controller.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DarkModeWidget extends StatelessWidget {
 DarkModeWidget({Key? key}) : super(key: key);

 final controller=Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIconWidget(),
        Switch(
            activeTrackColor: Get.isDarkMode?minpink: minColor,
            activeColor:Get.isDarkMode?minpink: minColor,
            value:controller.swichValue.value,
            onChanged: (value){
              ThemeController().changeTheme();
              controller.swichValue.value = value;
            }
        ),
      ],
    ),
    );
  }
  Widget buildIconWidget(){
    return Material(
      color: Colors.transparent,
      child: Row(

        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: mindarkSetting
            ),
            child: Icon(
              Icons.dark_mode,
              color: minWhite,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextUtils(
              text: '  Dark Mode'.tr,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              colorText: Get.isDarkMode?minWhite:minblack
          )
        ],
      ),
    );
  }
}
