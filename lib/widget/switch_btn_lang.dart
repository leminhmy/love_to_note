import 'dart:math';

import 'package:flutter/material.dart';
import 'package:your_money/uitls/image_assets.dart';
import 'package:your_money/uitls/size_config.dart';
import 'package:your_money/widget/text_header3.dart';

import '../uitls/theme_color.dart';

class SwitchBtnLang extends StatefulWidget {
  const SwitchBtnLang(
      {Key? key, required this.value, required this.valueChanged})
      : super(key: key);

  final bool value;
  final ValueChanged<String> valueChanged;

  @override
  State<SwitchBtnLang> createState() => _SwitchBtnLangState();
}

class _SwitchBtnLangState extends State<SwitchBtnLang>
    with SingleTickerProviderStateMixin {
  bool isFlagVN = true;
  late final AnimationController _controller;
  late final Animation animationAlignment;
  late final Animation animationColor;
  late final Animation<double> animationSizeHalf;
  late final Animation<double> animationSizeMax;

  final Tween<Alignment> tweenAlignment =
      Tween<Alignment>(begin: Alignment.centerLeft, end: Alignment.centerRight);
  final ColorTween tweenColor =
      ColorTween(begin: ThemeColor.colorRed, end: ThemeColor.colorBlue);
  final Tween<double> tweenSize = Tween<double>(begin: 0, end: 1);

  @override
  void initState() {
    // TODO: implement initState
    isFlagVN = widget.value;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    if (!widget.value) {
      _controller.value = 1;
    }
    animationAlignment = tweenAlignment.animate(_controller);
    animationColor = tweenColor.animate(_controller);
    animationSizeHalf = tweenSize.animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5)));
    animationSizeMax = tweenSize.animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1)));
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
        const TextHeader3(text: "Vi", colorText: ThemeColor.colorBlack),
        AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                height: SizeConfig.screenHeight * 0.055,
                width: SizeConfig.screenHeight * 0.15,
                alignment: animationAlignment.value,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: animationColor.value,
                  borderRadius:
                      BorderRadius.circular(SizeConfig.screenHeight * 0.04),
                ),
                child: Transform.rotate(
                  angle: _controller.value * 2 * pi,
                  child: Opacity(
                    opacity:
                        1 - animationSizeHalf.value + animationSizeMax.value,
                    child: Container(
                      width: SizeConfig.screenHeight * 0.045,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(isFlagVN
                                ? ImageAssets.quocKiVietNam
                                : ImageAssets.flagUk),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          onPrimary: ThemeColor.colorBlueLight,
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: const CircleBorder(),
                        ),
                        onPressed: () {
                          if (!_controller.isAnimating) {
                            if (isFlagVN) {
                              widget.valueChanged("en");
                            } else {
                              widget.valueChanged("vi");
                            }
                            Future.delayed(const Duration(milliseconds: 250),
                                () {
                              isFlagVN = !isFlagVN;
                            });
                            if (_controller.value == 1) {
                              _controller.reverse();
                              return;
                            }
                            _controller.forward();
                          }
                        },
                        child: const SizedBox(),
                      ),
                    ),
                  ),
                ),
              );
            }),
        const TextHeader3(text: "En", colorText: ThemeColor.colorBlack),
      ],
    );
  }
}
