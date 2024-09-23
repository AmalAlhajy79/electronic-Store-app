import 'package:flutter/material.dart';

const Color mingreen= Color(0xff66ff00);
const Color minpink=Color(0xffff007f);
const Color minblack=Color(0xff000000);
const Color mingrey=Color(0xff848482);
const Color minblue=Color(0xff0000ff);
const Color minRedDark=Color(0xff800020);
const Color minyellow=Color(0xfffff600);
const Color minColor=Color(0xffe1a95f);
const Color minWhite=Color(0xffffffff);
const Color minbisque=Color(0xffffe4c4);
const Color mindarkSetting=Color(0xff6132e4);




class ThemesApp{
 static final light=ThemeData(
   primaryColor: minColor,
   backgroundColor: Colors.white,
   brightness: Brightness.light
 );
  static final dark=ThemeData(
      primaryColor: Colors.pink,
      backgroundColor: Colors.black,
      brightness: Brightness.dark
  );
}