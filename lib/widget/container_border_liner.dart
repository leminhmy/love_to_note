import 'package:flutter/material.dart';
import 'package:your_money/widget/text_header3.dart';

import '../uitls/theme_color.dart';

class ContainerBorderLiner extends StatelessWidget {
  const ContainerBorderLiner({Key? key,this.text, this.borderRadius, this.child, this.gradient}) : super(key: key);

  final String? text;
  final Widget? child;
  final Gradient? gradient;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ThemeColor.colorWhile,
        borderRadius: borderRadius??BorderRadius.circular(15),
        gradient: gradient??ThemeColor.linerColor
      ),
      child: child??TextHeader3(
        text: text??"",
        colorText: ThemeColor.colorGreyWhile,
      ),
    );
  }
}
