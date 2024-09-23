import 'package:first_getx_api_project/logic/controllers/auth_controller.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({Key? key}) : super(key: key);

  final controller =Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_)=>Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor:Get.isDarkMode?minpink.withOpacity(0.8): minColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
        customBorder: StadiumBorder(),
        onTap: (){
          Get.defaultDialog(
            title: 'Logout From App',
            titleStyle: TextStyle(
                fontSize:10,
                color:minblack,
                fontWeight: FontWeight.bold
            ),
            middleText: 'Are you sure you need to logout ?',
            middleTextStyle: TextStyle(
                fontSize:10,
                color:minblack,
                fontWeight: FontWeight.bold
            ),
            backgroundColor: mingrey,
            radius: 10,
            textCancel: 'No',
            cancelTextColor: minWhite,
            textConfirm: 'Yes',
            confirmTextColor:minWhite,
            onCancel: (){
              Get.back();
            },
            onConfirm: (){
              controller.signOutFromApp();

            },
            buttonColor: Get.isDarkMode?minpink:minColor,
          );

          //controller.signOutFromApp();
        },
        child: Row(

          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: minblue.withOpacity(0.5),
              ),
              child: Icon(
                Icons.logout,
                color: minWhite,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextUtils(
                text: '  Logout'.tr,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                colorText: Get.isDarkMode?minWhite:minblack
            )
          ],
        ),
      ),
    ),
    );
  }
}
