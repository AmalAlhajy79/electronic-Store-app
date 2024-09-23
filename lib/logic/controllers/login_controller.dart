import 'package:first_getx_api_project/native_service/secure_storage.dart';
import 'package:first_getx_api_project/services/loginService.dart';
import 'package:get/get.dart';
import 'package:first_getx_api_project/model/user_auth_model.dart';

class LoginController extends GetxController{

  var email='';
  var password='';

  var loginStatus=false;
  var message;
 // var checkBoxStatus=false.obs;

  LoginService service=LoginService();
  Future<void> loginOnClicked() async {
    User user = User(
        email: email,
        password: password,
     );
    loginStatus = await service.login(user);//,checkBoxStatus.value);
    message = service.message;
    if (message is List) {
      String temp = '';
      for (String s in message) {
        temp += s + '\n';
      }
      message = temp;
    }
  }




  // void changeCheckBox()async{
  //   checkBoxStatus(!(checkBoxStatus.value));
  //   SecureStorage secureStorage=SecureStorage();
  // String? test=   await secureStorage.read('access_token');
  //   print('ttttttttttttttttttttttttttt');
  //   print(test);
  //   print(checkBoxStatus);
  // }

}