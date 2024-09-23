import 'package:first_getx_api_project/language/localization.dart';
import 'package:first_getx_api_project/logic/bindings/auth_binding.dart';
import 'package:first_getx_api_project/logic/bindings/main_binding.dart';
import 'package:first_getx_api_project/logic/bindings/product_pinding.dart';
import 'package:first_getx_api_project/logic/controllers/payment_controller.dart';
import 'package:first_getx_api_project/logic/controllers/product_controller.dart';
import 'package:first_getx_api_project/logic/controllers/theme_controller.dart';
import 'package:first_getx_api_project/routes/routes.dart';
import 'package:first_getx_api_project/utils/my_string.dart';
import 'package:first_getx_api_project/utils/theme.dart';
import 'package:first_getx_api_project/view/screens/auth/forgot_password_screen.dart';
import 'package:first_getx_api_project/view/screens/auth/login_screen.dart';
import 'package:first_getx_api_project/view/screens/auth/sign_up_screen.dart';
import 'package:first_getx_api_project/view/screens/cart_screen.dart';
import 'package:first_getx_api_project/view/screens/favorites_screen.dart';
import 'package:first_getx_api_project/view/screens/main_screen.dart';
import 'package:first_getx_api_project/view/screens/payment_screen.dart';
import 'package:first_getx_api_project/view/screens/welcome_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      title: 'Amal Shop'.tr,
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      translations: LocalizationApp(),
      locale: Locale(GetStorage().read<String>('lang').toString()),
      fallbackLocale: Locale(ene),
      initialRoute: '/welcomeScreen',
      //login,//welcoome,
      getPages: [
        GetPage(name: '/welcomeScreen', page: () => Welcomescreen(),),//binding: SplashBinding()
        GetPage(
            name: '/loginScreen',
            page: () => LoginScreen(),
            binding: AuthBinding()),
        GetPage(
            name: '/signUpScreen',
            page: () => SignUpScreen(),
            binding: AuthBinding()),
        GetPage(
            name: '/forgotPasswordScreen',
            page: () => ForgotPasswordScreen(),
            binding: AuthBinding()),
        GetPage(
            name: '/mainScreen',
            page: () => MainScreen(),
            bindings: [
              AuthBinding(),
              MainBinding(),
              ProductBinding(),
            ]),
        GetPage(
            name: '/favoritesScreen',
            page: () => FavoritesScreen(),
            ),
        GetPage(
          name: '/cartScreen',
          page: () => CartScreen(),
          bindings: [
            AuthBinding(),
            ProductBinding(),
          ]
        ),
        GetPage(
          name: '/paymentScreen',
          page: () => PaymentScreen(),

        ),
      ], //AppRoutes.routes,
    );
  }
}
