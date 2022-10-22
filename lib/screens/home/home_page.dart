import 'package:flutter/material.dart';
import 'package:your_money/uitls/theme_color.dart';
import 'package:your_money/widget/icon_add_showbottomsheet.dart';

import '../../widget/drawer_home.dart';
import 'components/banner_balance.dart';
import 'components/bottom_nativator.dart';
import 'components/label_title.dart';
import 'components/list_transactions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.colorBackgroundWhile,
      drawer: const DrawerHome(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                child: SafeArea(
                  child: Column(
                    children: const [
                      LabelTitle(),
                      BannerBanlance(),
                      ListTransactions(),
                    ],
                  ),
                ),
              ),
              const BottomNavigator(),
            ],
          ),
          const Positioned(
            bottom: 60,
            child: SizedBox(
              height: 80,
              width: 80,
              child: IconAddShowBottomSheet(),
            ),
          ),
        ],
      ),
    );
  }
}

