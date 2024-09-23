import 'package:first_getx_api_project/logic/controllers/auth_controller.dart';
import 'package:first_getx_api_project/routes/routes.dart';
import 'package:first_getx_api_project/utils/my_string.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/screens/auth/auth_text_form_field.dart';
import 'package:first_getx_api_project/view/screens/auth/checkWidget.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {

  final formKey=GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginController logincontroller=Get.find();
  AuthController controller=Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode? minblack:minWhite,
        ),
     //   backgroundColor: Get.isDarkMode? Colors.white :Colors.black,
        body:  SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                // SizedBox(
                //   height: 60,
                // ),
                Row(
                  children: [
                    Text(
                      'SIGN '.tr,
                      style: TextStyle(
                          color:Get.isDarkMode? minpink: minColor,
                          fontSize: 30
                      ),
                    ),
                    Text(
                      'IN '.tr,
                      style: TextStyle(
                          color:Get.isDarkMode? minpink:minblack ,
                          fontSize: 27),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),

                /*  Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width*0.90,
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(8),
                  ),
                  child: TextFormField(
                   // onChanged: (){},
                  //  decoration: ,
                    keyboardType: TextInputType.text,
                  ),
                ),*/


                SizedBox(
                  width: MediaQuery.of(context).size.width*0.90,
                  child: AuthTextFormField(
                    controller: emailController,
                    obscureText: false,
                    validator: (value) {
                      logincontroller.email=value;
                      if( !RegExp(validationEmail).hasMatch(value)){
                        return " Invalid email".tr;
                      }
                      else{

                        return null;
                      }
                    },

                    prefixIcon:Get.isDarkMode? Icon(Icons.email,color:minpink,size: 30,): Icon(Icons.email,color:minColor,size: 30,)
                       ,
                    hintText:'  Email'.tr,
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                    width: MediaQuery.of(context).size.width*0.90,
                    child:

                    GetBuilder<AuthController>(
                      builder: (_){
                        return  AuthTextFormField(
                          controller: passwordController,
                          obscureText: controller.isvisibilty?false:true,

                          validator: (value) {
                            logincontroller.password=value;
                            if(value.toString().length < 6){
                              return "password should be longer or equal to 6 characters".tr;
                            }
                            else {

                              return null;
                            }
                          },
                          prefixIcon:Get.isDarkMode? Icon(Icons.lock,color:minpink,size: 30,):Icon(Icons.lock,color:minColor,size: 30,)
                              ,
                          hintText:'  Password'.tr,
                          sufffixIcon:IconButton(
                            onPressed: (){
                              controller.visibilty();
                            },
                            icon: controller.isvisibilty? Icon(
                              Icons.visibility_off,
                              color: Get.isDarkMode? minpink:minColor,
                            ) : Icon(Icons.visibility,color: minblack,),
                          ) ,
                        );

                      },
                    )
                ),
                SizedBox(height: 20,),

                GetBuilder<AuthController>(builder: (_){
                  return
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child:Text(
                          'Forgot Password? '.tr,
                          style: TextStyle(
                              color: Get.isDarkMode?minWhite: minblack
                                  ,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline
                          ),

                        ),
                        onPressed: (){
                           Get.toNamed('/forgotPasswordScreen');
                        },
                      ),
                    );

                }),
                SizedBox(height: 50,),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:Get.isDarkMode? minpink:minColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal:170,
                      vertical: 20,
                    ),
                  ),
                  onPressed: () {
                    if(formKey.currentState?.validate()==true){
                      onClickedLogin();
                    }
                    else{
                      print(' Sorry Login errrorrrrrr');
                    }

                   // Get.toNamed('/welcomeScreen');
                  },
                  child: TextUtils(
                    text: 'LOG IN'.tr,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    colorText:minWhite,
                  ),
                ),
                SizedBox(height:20 ,),

                TextUtils(
                  text: 'OR'.tr,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  colorText: minWhite,
                ),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor:minWhite,
                        maxRadius: 40,
                        child: Image.asset('assets/images/facebook.png',width: 50,)
                    ),
                    SizedBox(width: 14,),
                    CircleAvatar(
                      backgroundColor:minWhite,
                        maxRadius: 40,
                        child: Image.asset('assets/images/google.png',width: 65,),
                    ),
                  ],
                ),
                SizedBox(height:65 ,),


                Container(
                  width: double.infinity,
                  height:105,
                  decoration: BoxDecoration(
                    color:Get.isDarkMode? minpink: minColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          colorText: minWhite,
                          text: 'Don`t have an Account?'.tr,
                          underLine: TextDecoration.none),
                      TextButton(
                        onPressed:(){Get.toNamed('/signUpScreen');},
                        child: TextUtils(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            colorText: minWhite,
                            text:'Sign Up'.tr,
                            underLine: TextDecoration.none),
                      )
                    ],
                  ),
                ),
                // ElevatedButton(onPressed: (){
                //   Get.toNamed('/signUpScreen');
                // }, child: Text('hhhh')),
                // ContainerUnder(text: 'Don`t have an Account?',text2: 'Sign Up',onPressed: (){
                //  Get.toNamed('/signUpScreen');//oNamed(Routes.signUpScreen);
                // }),

              ],
            ),
          ),

        ),
      ),
    );
  }
  void onClickedLogin() async{
    EasyLoading.show(status: 'Loding');
    await logincontroller.loginOnClicked();
    if(logincontroller.loginStatus){
      EasyLoading.showSuccess('success'.tr);
      Get.toNamed('/mainScreen');//offAllNamed('/home');
    }
    else{
      EasyLoading.showError(logincontroller.message,duration: Duration(seconds: 5),dismissOnTap: true);
      print('erroooooooooooor here');
    }

  }
}
