import 'package:first_getx_api_project/model/product_model.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {

  var productsMap = {}.obs;

  void addProductToCart(ProductModels productModels) {   //لاضافة منتج الى سلة التسوق
    if (productsMap.containsKey(productModels)) {           //اذا كان يوجد منتج سابق اضف إليه منتج آخر اي قم بزيادة عدد المنتجات
      productsMap[productModels] += 1;
      //  print(productsMap.value.toString());
      // print( productsMap.entries.map((e) => e.key.price * e.value).toList());
      //  print( productsMap.entries.map((e) => e.key.price * e.value).toList().reduce((value, element) => value + element).toStringAsFixed(2) );


    } else {               // وإلا اذا لم يكن اي منتج ذو ال id قم بجعل عدد المنتج المضاف 1
      productsMap[productModels] = 1;
      // print(productsMap.value.toString());
      //  print( productsMap.entries.map((e) => e.key.price * e.value).toList());
      // print( productsMap.entries.map((e) => e.key.price * e.value).toList().reduce((value, element) => value + element).toStringAsFixed(2) );

    }
  }

  void removeProductFromCart(ProductModels productModels) {        // اذا كان يوجد منتج و عدده في السلة يساوي 1 قم بحذف المنتج نهائيا من السلة
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);

    } else {        //والا يوجد اكثر من منتج من نفس النوع قم بإنقاص منتج واحد من عددهم
      productsMap[productModels] -= 1;
    }

    // Get.snackbar(
    //   'Error',
    //   "${productsMap[productModels]}",
    //   snackPosition: SnackPosition.BOTTOM,
    //   backgroundColor: minColor,
    //   colorText: minWhite,
    // );
  }

  void removeOneProduct(ProductModels productModels) {       //لحذف منتج من سلة التسوق يعني وقت نضغط ع سلة النفايات يلي باللون الاحمر بينحذف
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {                              //لحذف جميع المنتجات من سلة التسوق دفعة واحدة

    Get.defaultDialog(
      title: 'Clean Products',
      titleStyle: TextStyle(
        fontSize:10,
        color:Colors.black,
        fontWeight: FontWeight.bold
      ),
      middleText: 'Are you sure you need clear All products?',
      middleTextStyle: TextStyle(
          fontSize:10,
          color:Colors.black,
          fontWeight: FontWeight.bold
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: 'No',
      cancelTextColor: Colors.white,
      textConfirm: 'Yes',
      confirmTextColor: Colors.white,
      onCancel: (){
        Get.toNamed('/cartScreen');
      },
      onConfirm: (){
      productsMap.clear();
      Get.back();
    },
    buttonColor: Get.isDarkMode?Colors.pink:Colors.green,
    );

  }

  get productSubTotal =>                                 // لحساب مجموع اسعار المنتجات المضافة للسلة من نفس النوع
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total =>                                           // لحساب السعر النهائي لجميع المنتجات
      productsMap.entries.map((e) => e.key.price * e.value).toList().reduce((
          value, element) => value + element).toStringAsFixed(2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries.map((e) => e.value).toList().reduce((value,
          element) => value + element);
    }
  }
  // Map<dynamic, dynamic> productMap = {
  //
  //   "a" : [
  //     ProductModels(
  //         id: 1,
  //         title: "title",
  //         price: 33,
  //         description: "description",
  //         category: null,
  //         image: 'image',
  //         rating: Rating.fromJson({}),
  //     ),
  //     ProductModels(
  //       id: 2,
  //       title: "title",
  //       price: 33,
  //       description: "description",
  //       category: null,
  //       image: 'image',
  //       rating: Rating.fromJson({}),
  //     ),
  //   ],
  //   "b":[
  //     ProductModels(
  //       id: 1,
  //       title: "title",
  //       price: 33,
  //       description: "description",
  //       category: null,
  //       image: 'image',
  //       rating: Rating.fromJson({}),
  //     ),
  //   ]
  // };


}