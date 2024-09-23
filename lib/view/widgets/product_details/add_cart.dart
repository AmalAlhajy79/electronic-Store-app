import 'package:first_getx_api_project/logic/controllers/cart_controller.dart';
import 'package:first_getx_api_project/model/product_model.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModels productModels;
  final controller=Get.find<CartController>();

   AddCart({Key? key, required this.price, required this.productModels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  text: 'Price'.tr,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  colorText: mingrey
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '\$$price',
                style: TextStyle(
                  color: Get.isDarkMode?minWhite :minblack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      
                    ),
                    elevation: 0,
                    primary: Get.isDarkMode?minpink :minColor,
                  ),
                  onPressed: (){
                        controller.addProductToCart(productModels);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                         Text(
                           'Add to Cart '.tr,
                           style: TextStyle(
                             color: minWhite,
                             fontSize: 20,
                           ),
                         ),
                      Icon(Icons.shopping_cart_outlined,color: minWhite,)
                    ],
                  ),

                ),
              ),
          ),
        ],
      ),
    );
  }
}
