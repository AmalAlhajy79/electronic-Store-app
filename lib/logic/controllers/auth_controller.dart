import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_getx_api_project/logic/bindings/auth_binding.dart';
import 'package:first_getx_api_project/native_service/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
class AuthController extends GetxController{

  bool isvisibilty=false;
  bool isCheckBox=false;

  // FirebaseAuth auth=FirebaseAuth.instance;
  // var googleSignIn=GoogleSignIn();
   var displayUserName= 'Name'.obs;
  // var displayUserPhoto='';



  void visibilty(){
    isvisibilty=!isvisibilty;
    update();
      }

     void checkBox(){
    isCheckBox=!isCheckBox;
    update();
     }

     void signOutFromApp() async{
    try{

     // await auth.signOut();
     // await  googleSignIn.signOut();
     // await FacebookAuth.i.logOut();
     // displayUserName='';
     // displayUserPhot='';

        await SecureStorage().deleteToken('access_token');
        EasyLoading.showSuccess('logOut is done!');



     update();
     Get.offAllNamed('/welcomeScreen');

    }catch(error){
      Get.snackbar('Error!', error.toString(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
        colorText: Colors.white
      );
    }
     }
}