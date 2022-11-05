import 'package:flutter/material.dart';

import '../uitls/size_config.dart';
import '../uitls/theme_color.dart';

class IconBgBtn extends StatelessWidget {
  const IconBgBtn({
    Key? key, required this.icon,
  }) : super(key: key);

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * 0.04,
      width: SizeConfig.screenHeight * 0.064,
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
