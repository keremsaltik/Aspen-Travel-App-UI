// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../views/MainScreen/view/main_screen_view.dart';

class ButtonWidget extends StatelessWidget {
  String buttonText = '';
  Widget? page;
  WidgetStatePropertyAll<Color>? overlayColor;
  Color? buttonColor;
  WidgetStatePropertyAll<Size>? fixedButtonSize;
  Color buttonTextColor;
  double? radius;
  bool isSelected;
  ButtonWidget({
    Key? key,
    required this.buttonText,
    required this.buttonTextColor,
    required this.isSelected,
    this.buttonColor,
    this.page,
    this.overlayColor,
    this.fixedButtonSize,
    this.radius,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => page ?? MainScreenPage()));
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 100),
        child: Text(
          buttonText,
          style: TextStyle(color: buttonTextColor ?? Colors.blue),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(buttonColor ?? Colors.blue),
        fixedSize: fixedButtonSize,
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 16)),
        ),
        overlayColor: overlayColor,
      ),
    );
  }
}
