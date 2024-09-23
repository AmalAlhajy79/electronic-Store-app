import 'dart:async';

import 'package:first_getx_api_project/native_service/secure_storage.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({Key? key}) : super(key: key);

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {

  SecureStorage secureStorage= new SecureStorage();
  var token;


  bool isFirstDependency=true;

  void onInit(){
    setState(()async{
      return  await   token==null?Get.toNamed('/loginScreen') : Get.toNamed('/mainScreen');

    });
  }

  @override
  void didChangeDependencies() {
    if (isFirstDependency){
      isFirstDependency=false;
      testToken();
    }
    super.didChangeDependencies();
  }

   testToken()async {
    token= await secureStorage.read('access_token');

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/person_man.png',
                  fit: BoxFit.cover),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.25),
            ),
            SizedBox(
              width: 200,
            ),
            Center(
              child: Column(

                children: [
                  SizedBox(
                    height: 200,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(90),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 50,
                    width: 105,
                    child: Center(
                      child: TextUtils(
                        text: 'Welcome'.tr,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        colorText: minWhite,
                      ),

                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: minblack.withAlpha(90),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 60,
                    width: 190,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                          text: 'Amal'.tr,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          colorText: minColor//Colors.greenAccent,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        TextUtils(
                            text: 'Shope'.tr,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            colorText: minWhite),
                        //  Text('Amal Shope',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: minColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 18,
                        ),
                    ),
                    onPressed: () {
                      onInit();

                     // Get.toNamed('/loginScreen');
                    },
                    child: TextUtils(
                      text: 'Get Start'.tr,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      colorText: minWhite,
                    ),
                  ),

                  // Container(
                  //  // color: Colors.green,
                  //   height: 60,
                  //   width:170,
                  //   decoration: BoxDecoration(
                  //     color: Colors.green,
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Center(child: TextUtils(text:'Get Start',fontSize: 18, fontWeight:FontWeight.normal ,colorText:Colors.white,),
                  //   //Text('Get Start',style: TextStyle(fontSize: 20,color: Colors.white),)
                  //   ),
                  // ),
                  //
                  SizedBox(
                    height: 30,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        text: "Don't have an Account?".tr,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        colorText: minWhite,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/signUpScreen');
                          },
                          child: TextUtils(
                            text: 'Sign up'.tr,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            colorText: minColor,
                            underLine: TextDecoration.underline,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
