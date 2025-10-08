import 'package:flutter/material.dart';
import 'package:jobs/core/const/app_colors.dart';

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
            borderSide: BorderSide(color: AppColor.teal),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColor.teal),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixicon,
          prefixIconColor: AppColor.gray,
          hint: hintText,
        ),
      ),
    );
  }
}
