import 'package:flutter/material.dart';
import 'package:your_money/widget/text_header3.dart';
import 'package:your_money/widget/text_header5.dart';

import '../uitls/size_config.dart';
import '../uitls/theme_color.dart';

class CardItemChart extends StatelessWidget {
  const CardItemChart({
    Key? key, required this.index, required this.percent,
  }) : super(key: key);

  final int index;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenHeight * 0.06,
      child: Column(
        children: [
           TextHeader3(text: "${percent.ceil()}%",fontWeight: FontWeight.bold,colorText: percent>100?ThemeColor.colorRed:ThemeColor.colorBlue,),
          Expanded(
            child: Container(
              width: SizeConfig.screenHeight * 0.01,
              height: double.maxFinite,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: ThemeColorDarkLight.color.text3,
                borderRadius: BorderRadius.circular(SizeConfig.screenHeight * 0.015),
              ),
              child:  TweenAnimationBuilder(
                duration: const Duration(seconds: 1),
                tween: Tween<double>(begin: 0,end: 1),
                builder: (context,double value, child) {
                  return Container(
                    height: (SizeConfig.screenHeight * 0.24 * (percent/100)) * value,
                    decoration: BoxDecoration(
                        color: ThemeColor.colorGreyWhile,
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: ThemeColor.listLinerColor
                        )
                    ),
                  );
                }
              ),
            ),
          ),
           SizedBox(
              height: SizeConfig.screenHeight * 0.05,
              child: Center(child: TextHeader3(text: "0${index+1}",fontWeight: FontWeight.bold,colorText: ThemeColor.colorBlue,))),
        ],
      ),
    );
  }
}
