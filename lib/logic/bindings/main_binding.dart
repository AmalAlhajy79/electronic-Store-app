import 'package:first_getx_api_project/logic/controllers/main_controller.dart';
import 'package:first_getx_api_project/logic/controllers/payment_controller.dart';
import 'package:first_getx_api_project/logic/controllers/setting_controller.dart';
import 'package:get/get.dart';

class MainBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
    Get.put<SettingController>(SettingController());
    Get.put<PaymentController>(PaymentController());
  }

}