
import 'package:flutter/material.dart';
import 'package:your_money/screens/home/view/home_view.dart';
import 'package:your_money/uitls/image_assets.dart';
import 'package:your_money/uitls/theme_color.dart';
import 'package:your_money/widget/text_header1.dart';

import '../../../app/router/route_name.dart';
import '../../../uitls/size_config.dart';
import '../../../widget/container_border_liner.dart';
import '../components/count_down_timer.dart';
import '../components/lottie_animation.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                stops: [0.1,0.3],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ThemeColor.colorOrange,
                  ThemeColor.colorBlack,
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              TweenAnimationBuilder(
                  tween: Tween<double>(begin: 10,end: 35),
                  duration: const Duration(seconds: 1),
                  curve: Curves.elasticInOut,
                  builder: (context, double value, child) {
                    return TextHeader1(text: "Welcome to Note",fontSize: value,colorText: ThemeColor.colorWhile,);
                  }
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: SizeConfig.screenHeight * 0.2,
                height: SizeConfig.screenHeight * 0.2,
                child: Stack(
                  children: const [
                    LottieAnimation(jsonLottie: ImageAssets.gifLoadingBg,),
                    LottieAnimation(jsonLottie: ImageAssets.gifNoteBg,),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeView()));
                },
                child: SizedBox(
                  height: SizeConfig.screenHeight * 0.07,
                  width: SizeConfig.screenHeight * 0.3,
                  child: ContainerBorderLiner(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const TextHeader1(text: "Continue",colorText: ThemeColor.colorWhile),
                        const SizedBox(width: 10,),
                        CountdownTimer(endCountdown: (int value){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeView()));


                        }),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}



