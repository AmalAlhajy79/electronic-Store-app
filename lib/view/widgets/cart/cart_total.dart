
import 'package:first_getx_api_project/logic/controllers/cart_controller.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class  CartTotal extends StatelessWidget {
   final controller=Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() =>Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TextUtils(
                text: 'Total'.tr,

                fontWeight: FontWeight.bold,
                fontSize: 16,
                colorText: Colors.grey,
              ),
              SizedBox(
                height: 5,
              ),
              TextUtils(
                text: '\$${controller.total.tr}',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                colorText:Get.isDarkMode?minWhite: minblack,
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
                  primary:Get.isDarkMode?minpink: minColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  // padding: EdgeInsets.symmetric(
                  //   horizontal:130,
                  //   vertical: 25,
                  // ),
                ),
                onPressed: () {
                  Get.toNamed('/paymentScreen');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                      text: 'Check Out '.tr,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      colorText: minWhite,
                    ),
                    Icon(Icons.shopping_cart,color:minWhite ,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )
    );
  }
}
