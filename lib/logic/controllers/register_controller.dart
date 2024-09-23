
import 'package:first_getx_api_project/model/user_auth_model.dart';
import 'package:first_getx_api_project/services/register_service.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var firstName = '';
  var lastNamme = '';
  var email = '';
  var password = '';
  var passwordConfirm = '';
  var sinUpStatus = false;
  var message;

  SignUpService service = SignUpService();

  Future<void> registerOnClicked() async {
    User user = User(
        firstname: firstName,
       // lastname: lastNamme,
        email: email,
        password: password,
      //  passwordConfirm: passwordConfirm
        );
    sinUpStatus = await service.register(user);
    print('iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
    print(firstName);
    print(lastNamme);
    print(email);
    print(password);
    print(passwordConfirm);
    message = service.message;
    if (message is List) {
      String temp = '';
      for (String s in message) {
        temp += s + '\n';
      }
      message = temp;
    }
  }
}
