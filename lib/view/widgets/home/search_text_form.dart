import 'package:first_getx_api_project/logic/controllers/product_controller.dart';
import 'package:first_getx_api_project/model/product_model.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFormText extends StatelessWidget {
   SearchFormText({Key? key}) : super(key: key);
   final controller=Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        builder: (_)=> TextField(
          controller: controller.searchTextController,
          cursorColor: Colors.black,
          keyboardType:TextInputType.text,
          onChanged: (searchName){
            // print(searchName);
            controller.addSearchToList(searchName);
          },
          decoration:  InputDecoration(
              focusColor: Colors.red,
              fillColor: minWhite,
              prefixIcon: Icon(Icons.search,color: mingrey,),
              suffixIcon: controller.searchTextController.text.isNotEmpty ?
              IconButton(
                onPressed: (){
                  controller.clearSearch();
                },
                icon: Icon(Icons.close,color: minblack,),
              ): null,
              hintText: 'Search with name & price'.tr,
              hintStyle: TextStyle(
                color: Colors.black45,
                fontSize: 16,
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
    );
  }
}
