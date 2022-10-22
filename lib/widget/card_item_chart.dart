import 'package:flutter/material.dart';
import 'package:your_money/widget/text_header5.dart';

import '../uitls/theme_color.dart';

class CardItemChart extends StatelessWidget {
  const CardItemChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                height: double.maxFinite,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: ThemeColor.colorGreyWhile,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: ThemeColor.colorGreyWhile,
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: ThemeColor.listLinerColor
                      )
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
              height: 50,
              child: Center(child: TextHeader5(text: "01",fontWeight: FontWeight.bold,))),
        ],
      ),
    );
  }
}
