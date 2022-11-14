import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/uitls/theme_color.dart';

import '../../../uitls/icons_assets.dart';
import '../../../uitls/size_config.dart';
import '../../../widget/icon_add_showbottomsheet.dart';
import '../cubit/home_cubit.dart';

class BtnSwitchScreen extends StatelessWidget {
  const BtnSwitchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double turns = 0.0;
    bool onClick = true;
    Color colorDefault = ThemeColorDarkLight.isDarkThemeColor?Colors.white:Colors.black;
    return Positioned(
      bottom: SizeConfig.screenHeight * 0.060,
      child: SizedBox(
        height: SizeConfig.screenHeight * 0.08,
        width: SizeConfig.screenHeight * 0.08,
        child: StatefulBuilder(
            builder: (context, setState2) {
              return IconAddShowBottomSheet(
                onPress: () {
                  if(onClick){
                    onClick = false;
                    context.read<HomeCubit>().changeThemeColor();
                    setState2(() {
                      turns += 1.0 / 2.0;
                      colorDefault = colorDefault== Colors.black?Colors.white:Colors.black;
                    });
                  }
                },
                iconWidget: AnimatedRotation(
                    duration: const Duration(seconds: 1),
                    turns: turns,
                    onEnd: () {
                      onClick = true;
                    },
                    child: TweenAnimationBuilder(
                      tween: ColorTween(begin: Colors.black,end: colorDefault),
                      duration: const Duration(seconds: 1),
                      builder: (context, Color? color, child) {

                        return ImageIcon(
                          const AssetImage(IconsAssets.change),
                          color: color,
                          size: SizeConfig.screenHeight * 0.04,);
                      }

                    ),
                ),
              );
            }
        ),
      ),
    );
  }
}

