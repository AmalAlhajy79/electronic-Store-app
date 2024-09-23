import 'package:first_getx_api_project/view/screens/category_screen.dart';
import 'package:first_getx_api_project/view/screens/favorites_screen.dart';
import 'package:first_getx_api_project/view/screens/home_screen.dart';
import 'package:first_getx_api_project/view/screens/settings_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController{

  RxInt currentIndex=0.obs;
  final tabs=[
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;

  final title=[
    'Amal Shop'.tr,
    'Catigories'.tr,
    'Favorites'.tr,
    'Settings'.tr,
  ].obs;

}