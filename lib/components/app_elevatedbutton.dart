import 'package:flutter/material.dart';
import 'package:jobs/classes/style&create_login_screen.dart';

// ignore: must_be_immutable
class AppElevatedbutton extends StatelessWidget {
  AppElevatedbutton({
    super.key,
    required this.onPressed,
    required this.title,
    this.elevation,
    this.fixedSize,
    this.fontSize,
  });
  void Function()? onPressed;
  String title;
  double? elevation;
  Size? fixedSize;
  double? fontSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        elevation: elevation,
        fixedSize: fixedSize,
        backgroundColor: styles[0].backgroundcolor,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: fontSize,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
