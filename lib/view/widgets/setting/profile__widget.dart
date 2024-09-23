import 'package:first_getx_api_project/logic/controllers/auth_controller.dart';
import 'package:first_getx_api_project/logic/controllers/register_controller.dart';
import 'package:first_getx_api_project/logic/controllers/setting_controller.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImage extends StatelessWidget {
   ProfileImage({Key? key}) : super(key: key);
   
   final controller = Get.find<SettingController>();
   final authController = Get.find<AuthController>();
   final registerController=Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
               height: 100,
              width: 100,
              decoration:  BoxDecoration(
                color: minWhite,
                shape: BoxShape.circle,
               image: DecorationImage(
                  image: NetworkImage('https://th.bing.com/th/id/R.95e45a66c918a53280e796b44add2d66?rik=tNRR5yGa5TaK3Q&pid=ImgRaw&r=0'
                      ,
                ),
                   fit: BoxFit.cover
              ),
              // child: Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child:
              //   Image.network('https://th.bing.com/th/id/R.95e45a66c918a53280e796b44add2d66?rik=tNRR5yGa5TaK3Q&pid=ImgRaw&r=0'
              //     ,fit: BoxFit.cover,
              //   ),
              ),
            ),
            SizedBox(
              width: 35,
            ),
            GetBuilder<RegisterController>(
                builder: (_){
                  return   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextUtils(
                        text: controller.capitalize(registerController.firstName.tr),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        colorText: Get.isDarkMode?minWhite :minblack,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextUtils(
                        text: registerController.email,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        colorText: Get.isDarkMode?minWhite :minblack,
                      ),
                    ],
                  );
                }

               ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     TextUtils(
            //       text: controller.capitalize(registerController.firstName.tr),
            //       fontSize: 22,
            //       fontWeight: FontWeight.bold,
            //       colorText: Get.isDarkMode?minWhite :minblack,
            //     ),
            //     SizedBox(
            //       height: 10,
            //     ),
            //     TextUtils(
            //       text: registerController.email,
            //       fontSize: 14,
            //       fontWeight: FontWeight.bold,
            //       colorText: Get.isDarkMode?minWhite :minblack,
            //     ),
            //   ],
            // )
          ],
        )
      ],
    );
  }
}
