import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {

  int radioPaymentIndex=1;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15,right: 15),
        child: Column(
          children: [
            buildRadioPayment(
              name: 'Paypal'.tr,
              value: 1,
              image: 'assets/images/paypal.png',
            //  scale: 0.6,
              onChange: (int? value){
                setState(() {
                  radioPaymentIndex=value!;

                });
              }
            ),
            SizedBox(height: 15,),
            buildRadioPayment(
                name: 'Google Pay'.tr,
                value: 2,
                image: 'assets/images/google.png',
             //   scale: 0.8,
                onChange: (int? value){
                  setState(() {
                    radioPaymentIndex=value!;

                  });
                }
            ),
            SizedBox(
              height: 15,
            ),
            buildRadioPayment(
                name: 'Credit Pay'.tr,
                value: 3,
                image: 'assets/images/credit.png',
              //  scale: 0.1,
                onChange: (int? value){
                  setState(() {
                    radioPaymentIndex=value!;

                  });
                }
            ),
          ],
        ),
    );
  }
  Widget buildRadioPayment({
  required String image,
   // required double? scale,
    required String name,
   required int value,
    required Function onChange,

}){
return Container(
  height: 50,
  width: double.infinity,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.grey[300],
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 10,
          ),
          Container(
            child: Image.asset(image,width: 40,),
           decoration: BoxDecoration(
             color: minWhite,

           ),
          ),
          SizedBox(
            width: 10,
          ),
          Center(
            child: TextUtils(
                text: name,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                colorText:  minblack,
            ),
          ),
        ],
      ),
      Radio(
          value: value,
          groupValue: radioPaymentIndex,
          fillColor: MaterialStateColor.resolveWith((states) => minColor),
          onChanged: (int? value){
            onChange(value!);
          }
      ),
    ],
  ),
);

}

}
