import 'dart:convert';

import 'package:first_getx_api_project/config/server_config.dart';
import 'package:first_getx_api_project/model/user_auth_model.dart';
import 'package:http/http.dart' as http;

class SignUpService{

  var message;
  var url=Uri.parse(ServerConfig.domainNameServer + ServerConfig.register);

Future<bool> register(User user)async{
 var response=await http.post(url,
  headers: {
'Accept':'application/json',
  },
    body: {
      'f_name':user.firstname,
      'l_name':user.firstname,//user.lastname,
      'email':user.email,
      'password':user.password,
      'password_confirmed':user.password,//user.passwordConfirm,
      'role_id':'1'
    },
  );

 print('*********************************');
 print(response.statusCode);
 print(response.body);
 print('********************************');

 if(response.statusCode==200){
   var jsonResponse = jsonDecode(response.body);/////////////////////////////////
   message=jsonResponse['message'];
   print(jsonResponse['message']);////////////////////////////////////////////
return true;
 }
 else if(response.statusCode==422){
   var jsonResponse = jsonDecode(response.body);/////////////////////////////////////email

   if(jsonResponse['f_name'] !=null){
     message=jsonResponse['f_name'];
   print(jsonResponse['f_name'] );
   }

   if(jsonResponse['l_name'] !=null){
     message=jsonResponse['l_name'];
  // print(jsonResponse['l_name']);

   }


   if(jsonResponse['email'] !=null) {
     message=jsonResponse['email'];
     print(jsonResponse['email']);
   }

   if(jsonResponse['role_id'] !=null) {
     message=jsonResponse['role_id'];
    // print(jsonResponse['role_id']);
   }

   if(jsonResponse['password'] !=null) {
     message=jsonResponse['password'];
     print(jsonResponse['password']);
   }

   if(jsonResponse['password_confirmed'] !=null) {
     message=jsonResponse['password_confirmed'];
    // print(jsonResponse['password_confirmed']);
   }
   return false;
 }
 else{
   message='server error';
   return false;
 }
}

}