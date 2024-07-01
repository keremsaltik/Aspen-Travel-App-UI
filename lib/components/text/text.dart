// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String? text = '';
  Color? textColor = null;
  FontWeight? fontWeight = null;
  double? fontSize = 25.0;
  String? fontFamily = '';
  Color? backgroundColor = null;
  TextWidget({
    Key? key,
    this.text,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.backgroundColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text ?? '',
      style: TextStyle(
        backgroundColor: backgroundColor ?? Colors.transparent,
        color: textColor ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize,
        fontFamily: fontFamily ?? 'Montserrat',
      ),
    );
  }
}
