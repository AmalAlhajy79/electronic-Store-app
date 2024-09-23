import 'package:first_getx_api_project/utils/my_string.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/screens/auth/auth_text_form_field.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {

  final formkey=GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor:Get.isDarkMode? minblack:minColor,
        title: Text('Forgot Password'.tr,style: TextStyle(color:Get.isDarkMode? minpink:minWhite),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Get.isDarkMode?minWhite:minblack,),
          onPressed: (){
              Get.back();
            }
        ),
      ),
      backgroundColor: context.theme.backgroundColor,//Colors.black87,
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: (){
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close_rounded,
                  color:Get.isDarkMode
                    ?minWhite:minColor,
                  )),
                ),
                SizedBox(height: 20,),

                Text('If you want to recover your account , then please provide your email Id bellow..'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:
                    Get.isDarkMode?minWhite:minblack,
                ),
                ),
                SizedBox(
                  height: 50,
                ),
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: 300,
                  child: Image.asset('assets/images/forgetpassword.png',fit: BoxFit.fill,),
                  ),
                  Container(
                    height: 250,
                    width: 300,
              // color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),

                SizedBox(
                  height: 80,
                ),
                AuthTextFormField(
                  controller: emailController,
                  obscureText: false,
                  validator: (value) {
                    if( !RegExp(validationEmail).hasMatch(value)){
                      return " Invalid email".tr;
                    }
                    else{
                      return null;
                    }
                  },
                  prefixIcon:Get.isDarkMode? Icon(Icons.email,color:minpink,size: 30,)
                      : Icon(Icons.email,color:minColor,size: 30,),
                  hintText:'  Email'.tr,
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:Get.isDarkMode? minpink:minColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal:160,
                      vertical: 18,
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed('/loginScreen');
                  },
                  child: TextUtils(
                    text: 'SEND'.tr,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    colorText: minWhite,

                  ),
                ),
          //
          //       ElevatedButton(
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all<Color>(Get.isDarkMode?Colors.green:Colors.pink),
          //   ),
          //   onPressed: (){
          //
          //            },
          //     child:Text(
          //       'Send',
          //       style: TextStyle(color:Colors.white,fontSize: 20),
          //     ),
          // ),

              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}
