import 'package:flutter/material.dart';
import 'package:your_money/uitls/app_format.dart';

import '../../../uitls/theme_color.dart';
import '../../../widget/text_header1.dart';
import '../../../widget/text_header3.dart';
import '../../../widget/text_header5.dart';
import '../../transactions/transactions_page.dart';

class BannerBanlance extends StatelessWidget {
  const BannerBanlance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      height: 250,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        gradient: ThemeColor.linerColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextHeader3(
            text: "Total Balance",
            colorText: ThemeColor.colorGreyWhile,
          ),
          const SizedBox(
            height: 10,
          ),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(milliseconds: 500),
              builder: (context, double value, child) {
                double number = 4800000 * value;
                return TextHeader1(
                  text: AppFormat.numberFormatPriceVi(number),
                  fontSize: 50,
                  colorText: ThemeColor.colorWhile,
                );
              }),

          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ThemeColor.colorGreyWhile.withOpacity(0.7),
                      ),
                      child: const Icon(
                        Icons.arrow_downward_outlined,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextHeader5(
                          text: "Income",
                        ),
                        TweenAnimationBuilder(
                            tween: Tween<double>(begin: 0, end: 1),
                            duration: const Duration(milliseconds: 500),
                            builder: (context, double value, child) {
                              double number = 2500000 * value;
                              return TextHeader3(
                                text: AppFormat.numberFormatPriceVi(number),
                                colorText: ThemeColor.colorGreyWhile,
                              );
                            }),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ThemeColor.colorGreyWhile.withOpacity(0.7),
                      ),
                      child: const Icon(
                        Icons.arrow_upward_outlined,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const TextHeader5(
                          text: "Expenses",
                        ),
                        TweenAnimationBuilder(
                            tween: Tween<double>(begin: 0, end: 1),
                            duration: const Duration(milliseconds: 500),
                            builder: (context, double value, child) {
                              double number = 800000 * value;
                              return TextHeader3(
                                text: AppFormat.numberFormatPriceVi(number),
                                colorText: ThemeColor.colorGreyWhile,
                              );
                            }),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
