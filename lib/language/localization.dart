


import 'package:first_getx_api_project/language/ar.dart';
import 'package:first_getx_api_project/language/en.dart';
import 'package:first_getx_api_project/language/fr.dart';
import 'package:first_getx_api_project/utils/my_string.dart';
import 'package:get/get.dart';

class LocalizationApp extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    ene:en,
    ara:ar,
    frf:fr,
  };

}