import 'package:flutter/material.dart';

class IconBorderBtn extends StatelessWidget {
  const IconBorderBtn({Key? key, this.color, required this.icon, this.onPress, this.borderRadius, this.colorBg}) : super(key: key);

  final Color? color;
  final Widget icon;
  final Color? colorBg;
  final VoidCallback? onPress;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress??(){},
      child: Container(
        height: 45,
        width: 45,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: colorBg??Colors.white,
            borderRadius: BorderRadius.circular(borderRadius??12),
        ),
        child: icon,
      ),
    );
  }
}
