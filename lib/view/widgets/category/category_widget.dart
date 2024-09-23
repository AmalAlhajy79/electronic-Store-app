
import 'package:first_getx_api_project/logic/controllers/category_controller.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/widgets/category/category_items.dart';
import 'package:first_getx_api_project/view/widgets/text_utils..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CategoryWidget extends StatelessWidget {

   CategoryWidget({Key? key}) : super(key: key);

   final controller=Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(controller.isCategoryLoding.value){
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode?minpink:minColor,
          ),
        );
      }else{
        return Expanded(
          child: ListView.separated(
            controller: ScrollController(),
            itemBuilder: (context,index){
              return
                InkWell(
                  onTap: (){
                   controller.getCategoryIndex(index);
                    Get.to(()=>CategoryItem(categoryTitle: controller.categoryNameList[index],));
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: minpink,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(controller.imageCategory[index]),
                          fit:BoxFit.cover
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20,bottom: 10),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '${controller.categoryNameList[index]}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: minWhite,
                              backgroundColor: minblack.withOpacity(0.4)
                          ),
                        ),
                      ),
                    ),
                  ),
                );
            },
            separatorBuilder: (context,index){
              return SizedBox(
                height: 20,
              );
            },
            itemCount: controller.categoryNameList.length,
          ),
        );
      }
    });
  }
}
