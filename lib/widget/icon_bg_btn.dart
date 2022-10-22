import 'package:flutter/material.dart';

import '../uitls/theme_color.dart';

class IconBgBtn extends StatelessWidget {
  const IconBgBtn({
    Key? key, required this.icon,
  }) : super(key: key);

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Stack(
        alignment: Alignment.center,
        children:  [
          const Icon(Icons.circle,color: ThemeColor.colorGrey,size: 35,),
          icon,

        ],
      ),
    );
  }
}
