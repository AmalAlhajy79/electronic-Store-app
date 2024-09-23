import 'package:first_getx_api_project/model/product_model.dart';
import 'package:first_getx_api_project/services/category_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{

  var categoryNameList=<String>[].obs;
  var isCategoryLoding=false.obs;
  var categoryList= <ProductModels>[].obs;
  var isAllCategoryLoding=false.obs;

  List<String> imageCategory=[
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg".tr,
    "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg".tr,
    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg".tr,
    "https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_.jpg".tr,
  ];


  @override
  void onInit() {
    super.onInit();
    getCategorys();
  }

//getCategorys

  void getCategorys()async{
  var categoryName=  await CategoryServic.getCategory();

  try{
    isCategoryLoding(true);
    if(categoryName.isNotEmpty){
      categoryNameList.addAll(categoryName);
    }
  }finally{
    isCategoryLoding(false);
  }
  }

//getAllCategorys

  getAllCategorys(String categoryNames)async{

    isAllCategoryLoding(true);
     categoryList.value=  await AllCategoryServices.getAllCategory(categoryNames);
    isAllCategoryLoding(false);
  }

  getCategoryIndex(int index)async{
    var categoryAllName= await getAllCategorys(categoryNameList[index]);
    if(categoryAllName.isNotEmpty){
      categoryList.value = categoryAllName;
    }



  }

}