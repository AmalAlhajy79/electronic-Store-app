import 'package:first_getx_api_project/utils/theme.dart';
import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function validator;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? sufffixIcon;

  AuthTextFormField(
      {required this.controller,
      required this.obscureText,
      required this.validator,
      required this.prefixIcon,
      this.sufffixIcon,
        required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: minblack,
      keyboardType: TextInputType.text,
      validator: (value) {
        validator(value);

      },
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        prefixIcon: prefixIcon,
        suffixIcon: sufffixIcon,
        hintText:hintText,
        hintStyle: TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,

        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:minWhite,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            color: minWhite,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: minWhite,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
