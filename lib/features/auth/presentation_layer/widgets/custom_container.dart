import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  CustomContainer({
    super.key,
    required this.colors,
    this.height,
    this.width,
    this.child,
    this.margin,
    this.borderRadius,
    this.boxShadow,
    this.color,
  });
  List<Color> colors;
  double? height;
  Color? color;
  BorderRadiusGeometry? borderRadius;
  double? width;
  EdgeInsetsGeometry? margin;
  Widget? child;
  List<BoxShadow>? boxShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ),
      ),
      child: child,
    );
  }
}
