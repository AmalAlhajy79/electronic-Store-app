
import 'package:first_getx_api_project/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:first_getx_api_project/model/category_model.dart';
import 'package:first_getx_api_project/utils/my_string.dart';

class CategoryServic {
  static Future <List<String>> getCategory() async{

    var response=  await  http.get(Uri.parse('$baseUrl/products/categories'));
    if(response.statusCode==200){
      var jsonData= response.body;
      return categoryModelsFromJson(jsonData);
    }else{
      return throw Exception('Faild to load category');
    }


  }
}


class AllCategoryServices{


  static Future <List<ProductModels>> getAllCategory(String categoryNames) async{

    var response=  await  http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));
    if(response.statusCode==200){
      var jsonData= response.body;
      return productModelsFromJson(jsonData);
    }else{
      return throw Exception('Faild to load AllCategory');
    }


  }

}