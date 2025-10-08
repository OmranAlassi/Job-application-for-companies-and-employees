import 'package:flutter/material.dart';
import 'package:jobs/classes/style&create_login_screen.dart';

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
      fillColor: styles[0].backgroundcolor,
      selectedColor: Colors.white,
      splashColor: styles[0].backgroundcolor,
      color: styles[0].backgroundcolor,
      renderBorder: true,
      textStyle: TextStyle(fontWeight: FontWeight.bold),
      constraints: BoxConstraints(
        minHeight: 50,
        minWidth: MediaQuery.of(context).size.width * 0.37,
      ),
      selectedBorderColor: styles[0].backgroundcolor,
      onPressed: onPressed,
      children: children,
    );
  }
}
