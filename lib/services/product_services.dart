
import 'package:first_getx_api_project/model/product_model.dart';
import 'package:first_getx_api_project/utils/my_string.dart';
import 'package:http/http.dart' as http;


class ProductServices{


 static Future <List<ProductModels>> getProduct() async{

 var response=  await  http.get(Uri.parse('$baseUrl/products'));
 if(response.statusCode==200){
   var jsonData= response.body;
   return productModelsFromJson(jsonData);
 }else{
   return throw Exception('Faild to load productt');
 }


  }

}