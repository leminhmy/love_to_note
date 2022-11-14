import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/home/home.dart';
import 'package:your_money/uitls/app_format.dart';
import 'package:your_money/uitls/size_config.dart';

import '../../../app/locate/lang_code.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/text_header1.dart';
import '../../../widget/text_header3.dart';
import '../../../widget/text_header5.dart';
import '../../transactions/view/transactions_page.dart';

class BannerBalance extends StatelessWidget {
  const BannerBalance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.screenHeight * 0.02),
      padding: EdgeInsets.all(SizeConfig.screenHeight * 0.02),
      height: SizeConfig.screenHeight * 0.25,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(SizeConfig.screenHeight * 0.035),
        gradient: ThemeColor.linerColor,
      ),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          double balance = state.expenses!.incomeMoney - state.expenses!.expensesMoney;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               TextHeader3(
                text: AppLang.lang(LangCode.theRemainingBalance),
                colorText: ThemeColor.colorGreyWhile,
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 500),
                    builder: (context, double value, child) {
                      double number = balance * value;
                      return TextHeader1(
                        text: AppLang.formatPrice(number),
                        fontSize: SizeConfig.screenHeight * 0.05,
                        colorText: ThemeColor.colorWhile,
                      );
                    }),
              ),

              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
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
                                 TextHeader5(
                                  text: AppLang.lang(LangCode.income),
                                  colorText: ThemeColor.colorWhile,
                                ),
                                TweenAnimationBuilder(
                                    tween: Tween<double>(begin: 0, end: 1),
                                    duration: const Duration(milliseconds: 500),
                                    builder: (context, double value, child) {
                                      double number = state.expenses?.incomeMoney??0 * value;
                                      return TextHeader3(
                                        text: AppLang.formatPrice(number),
                                        colorText: ThemeColor.colorGreyWhile,
                                      );
                                    }),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
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
                              children: [
                                 TextHeader5(
                                  text: AppLang.lang(LangCode.expenses),
                                   colorText: ThemeColor.colorWhile,
                                ),
                                TweenAnimationBuilder(
                                    tween: Tween<double>(begin: 0, end: 1),
                                    duration: const Duration(milliseconds: 500),
                                    builder: (context, double value, child) {
                                      double number = state.expenses?.expensesMoney??0 * value;
                                      return TextHeader3(
                                        text: AppLang.formatPrice(number),
                                        colorText: ThemeColor.colorGreyWhile,
                                      );
                                    }),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
