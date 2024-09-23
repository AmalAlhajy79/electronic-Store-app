import 'dart:convert';
import 'package:first_getx_api_project/config/server_config.dart';
import 'package:first_getx_api_project/config/user_information_token.dart';
import 'package:first_getx_api_project/model/user_auth_model.dart';
import 'package:first_getx_api_project/native_service/secure_storage.dart';
import 'package:http/http.dart' as http;

class LoginService{

  var message;
  var access_token;
  var url=Uri.parse(ServerConfig.domainNameServer + ServerConfig.login);

  login(User user,)async{//bool checkBox)async{      //Future<bool> login(User user)async{
    var response=await http.post(url,
      headers: {
        'Accept':'application/json',
      },
      body: {

        'email':user.email,
        'password':user.password,

      },
    );

    print('*********************************');
    print(response.statusCode);
    print(response.body);
    print('********************************');

    if(response.statusCode==200){
      var jsonResponse = jsonDecode(response.body);/////////////////////////////////
      print('token is ----------> ');
      access_token=jsonResponse['access_token'];
      UserInformation.USER_TOKEN=access_token;
      print('test ---->  ${UserInformation.USER_TOKEN}');
       // print(jsonResponse['access_token']);////////////////////////////////////////////

     // if(checkBox){
        //save token to device
        SecureStorage secureStorage=new SecureStorage();
      await  secureStorage.save('access_token', UserInformation.USER_TOKEN);
    //  }

      return true;
    }
    else if(response.statusCode==422){

      var jsonResponse = jsonDecode(response.body);/////////////////////////////////////email
    //  print(jsonResponse);
    //   print(jsonResponse[0]);
    //   print(jsonResponse[1]);

      if(jsonResponse[0] !=0) {
        print('error 0');
        message=jsonResponse[0];
        print(jsonResponse[0]);
      }
      // if(jsonResponse[1] !=0) {
      //   print('error 1');
      //   message=jsonResponse[1];
      //   print(jsonResponse[1]);
      // }

      return false;
    }else if(response.statusCode==403){
      var jsonResponse = jsonDecode(response.body);
      message=jsonResponse['message'];
    }
    else{
      message='server error';
      return false;
    }
  }

}