import 'package:first_getx_api_project/logic/controllers/setting_controller.dart';
import 'package:first_getx_api_project/utils/my_string.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LanguageWidget extends StatelessWidget {
   LanguageWidget({Key? key}) : super(key: key);

   final controller= Get.find<SettingController>();
int index=0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        builder:(_)=>  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: Row(

            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: minpink
                ),
                child: Icon(
                  Icons.language,
                  color: minWhite,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextUtils(
                  text: '  Language'.tr,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  colorText: Get.isDarkMode?minWhite:minblack
              )
            ],
          ),
        ),

        Container(
          width: 120,
          padding: EdgeInsets.symmetric(horizontal: 6,vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color:Get.isDarkMode? minWhite: minblack,
              width: 2,
            ),
          ),
          child:DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              iconSize: 25,
              icon: Icon(Icons.arrow_drop_down, color:Get.isDarkMode? minWhite: minblack,),
              items: [
                DropdownMenuItem(
                  child: Text(
                    english,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,

                    ),
                  ),
                  value: ene,
                ),
                DropdownMenuItem(
                  child: Text(
                    arabic,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  value: ara,
                ),
                DropdownMenuItem(
                  child: Text(
                    france,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  value: frf,
                ),
              ],
              value: controller.langLocala,
              onChanged: (value) {
                print('value1 is $value');
            //  controller.changeLanguage(value!);
              controller.saveLanguage(value!);
              Get.updateLocale(Locale(value));
              print(value);
print("========================");
              },
            ),
          ),
        ),
      ],
    )
    );
  }
}
