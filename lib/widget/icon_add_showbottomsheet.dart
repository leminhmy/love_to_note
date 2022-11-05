import 'package:flutter/material.dart';

import '../uitls/theme_color.dart';

class IconAddShowBottomSheet extends StatelessWidget {
  const IconAddShowBottomSheet({Key? key, this.onPress, this.iconWidget}) : super(key: key);

  final VoidCallback? onPress;
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          gradient: ThemeColor.linerColorReverse,
          boxShadow: [
            BoxShadow(
                color: ThemeColor.colorGrey,
                blurRadius: 7,
                spreadRadius: 1,
                offset: Offset(0, 2))
          ]),
      child:ElevatedButton(
        onPressed: onPress,
        onLongPress: (){},
        style: ElevatedButton.styleFrom(
          padding:  EdgeInsets.zero,
          onPrimary: ThemeColor.colorBlueLight,
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: const CircleBorder(),
        ),
        child: iconWidget?? const Icon(
          Icons.add_outlined,
          size: 45,
          color: Colors.white,
        ),
      ),
    );
  }
}
