import 'package:flutter/material.dart';
import 'package:your_money/uitls/size_config.dart';
import 'package:your_money/uitls/theme_color.dart';

class IconCircleBtn extends StatelessWidget {
  const IconCircleBtn({Key? key, this.color, required this.icon, this.onPress, this.size, this.onLongPress}) : super(key: key);

  final Color? color;
  final Widget icon;
  final double? size;
  final VoidCallback? onPress;
  final VoidCallback? onLongPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size??SizeConfig.screenHeight * 0.06,
      width: size??SizeConfig.screenHeight * 0.06,
      decoration: BoxDecoration(
         color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: ThemeColor.colorGreyWhile,
            blurRadius: 3,
            spreadRadius: 3
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            (color?.withOpacity(0.5))??Colors.red.withOpacity(0.5),
            color??Colors.red,
          ]
        )
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding:  EdgeInsets.zero,
            onPrimary: ThemeColor.colorBlueLight,
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: const CircleBorder(),
          ),
          onPressed: onPress??() {  },
          onLongPress: onLongPress??(){},
          child: icon),
    );
  }
}
