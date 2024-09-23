import 'package:first_getx_api_project/logic/controllers/auth_controller.dart';
import 'package:first_getx_api_project/logic/controllers/payment_controller.dart';
import 'package:first_getx_api_project/logic/controllers/register_controller.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryContainerWidget extends StatefulWidget {
  DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {

  final authController=Get.find<AuthController>();
  final controller = Get.find<PaymentController>();
  final TextEditingController phoneController=TextEditingController();
  int radioContainerIndex = 1;
  bool changeColors = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRedioContainer(
          name: authController.displayUserName.value,
          icon: Container(),
          phone: '097000000',
          title: 'Amal Store'.tr,
          address: 'Syria,  almaza and albaramka'.tr,
          value: 1,
          color: changeColors ? minWhite : Colors.grey.shade300,
          onChanged: (int? value) {
            setState(
              () {
                radioContainerIndex = value!;
                changeColors = !changeColors;
              },
            );
          },
        ),
        SizedBox(
          height: 15,
        ),

     Obx(() =>    buildRedioContainer(
       name: authController.displayUserName.value,
       icon: InkWell(
           onTap: (){
             Get.defaultDialog(
                 title: 'Enter Your Phone Number Please '.tr,
                 titleStyle: TextStyle(
                   fontSize: 16,
                   color: minblack,
                   fontWeight: FontWeight.bold,
                 ),
                 backgroundColor: minWhite,
                 radius: 10,
                 buttonColor: Get.isDarkMode?minpink : minColor,
                 content: Padding(
                   padding: EdgeInsets.all(15),
                   child: TextField(
                     controller: phoneController,
                     cursorColor: Colors.black,
                     maxLength: 11,
                     keyboardType:TextInputType.text,
                     onSubmitted: (value){
                       phoneController.text=value;
                     },
                     decoration:  InputDecoration(
                         focusColor: Colors.red,
                         fillColor:Get.isDarkMode?minpink.withOpacity(0.2): minColor.withOpacity(0.2),
                         prefixIcon: Icon(
                           Icons.phone,
                           color:Get.isDarkMode?minpink: minColor,
                         ),
                         suffixIcon: IconButton(
                           icon: Icon(Icons.close,color: minblack, ),
                           onPressed: (){
                             phoneController.clear();
                           },

                         ),
                         hintText: 'Enter Your Phone Number'.tr,
                         hintStyle: TextStyle(
                           color: Colors.black45,
                           fontSize: 12,
                           fontWeight: FontWeight.w500,
                         ),
                         filled: true,
                         enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                             color: minWhite,
                           ),
                           borderRadius: BorderRadius.circular(10),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                             color: minWhite,
                           ),
                           borderRadius: BorderRadius.circular(10),
                         ),
                         errorBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                             color: minWhite,
                           ),
                           borderRadius: BorderRadius.circular(10),
                         ),
                         focusedErrorBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                             color: minWhite,
                           ),
                           borderRadius: BorderRadius.circular(10),
                         )
                     ),
                   ),
                 ),
                 textCancel: 'Cancel'.tr,
                 cancelTextColor: minblack,
                 textConfirm: 'Save'.tr,
                 confirmTextColor: minblack,
                 onCancel: (){
                   Get.toNamed('/paymentScreen');
                 },
                 onConfirm: (){
                   Get.back();
                   controller.phoneNumber.value=phoneController.text;
                 }
             );

           },
           child: Icon(
             Icons.contact_phone,
             size: 20,
             color: Get.isDarkMode ? minpink : minColor,
           )),
       phone: controller.phoneNumber.value,
       title: RegisterController().firstName,
       address: controller.address.value,
       value: 2,
       color: changeColors ? Colors.grey.shade300 : minWhite,
       onChanged: (int? value) {
         setState(
               () {
             radioContainerIndex = value!;
             changeColors = !changeColors;
           },
         );
         controller.updatePosition();
       },
     ),
     ),
      ],
    );
  }

  Widget buildRedioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
              color: mingrey.withOpacity(0.2), spreadRadius: 3, blurRadius: 5),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
              value: value,
              groupValue: radioContainerIndex,
              fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
              onChanged: (int? value) {
                onChanged(value);
              }),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: title,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  colorText: minblack,
                ),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                  text: name,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  colorText: minblack,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(

                  children: [
                    Text('+093 '),
                    TextUtils(
                      text: phone,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      colorText: minblack,
                    ),
                    SizedBox(
                      width: 160,
                    ),
                    SizedBox(
                      child: icon,
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                TextUtils(
                  text: address,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  colorText: minblack,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
