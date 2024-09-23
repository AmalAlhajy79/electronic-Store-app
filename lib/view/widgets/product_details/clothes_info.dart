import 'package:first_getx_api_project/logic/controllers/product_controller.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
//import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final controller = Get.find<ProductController>();
  final int productId;
  final double rate;
  final String description;

  ClothesInfo({Key? key, required this.title, required this.productId, required this.rate, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? minWhite : minblack,
                  ),
                ),
              ),
              Obx(
                () => Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? minWhite.withOpacity(0.9)
                        : mingrey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavourites(productId);
                    },
                    child: controller.isFavourites(productId)
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            color: minblack,
                            size: 20,
                          ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextUtils(
                  text: '$rate',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  colorText: Get.isDarkMode?minWhite : minblack,
              ),
              // SizedBox(
              //   height:8
              // ),

              // RatingBar(
              //   rating:rate,
              // icon:Icon(Icons.start,size: 20,color: mingrey,
              // ),
              //   starCount:5,
              //   spacing:1,
              //   size:20,
              //   isIndicator:false,
              //   allowHalfRating:true,
              //   onRatingCallback:(value,isIndector){
              //     isIndector.value=true;
              //   },
              //   color:Colors.orangeAccent
              // ),

              SizedBox(
                height: 20,
              ),

            ],
          ),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
          trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less ',
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? minpink : minColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? minpink : minColor,
            ),
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 2,
              color: Get.isDarkMode ? minWhite : minblack,
            ),

          ),
        ],
      ),
    );
  }
}
