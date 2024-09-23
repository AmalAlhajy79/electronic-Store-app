import 'package:first_getx_api_project/logic/controllers/cart_controller.dart';
import 'package:first_getx_api_project/model/product_model.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {

  final ProductModels productModels;
  final int index;
  final int quantity;

  CartProductCard({super.key, required this.productModels, required this.index, required this.quantity});

  final controller=Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 8),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? minbisque//Colors.pink.withOpacity(0.5)
            : minbisque,//Colors.green.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color:Get.isDarkMode?minpink: minColor,
            width: 3,
          )

      ),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 100,
            margin: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: minWhite,
                image: DecorationImage(
                    image: NetworkImage(
                        productModels.image
                    ),
                    fit: BoxFit.cover)),

            // child: Card(
            //   clipBehavior: Clip.antiAlias,
            //   child: Image.asset('assets/images/lock.png',fit: BoxFit.cover,),
            //   ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
            productModels.title,
                  style: TextStyle(overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: minWhite
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '\$ ${controller.productSubTotal[index].toStringAsFixed(2)}',
                  style: TextStyle(overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color:minWhite
                  ),
                ),
              ],
            ),
          ),
Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){
                     controller.removeProductFromCart(productModels);
                  },
                      icon: Icon(Icons.remove_circle,color: minblack,)),
                  Text(
                    '$quantity',
                    style: TextStyle(overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: minblack
                    ),
                  ),
                  IconButton(onPressed: (){

                    controller.addProductToCart(productModels);
                  }, icon: Icon(Icons.add_circle,color: minblack,))
                ],
              ),
              IconButton(onPressed: (){
                controller.removeOneProduct(productModels);
              }, icon: Icon(Icons.delete,color:Get.isDarkMode?minpink: minColor,))
            ],
          )
        ],
      ),
    );
  }
}
