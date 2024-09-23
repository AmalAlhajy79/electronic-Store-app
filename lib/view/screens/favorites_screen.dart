import 'package:first_getx_api_project/logic/controllers/product_controller.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {

  final controller=Get.put<ProductController>(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
     body:Obx((){
       if(controller.favouritesList.isEmpty){
         return  Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               SizedBox(
                 height: 100,
                 width: 100,
                 child: Icon(Icons.favorite_outline,color: Get.isDarkMode?minpink:minColor,size: 135,),
               ),
               SizedBox(
                 height: 60,
               ),
               Text(
                 '  Please, Add your favorites products.'.tr,
                 style: TextStyle(
                     fontWeight: FontWeight.normal,
                     color:Get.isDarkMode?minWhite :minblack,
                     fontSize: 19
                 ),
               )
             ],
           ),
         );
       }else{
         return
           ListView.separated(
               itemCount: controller.favouritesList.length,
               separatorBuilder: (context,index){
                 return Divider(
                   color: mingrey,
                   thickness: 1,
                 );
               },
               itemBuilder: (context ,index){
                 return buildFavItem(
                     image: controller.favouritesList[index].image,
                   price: controller.favouritesList[index].price,
                   title: controller.favouritesList[index].title,
                   productId: controller.favouritesList[index].id
                 );
               }

           );
       }
     }),

        

    );
  }

  Widget buildFavItem(
  {
  required String image,
    required double price,
    required String title,
    required int productId,
 }
      ){
    return Padding(
        padding: EdgeInsets.all(10),
    child: SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          SizedBox(
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(image,fit: BoxFit.cover,),
              ),
            ),
          ),
          SizedBox(width: 15,),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color:Get.isDarkMode?minWhite :minblack,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$ $price',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color:Get.isDarkMode?minWhite :minblack,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
// SizedBox(
//   width: 20,
// ),
          Spacer(),
          
          IconButton(
              onPressed: (){
                controller.manageFavourites(productId);
          },
              icon: Icon(Icons.favorite,color: Colors.red,)
          ),

        ],
      ),
    ),

    );
  }

}