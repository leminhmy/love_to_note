import 'package:flutter/material.dart';

class TextHeader5 extends StatelessWidget {
  const TextHeader5({Key? key, required this.text, this.colorText, this.fontSize, this.fontWeight}) : super(key: key);

  final String text;
  final Color? colorText;
  final double? fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
      height: 1.5,
        color: colorText??Colors.grey.shade400,
        fontSize: fontSize??17,
        fontWeight: fontWeight??FontWeight.w500
    ),);
  }
}
