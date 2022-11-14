import 'package:flutter/material.dart';
import 'package:your_money/uitls/size_config.dart';
import 'package:your_money/uitls/theme_color.dart';

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
        color: colorText??ThemeColorDarkLight.color.text2,
        fontSize: fontSize??SizeConfig.screenHeight * 0.017,
        fontWeight: fontWeight??FontWeight.w500
    ),);
  }
}
