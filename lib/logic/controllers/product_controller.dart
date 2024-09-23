

 import 'package:first_getx_api_project/model/product_model.dart';
import 'package:first_getx_api_project/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController{

  var productsList=<ProductModels>[].obs;
  var favouritesList=<ProductModels>[].obs;
  var isLoding =true.obs;
  var storage=GetStorage();
  //var isFavorites=false.obs;

  // search
  var searchList=<ProductModels>[].obs;
  TextEditingController searchTextController=TextEditingController();

  @override
  void onInit() {

    super.onInit();
  List? storedShopping= storage.read<List>('isFavouritesList');
  if(storedShopping != null){
    favouritesList = storedShopping.map((e) => ProductModels.fromJson(e)).toList().obs;
  }
    getProducts();

  }

 void getProducts() async{

   var products=await   ProductServices.getProduct();

      try{
        isLoding(true);
        if(products.isNotEmpty){
          productsList.addAll(products);
        }
      }finally{
        isLoding(false);
      }
  }
  //   logic for favorites cscreen

void manageFavourites(int productId) async{
    var existingIndex= favouritesList.indexWhere((element) => element.id==productId);
    print('============');
    print(existingIndex);
    if(existingIndex >=0){

      favouritesList.removeAt(existingIndex);
      await storage.remove('isFavouritesList');

    }else{
      favouritesList.add(productsList.firstWhere((element) => element.id == productId));
     await storage.write('isFavouritesList', favouritesList);

    }

  }

bool isFavourites(int productId){

    return favouritesList.any((element) => element.id==productId);
}



  //
  // void addFavourites(){
  //   isFavorites.value= !isFavorites.value;
  // }

         // search Bar logic

  void addSearchToList(String searchName){

    searchName = searchName.toLowerCase();
    searchList.value=productsList.where((search) {

      var searchTitle =search.title.toLowerCase();
      var searchPrice =search.price.toString().toLowerCase();


      return searchTitle.contains(searchName) || searchPrice.toString().contains(searchName);

    }).toList();

    update();

  }

  void clearSearch(){
    searchTextController.clear();
    addSearchToList("");
  }


}








