import 'package:first_getx_api_project/utils/my_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController{
  var swichValue = false.obs;
  var storage =GetStorage();
  var langLocala=ene;

//لجعل اول حرف ببداية الكلمات الانكليزية بحرف كبير
  String capitalize(String profileName){
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }

// language

  @override
  void onInit() async{
    langLocala = await getLanguage;
    super.onInit();
    print('langLocalaaaaaaaaaaaa  is $langLocala');



  }


void saveLanguage(String lang)async{

await storage.write("lang",lang);
langLocala=lang;
print('saveLang is $lang');


}

 Future<String>get getLanguage async{
return  await storage.read('lang');

}

//   void changeLanguage(String typeLang)async{
//     print( 'typeLang is $typeLang' );
//        //  saveLanguage(typeLang);
//
//     if(langLocala == typeLang){
//        print('langLocala  is $typeLang');
//       return;
//     }
//    if(langLocala == frf){
//       langLocala=typeLang;
//       print('langLocala  is $typeLang');
//     //  saveLanguage(frf);
//
//
//    }
//    else if(langLocala == ara){
//        langLocala=typeLang;
//      // saveLanguage(typeLang);
//       print('langLocala  is $typeLang');
//
//    }
//    else{
//       langLocala=ene;
//    //   saveLanguage(ene);
//       print('langLocala  is $typeLang');
//
//    }
//    update();
// // Get.updateLocale(Locale(typeLang));
// // update();
//   }

}
