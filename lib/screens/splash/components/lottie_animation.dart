import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatefulWidget {
  final String jsonLottie;
  const LottieAnimation({Key? key, required this.jsonLottie}) : super(key: key);

  @override
  State<LottieAnimation> createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation>with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {

    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationController.addListener(() {
      if(_animationController.isCompleted){
        _animationController.repeat();
      }
    });
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.jsonLottie,
      fit: BoxFit.fill,
      controller: _animationController,
      onLoaded: (composition) {
        _animationController
          ..duration = composition.duration
          ..forward();
      },
    );
  }
}

