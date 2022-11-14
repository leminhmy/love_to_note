import 'dart:math';

import 'package:flutter/material.dart';
import 'package:your_money/uitls/image_assets.dart';
import 'package:your_money/uitls/size_config.dart';
import 'package:your_money/widget/text_header3.dart';

import '../uitls/theme_color.dart';


class SwitchBtnDarkLight extends StatefulWidget {
  const SwitchBtnDarkLight({Key? key, required this.value, required this.valueChanged}) : super(key: key);

  final bool value;
  final ValueChanged<bool> valueChanged;

  @override
  State<SwitchBtnDarkLight> createState() => _SwitchBtnDarkLangState();
}

class _SwitchBtnDarkLangState extends State<SwitchBtnDarkLight> with SingleTickerProviderStateMixin{
  bool isDarkMode = true;
  final IconData iconDark = Icons.dark_mode_rounded;
  final IconData iconLight = Icons.light_mode;
  late final AnimationController _controller;
  late final Animation animationAlignment;
  late final Animation animationColor;
  late final Animation animationColorIcon;




  final Tween<Alignment> tweenAlignment = Tween<Alignment>(begin: Alignment.centerLeft,end: Alignment.centerRight);
  final ColorTween tweenColor = ColorTween(begin: ThemeColor.colorWhile,end: ThemeColor.colorBlack);
  final ColorTween tweenColorIcon = ColorTween(begin: ThemeColor.colorBlack,end: ThemeColor.colorWhile);
  final Tween<double> tweenSize = Tween<double>(begin: 0,end: 1);

  @override
  void initState() {
    // TODO: implement initState
    isDarkMode = widget.value;
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
    if(!widget.value){
      _controller.value = 1;
    }
    animationAlignment = tweenAlignment.animate(_controller);
    animationColor = tweenColor.animate(_controller);
    animationColorIcon = tweenColorIcon.animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TextHeader3(text: "Dark",colorText: ThemeColor.colorBlack),
        AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                height: SizeConfig.screenHeight * 0.055,
                width: SizeConfig.screenHeight * 0.15,
                alignment: animationAlignment.value,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.screenHeight * 0.04),
                  image:  DecorationImage(
                    image: AssetImage(isDarkMode?ImageAssets.themeDark:ImageAssets.themeLight),fit: BoxFit.cover
                  )
                ),
                child: Container(
                  width: SizeConfig.screenHeight * 0.045,
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    color: animationColor.value,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding:  EdgeInsets.zero,
                      onPrimary: ThemeColor.colorBlueLight,
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: const CircleBorder(),
                    ),
                    onPressed: (){
                      if(!_controller.isAnimating){
                        widget.valueChanged(!isDarkMode);

                        Future.delayed(const Duration(milliseconds: 250),(){
                          isDarkMode = !isDarkMode;
                        });
                        if(_controller.value == 1){
                          _controller.reverse();
                          return;
                        }
                        _controller.forward();
                      }

                    },
                    child: Icon(isDarkMode?iconDark:iconLight,color: animationColorIcon.value),
                  ),
                ),
              );
            }
        ),
        const TextHeader3(text: "Light",colorText: ThemeColor.colorBlack),
      ],
    );
  }
}
