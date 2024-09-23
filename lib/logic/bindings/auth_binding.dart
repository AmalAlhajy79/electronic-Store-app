import 'package:first_getx_api_project/logic/controllers/auth_controller.dart';
import 'package:first_getx_api_project/logic/controllers/login_controller.dart';
import 'package:first_getx_api_project/logic/controllers/register_controller.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings{
  @override
  void dependencies() {
   Get.put<AuthController>(AuthController());
   Get.put<LoginController>(LoginController());
   Get.put<RegisterController>(RegisterController());
  }

}