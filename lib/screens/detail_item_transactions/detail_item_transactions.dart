import 'package:flutter/material.dart';
import 'package:your_money/screens/home/home_page.dart';
import 'package:your_money/uitls/icons_assets.dart';
import 'package:your_money/uitls/theme_color.dart';
import 'package:your_money/widget/card_transactions.dart';
import 'package:your_money/widget/icon_border_btn.dart';
import 'package:your_money/widget/icon_circle_btn.dart';
import 'package:your_money/widget/text_header1.dart';
import 'package:your_money/widget/text_header3.dart';
import 'package:your_money/widget/textfield_border.dart';

import '../../widget/show_bottom_sheet.dart';
import '../add_expenses/add_expenses_page.dart';
import 'components/tab_controller.dart';

class DetailItemTransactions extends StatelessWidget {
  const DetailItemTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.colorBackgroundWhile,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      IconBorderBtn(
                        onPress: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: ThemeColor.colorGrey,
                        ),
                      ),
                      const TextHeader1(
                        text: "Food List",
                        fontSize: 30,
                      ),
                      const SizedBox(
                        height: 50,
                        child: IconCircleBtn(
                          icon: ImageIcon(
                            AssetImage(IconsAssets.dinner),
                            color: ThemeColor.colorWhile,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const TabControllerWidget(),
                const SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFieldBorder(
                      icon: Icon(Icons.search),
                      textHint: "Search Food...",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 100,
                  margin: const EdgeInsets.only(left: 20),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ThemeColor.colorOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.local_pizza,
                        color: ThemeColor.colorOrangeWhile,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextHeader3(
                        text: "All",
                        colorText: ThemeColor.colorWhile,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 7,
                      itemBuilder: (context, index) =>
                          const CardTransactions()),
                )
              ],
            ),
            Positioned(
              bottom: 60,
              right: 30,
              child: GestureDetector(
                onTap: () {
                  ShowBottomSheetClass.showBottomDefault(
                    context: context,
                    child: const AddExpensesPage(),
                  );
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      gradient: ThemeColor.linerColorReverse,
                      boxShadow: [
                        BoxShadow(
                            color: ThemeColor.colorGrey,
                            blurRadius: 7,
                            spreadRadius: 1,
                            offset: Offset(0, 2))
                      ]),
                  child: const Icon(
                    Icons.add_outlined,
                    size: 45,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
