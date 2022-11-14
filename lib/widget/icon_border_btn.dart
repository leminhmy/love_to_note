import 'package:flutter/material.dart';
import 'package:your_money/uitls/theme_color.dart';

import '../uitls/size_config.dart';

class IconBorderBtn extends StatelessWidget {
  const IconBorderBtn(
      {Key? key,
      this.color,
      required this.icon,
      this.onPress,
      this.borderRadius,
      this.colorBg})
      : super(key: key);

  final Color? color;
  final Widget icon;
  final Color? colorBg;
  final VoidCallback? onPress;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.045,
      width: SizeConfig.screenHeight * 0.045,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: colorBg ?? ThemeColorDarkLight.color.button,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
      ),
      child: ElevatedButton(
        onPressed: onPress,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            onPrimary: ThemeColor.colorBlueLight
          ),
          child: icon),
    );
  }
}
