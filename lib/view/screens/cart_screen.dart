import 'package:first_getx_api_project/logic/controllers/cart_controller.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/cart/cart_product_card.dart';
import 'package:first_getx_api_project/view/widgets/cart/cart_total.dart';
import 'package:first_getx_api_project/view/widgets/cart/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart Items'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Get.isDarkMode ?minpink :minColor,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProducts();
              },
              icon: Icon(Icons.backspace),
            ),
          ],
        ),
        backgroundColor: context.theme.backgroundColor,
        // body: EmptyCart(),
        body: Obx((){
          if(controller.productsMap.isEmpty){
            return EmptyCart();
          }else{
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 600,
                  child: ListView.separated(
                      itemBuilder: (context,index){
                        return CartProductCard(
                          productModels: controller.productsMap.keys.toList()[index],
                          index: index,
                          quantity: controller.productsMap.values.toList()[index],
                        );
                      },
                      separatorBuilder: (context,index){
                        return  SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: controller.productsMap.length
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child:CartTotal(),

                ),
              ],
            ),
          );
          }
        }),
      ),
    );
  }

}
