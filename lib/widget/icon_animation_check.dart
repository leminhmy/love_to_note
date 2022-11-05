import 'package:flutter/material.dart';

import '../uitls/icons_assets.dart';
import '../uitls/size_config.dart';
import '../uitls/theme_color.dart';

class IconAnimationCheck extends StatelessWidget {
  const IconAnimationCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 1),
      tween: Tween<double>(begin: 0,end: 1),
      curve: Curves.elasticOut,
      builder: (context,double value,child) {
        return Align(
          alignment:  Alignment(1,2-value),
          child: Transform.scale(
            scale: 1 * value,
            child: ImageIcon(
                const AssetImage(
                    IconsAssets.check),
                color: ThemeColor.colorGreen,
                size: SizeConfig.screenHeight *
                    0.03),
          ),
        );
      }
    );
  }
}
