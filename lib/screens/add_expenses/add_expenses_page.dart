import 'package:flutter/material.dart';
import 'package:your_money/uitls/icons_assets.dart';
import 'package:your_money/widget/icon_circle_btn.dart';

import '../../uitls/theme_color.dart';
import '../../widget/card_transactions.dart';
import '../../widget/container_border_liner.dart';
import '../../widget/icon_border_btn.dart';
import '../../widget/label_textfield.dart';
import '../../widget/text_header1.dart';
import '../../widget/text_header3.dart';

class AddExpensesPage extends StatelessWidget {
  const AddExpensesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      decoration: const BoxDecoration(
          color: ThemeColor.colorBackgroundWhile,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          Padding(
             padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                IconBorderBtn(
                  icon: Icon(Icons.add,size: 35,color: ThemeColor.colorBlack2,),
                ),
                SizedBox(width: 10,),
                TextHeader1(text: "Expenses More",),
              ],
            ),
          ),
          const CardTransactions(),
          Expanded(
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: ThemeColor.colorWhile,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children:  [
                    const SizedBox(
                      height: 50,
                      child: LabelTextField(),
                    ),
                    const SizedBox(height: 10,),
                    const SizedBox(
                      height: 50,
                      child: LabelTextField(),
                    ),
                    const Padding(
                       padding: EdgeInsets.all(20),
                       child: TextHeader1(text: "Selected Icons",colorText: ThemeColor.colorGrey,),
                     ),
                    Wrap(
                      children: List.generate(15, (index) => const Padding(
                        padding: EdgeInsets.only(right: 20,bottom: 20),
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: IconCircleBtn(icon: ImageIcon(AssetImage(IconsAssets.burger),color: ThemeColor.colorWhile,)),
                        ),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
            width: 200,
            child: ContainerBorderLiner(
              text: "SAVE",
            ),
          )
        ],
      ),
    );
  }
}

