import 'package:first_getx_api_project/logic/controllers/auth_controller.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {

  AuthController controller=Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
controller.checkBox();
      },
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color:Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),

        ),
        child:controller.isCheckBox?Get.isDarkMode? Icon(Icons.check,color: minpink,size: 30,):Icon(Icons.check,color: minColor,size: 30,)

            :Container(

          decoration: BoxDecoration(
            color: minWhite,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // Get.isDarkMode? Image.asset('assets/images/check.png',width: 1,)
        //                     :Icon(Icons.check,color: Colors.pink,size: 30,),
      ),
    );
  }
}
