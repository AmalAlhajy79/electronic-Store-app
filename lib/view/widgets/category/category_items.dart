import 'package:first_getx_api_project/logic/controllers/cart_controller.dart';
import 'package:first_getx_api_project/logic/controllers/category_controller.dart';
import 'package:first_getx_api_project/logic/controllers/product_controller.dart';
import 'package:first_getx_api_project/model/product_model.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/screens/product_details_screen.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {

  final String categoryTitle;
  final controller=Get.find<ProductController>();
  final cartController=Get.find<CartController>();
  final categoryController=Get.find<CategoryController>();

  CategoryItem({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(
          '$categoryTitle',
        ),
        centerTitle: true,
        backgroundColor: Get.isDarkMode?minpink:minColor,
      ),
      body:Obx((){
        if(categoryController.isAllCategoryLoding.value){
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode?minpink :minColor,
            ),
          );
        }else{
          return GridView.builder(
              itemCount: categoryController.categoryList.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 6,
                maxCrossAxisExtent: 200,

              ),
              itemBuilder: (context,index){
                return buildCardItems(
                  image: categoryController.categoryList[index].image,
                  price: categoryController.categoryList[index].price,
                  rate: categoryController.categoryList[index].rating.rate,
                  productId: categoryController.categoryList[index].id,
                  productModels: categoryController.categoryList[index],
                  onTap: (){
                    Get.to(()=>ProductDetailsScreen(productModels: categoryController.categoryList[index],));
                  },
                );
              }
          );
        }
      }),
    );
  }
  Widget buildCardItems({
    required String image,
    required double price,
    required  double rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTap,

  }){
    return Padding(
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:minWhite,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx((){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: (){
                        controller.manageFavourites(productId);

                      },
                      icon: controller.isFavourites(productId)?
                      Icon(Icons.favorite,color: Colors.red,):
                      Icon(Icons.favorite_outline,color: minblack,)
                      ,
                    ),
                    IconButton(
                      onPressed: (){
                        cartController.addProductToCart(productModels);
                      },
                      icon: Icon(Icons.shopping_cart,color: minblack,),
                    ),
                  ],
                );
              }),
              Container(
                width: double.infinity,
                height:120 ,
                decoration: BoxDecoration(
                  color: minWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(image,fit: BoxFit.fitHeight,),
              ),


              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ $price',
                      style: TextStyle(
                        color:minblack,
                        //fontWeight: FontWeight.bold,

                      ),
                    ),
                    Container(
                        height: 20,
                        width: 45,
                        decoration: BoxDecoration(
                          color:Get.isDarkMode?minpink: minColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 3,right: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextUtils(
                                colorText: minWhite,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                text: '$rate',
                              ),
                              Icon(Icons.star,size: 13,color:minWhite)
                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
