import 'package:first_getx_api_project/logic/controllers/cart_controller.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/payment/delivery_container_widget.dart';
import 'package:first_getx_api_project/view/widgets/payment/payment_method_widget.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PaymentScreen extends StatelessWidget {
   PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text('Payment'.tr),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Get.isDarkMode ?minpink :minColor,
      ),
     body: SingleChildScrollView(
       child: Padding(
         padding: EdgeInsets.all(15),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             TextUtils(
               text: 'Shopping to'.tr,
               fontSize: 24,
               fontWeight: FontWeight.bold,
               colorText: Get.isDarkMode?minWhite:minblack,
             ),
             SizedBox(
               height: 20,
             ),
             DeliveryContainerWidget(),
             SizedBox(
               height: 20,
             ),
             TextUtils(
               text: 'Payment method'.tr,
               fontSize: 24,
               fontWeight: FontWeight.bold,
               colorText: Get.isDarkMode?minWhite:minblack,
             ),
             SizedBox(
               height: 20,
             ),
            PaymentMethodWidget(),
             SizedBox(
               height: 30,
             ),

             Center(
               child: Row(
                 children: [
                   TextUtils(
                     text: 'Total '.tr,
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                     colorText: Get.isDarkMode? minWhite :minblack,
                   ),
                   TextUtils(
                     text: '  ${CartController().total}',
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                     colorText: Get.isDarkMode? minWhite :minblack,
                   ),
                 ],
               )
             ),
             SizedBox(
               height: 20,
             ),
             Center(
               child: SizedBox(
                 height: 50,
                 width: 150,
                 child: ElevatedButton(
                   child: Text("Pay Now".tr,style: TextStyle(fontSize: 22,color: minWhite),),
                   style: ElevatedButton.styleFrom(
                     elevation: 0,
                     primary:Get.isDarkMode?minpink: minColor,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10),
                    //   side: BorderSide.none
                     )
                   ),
                   onPressed: (){

                   },
                 ),
               ),
             )
           ],
         ),
       ),
     ),
    );
  }
}
