import 'package:flutter/material.dart';
import 'package:your_money/screens/detail_item_movie/detail_item_movie.dart';
import 'package:your_money/widget/card_transactions.dart';
import 'package:your_money/widget/container_border_liner.dart';
import 'package:your_money/widget/icon_border_btn.dart';
import 'package:your_money/widget/show_bottom_sheet.dart';
import 'package:your_money/widget/text_header1.dart';
import 'package:your_money/widget/text_header3.dart';

import '../../../uitls/icons_assets.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/icon_bg_btn.dart';
import '../../add_expenses/add_expenses_page.dart';
import '../../transactions/transactions_page.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          color: ThemeColor.colorWhile,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
          const SizedBox(
            height: 40,
            width: 40,
            child: ImageIcon(
              AssetImage(IconsAssets.application),
              color: ThemeColor.colorGrey,
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TransactionsPage()));
            },
            child: const IconBgBtn(
              icon: Icon(
                Icons.bar_chart,
                color: ThemeColor.colorWhile,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

