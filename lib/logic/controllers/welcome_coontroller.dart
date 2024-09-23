// import 'package:first_getx_api_project/native_service/secure_storage.dart';
// import 'package:get/get.dart';
//
// class SplashController extends GetxController{
//
//   late SecureStorage _storage;
//
// @override
//   void onInit() async{
//
//   _storage=SecureStorage();
//   await  checkTooken();
//  super.onInit();
//
//   }
// @override
//   void onReady() async{
//     // TODO: implement onReady
//   print('bbb');
//
//   super.onReady();
//   }
//
//   Future<void> checkTooken()async{
//   String? token =await _storage.read('access_token');
//   print(token);
//   if(token != null){
//     print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa***************************************');
//     Get.offAllNamed('/mainScreen');
//   }
//   else{
//     print('fffffffffffffffffffffffffffff');
//   Get.offNamed('/loginScreen');
//   }
//
//   }
//
// }