import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomContainer2 extends StatelessWidget {
  CustomContainer2({
    super.key,
    this.height,
    this.child,
    this.margin,
    this.borderRadius,
  });
  double? height;
  Widget? child;
  EdgeInsetsGeometry? margin;
  BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
