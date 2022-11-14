import 'package:flutter/material.dart';
import 'package:your_money/uitls/theme_color.dart';

import '../uitls/size_config.dart';

class TextHeader3 extends StatelessWidget {
  const TextHeader3({Key? key, required this.text, this.colorText, this.fontSize, this.fontWeight, this.maxLine}) : super(key: key);

  final String text;
  final Color? colorText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
        color: colorText??ThemeColorDarkLight.color.text2,
        fontSize: fontSize??SizeConfig.screenHeight * 0.02,
        fontWeight: fontWeight??FontWeight.w600
    ),textAlign: TextAlign.center,maxLines: maxLine??1,overflow: TextOverflow.ellipsis,);
  }
}
