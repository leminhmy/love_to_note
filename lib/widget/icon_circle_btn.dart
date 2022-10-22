import 'package:flutter/material.dart';
import 'package:your_money/uitls/theme_color.dart';

class IconCircleBtn extends StatelessWidget {
  const IconCircleBtn({Key? key, this.color, required this.icon, this.onPress, this.size}) : super(key: key);

  final Color? color;
  final Widget icon;
  final double? size;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress??(){},
      child: Container(
        height: size??60,
        width: size??60,
        padding: const EdgeInsets.all(10),
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
        child: icon,
      ),
    );
  }
}
