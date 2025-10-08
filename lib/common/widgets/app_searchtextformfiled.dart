import 'package:flutter/material.dart';
import 'package:jobs/core/const/app_colors.dart';

// ignore: must_be_immutable
class AppSearchtextformfiled extends StatelessWidget {
  AppSearchtextformfiled({
    super.key,
    required this.keyboardType,
    required this.prefixIcon,
    required this.hintText,
    required this.textInputAction,
    this.controller,
    this.suffixicon,
    this.onChanged,
  });
  TextInputAction textInputAction;
  TextInputType keyboardType;
  Widget prefixIcon;
  Widget hintText;
  Widget? suffixicon;

  TextEditingController? controller;
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        autofocus: false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColor.white1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColor.teal),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixicon,
          hint: hintText,
          prefixIconColor: AppColor.teal,
        ),
      ),
    );
  }
}
