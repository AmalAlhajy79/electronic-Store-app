
import 'package:first_getx_api_project/logic/controllers/auth_controller.dart';
import 'package:first_getx_api_project/logic/controllers/register_controller.dart';
import 'package:first_getx_api_project/utils/my_string.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/screens/auth/auth_text_form_field.dart';
import 'package:first_getx_api_project/view/screens/auth/checkWidget.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {

  final formKey=GlobalKey<FormState>();

  
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

var controller=Get.find<AuthController>();
  RegisterController registerController=Get.find();
 // Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode? minblack:minWhite ,
        ),
      //  backgroundColor: Get.isDarkMode? Colors.white :Colors.black,
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
                            color:Get.isDarkMode? minpink:minColor,
                            fontSize: 30
                        ),
                      ),
                      Text(
                        'UP '.tr,
                        style: TextStyle(
                            color:Get.isDarkMode?  minpink:minblack,
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
                    child: 
                    AuthTextFormField(
                      controller: nameController,
                      obscureText: false,
                      validator: (value) {
                        registerController.firstName=value;
                       // print('name is ---->>>>${value}');
                        registerController.lastNamme=value;
                        if(value.toString().length < 2 || !RegExp(validationName).hasMatch(value)){
                          return "Enter valid name".tr;
                        }
                        else{

                          return null;
                        }
                      },
                    prefixIcon:Get.isDarkMode?Icon(Icons.person,color: minpink,size: 30,) :Icon(Icons.person,color: minColor,size: 30,)
                                             ,
                      hintText:'  User Name'.tr,
                    ),
                 
                  ),

                  SizedBox(height: 20,),

                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.90,
                    child: AuthTextFormField(
                      controller: emailController,
                      obscureText: false,
                      validator: (value) {
                        registerController.email=value;

                        if( !RegExp(validationEmail).hasMatch(value)){
                          return " Invalid email".tr;
                        }
                        else{

                          return null;
                        }
                      },
                      prefixIcon:Get.isDarkMode?  Icon(Icons.email,color:minpink,size: 30,):Icon(Icons.email,color:minColor,size: 30,)
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
                              // print('_______________________________>>>>>');
                              // print(value);
                              registerController.password=value;
                              registerController.passwordConfirm=value;
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
                  SizedBox(height: 50,),

                 GetBuilder<AuthController>(builder: (_){
                   return  Row(
                     children: [
                       SizedBox(width: 22,),
                       CheckWidget(),
                       SizedBox(width: 10,),
                       Text(
                         'I accept '.tr,
                         style: TextStyle(
                           color: Get.isDarkMode? minWhite:minblack,
                           fontSize: 16,
                           fontWeight: FontWeight.normal,
                         ),
                       ),

                       TextButton(
                         child:Text(
                           'terms & conditions '.tr,
                           style: TextStyle(
                               color: Get.isDarkMode?minWhite:minblack
                                   ,
                               fontSize: 16,
                               fontWeight: FontWeight.normal,
                               decoration: TextDecoration.underline
                           ),

                         ),
                         onPressed: (){

                         },
                       ),
                     ],
                   );

                 }),
                  SizedBox(height: 50,),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:Get.isDarkMode?minpink:minColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal:160,
                        vertical: 19,
                      ),
                    ),
                    onPressed: () {
                      if(formKey.currentState?.validate()==true){
                        onClickedRegiste();
                      }else{
                        print(' Sorry Register errrorrrrrr');
                      }

                     // Get.toNamed('/mainScreen');
                    },
                    child: TextUtils(
                      text: 'SIGN UP'.tr,
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                      colorText: minWhite,
                    ),
                  ),


                  SizedBox(height:103 ,),


                  Container(
                    width: double.infinity,
                    height:105,
                    decoration: BoxDecoration(
                      color:Get.isDarkMode? minpink:minColor,
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
                            text: 'Already have an Account?'.tr,
                            underLine: TextDecoration.none),
                        TextButton(
                          onPressed:(){

                          Get.toNamed('/loginScreen');
                            },
                          child: TextUtils(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              colorText:minWhite,
                              text:'Log in'.tr,
                              underLine: TextDecoration.none),
                        )
                      ],
                    ),
                  ),
                  // ElevatedButton(onPressed: (){
                  //   Get.toNamed('/loginScreen');
                  // }, child: Text('hhhh')),
                  // ContainerUnder(text: 'Already have an Account?',text2: 'Log in',onPressed: (){
                  // Get.toNamed('/loginScreen');
                  // }),

                ],
              ),
            ),

        ),
      ),
    );
  }
  void onClickedRegiste() async{
    EasyLoading.show(status: 'Loading...'.tr);
    await registerController.registerOnClicked();
    if(registerController.sinUpStatus){
      EasyLoading.showSuccess(registerController.message);
      Get.toNamed('/loginScreen');
    }
    else{
      EasyLoading.showError(registerController.message,duration: Duration(seconds: 5),dismissOnTap: true);
      print('erroooooooooooor here');
    }
  }
}
