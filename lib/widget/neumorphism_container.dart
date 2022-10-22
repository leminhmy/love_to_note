import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../uitls/theme_color.dart';

class NeumorphismContainer extends StatelessWidget {
  const NeumorphismContainer({Key? key, required this.child, this.colorBackground, this.colorShadow1, this.colorShadow2, this.offset, this.borderSize, this.inset}) : super(key: key);

  final Widget child;
  final Color? colorBackground;
  final Color? colorShadow1;
  final Color? colorShadow2;
  final Offset? offset;
  final double? borderSize;
  final bool? inset;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: colorBackground??ThemeColor.colorBackgroundWhile,
            borderRadius: BorderRadius.circular(borderSize??8),
            boxShadow:  [
              BoxShadow(
                  blurRadius: 2,
                  color: colorShadow2??ThemeColor.colorShadow1,
                  offset: offset??const Offset(4, 4),
                  inset: inset??true),
              BoxShadow(
                  blurRadius: 2,
                  color: colorShadow1??ThemeColor.colorShadow2,
                  offset: -(offset?? const Offset(4, 4)),
                  inset: inset??true),

            ]),
        child: child
    );
  }
}