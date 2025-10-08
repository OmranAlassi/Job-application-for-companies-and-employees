import 'package:flutter/material.dart';
import 'package:jobs/classes/style&create_login_screen.dart';

// ignore: must_be_immutable
class AppTextformfiled extends StatelessWidget {
  AppTextformfiled({
    super.key,
    required this.keyboardType,
    required this.prefixIcon,
    required this.hintText,
    required this.textInputAction,
    this.controller,
    this.validator,
    this.obscureText,
    this.suffixicon,
  });
  TextInputAction textInputAction;
  TextInputType keyboardType;
  Widget prefixIcon;
  Widget hintText;
  Widget? suffixicon;
  bool? obscureText;
  TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: controller,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        validator: validator,
        autofocus: false,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.red),
          ),
          errorStyle: TextStyle(color: Colors.red),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: styles[1].backgroundcolor!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: styles[0].backgroundcolor!),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixicon,
          prefixIconColor: styles[2].backgroundcolor,
          hint: hintText,
        ),
      ),
    );
  }
}
