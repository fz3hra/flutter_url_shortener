import 'package:flutter/material.dart';

class CustomizedTextWidget extends StatelessWidget {
  String controllerCustomize;
  double fontSize;
  String fontFamily;
  CustomizedTextWidget({
    super.key,
    required this.controllerCustomize,
    required this.fontSize,
    required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      controllerCustomize,
      style: TextStyle(
        decoration: TextDecoration.underline,
        color: Color(0xFF0F1242),
        fontSize: fontSize,
        fontFamily: fontFamily,
      ),
    );
  }
}
