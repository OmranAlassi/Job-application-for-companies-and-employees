import 'package:flutter/material.dart';
import 'package:jobs/core/const/app_colors.dart';

// ignore: must_be_immutable
class CustomTogglebuttons extends StatelessWidget {
  CustomTogglebuttons({
    super.key,
    this.onPressed,
    required this.isSelected,
    required this.children,
  });

  void Function(int)? onPressed;
  List<bool> isSelected;
  List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: isSelected,
      borderRadius: BorderRadius.circular(12),
      fillColor: AppColor.teal,
      selectedColor: Colors.white,
      splashColor: AppColor.teal,
      color: AppColor.teal,
      renderBorder: true,
      textStyle: TextStyle(fontWeight: FontWeight.bold),
      constraints: BoxConstraints(
        minHeight: 50,
        minWidth: MediaQuery.of(context).size.width * 0.37,
      ),
      selectedBorderColor: AppColor.teal,
      onPressed: onPressed,
      children: children,
    );
  }
}
