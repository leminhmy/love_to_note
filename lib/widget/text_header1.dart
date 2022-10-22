import 'package:flutter/material.dart';
import 'package:your_money/uitls/theme_color.dart';

class TextHeader1 extends StatelessWidget {
  const TextHeader1({Key? key, required this.text, this.colorText, this.fontSize, this.fontWeight}) : super(key: key);

  final String text;
  final Color? colorText;
  final double? fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
      color: colorText??ThemeColor.colorBlack,
      fontSize: fontSize??24,
      fontWeight: fontWeight??FontWeight.bold
    ),maxLines: 1,);
  }
}
