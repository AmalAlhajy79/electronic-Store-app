import 'package:first_getx_api_project/model/product_model.dart';
import 'package:first_getx_api_project/view/widgets/product_details/add_cart.dart';
import 'package:first_getx_api_project/view/widgets/product_details/clothes_info.dart';
import 'package:first_getx_api_project/view/widgets/product_details/image_sliders.dart';
import 'package:first_getx_api_project/view/widgets/product_details/size_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;

  ProductDetailsScreen({Key? key, required this.productModels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(imageUrl: productModels.image),
              ClothesInfo(
                  title: productModels.title.tr,
                  productId: productModels.id,
                rate: productModels.rating.rate,
                description: productModels.description,
              ),
              SizeList(),
              AddCart(price: productModels.price,productModels: productModels),
            ],
          ),
        ),
      ),
    );
  }
}
