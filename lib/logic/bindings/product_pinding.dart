

import 'package:first_getx_api_project/logic/controllers/cart_controller.dart';
import 'package:first_getx_api_project/logic/controllers/category_controller.dart';
import 'package:first_getx_api_project/logic/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<ProductController>(ProductController());
    Get.lazyPut<CartController>(() => CartController());
    Get.put<CategoryController>(CategoryController());

  }

}