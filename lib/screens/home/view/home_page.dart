import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/detail_item_movie/cubit/detail_item_movie_cubit.dart';
import 'package:your_money/screens/drawer_home/view/drawer_home_view.dart';
import 'package:your_money/uitls/app_format.dart';
import 'package:your_money/uitls/icons_assets.dart';
import 'package:your_money/uitls/size_config.dart';
import 'package:your_money/uitls/theme_color.dart';
import 'package:your_money/widget/icon_add_showbottomsheet.dart';

import '../components/banner_balance.dart';
import '../components/bottom_nativator.dart';
import '../components/label_title.dart';
import '../components/list_transactions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double turns = 0.0;
    return Scaffold(
      backgroundColor: ThemeColor.colorBackgroundWhile,
      drawer: const DrawerHomeView(),
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
           Positioned(
            bottom: SizeConfig.screenHeight * 0.060,
            child: SizedBox(
              height: SizeConfig.screenHeight * 0.08,
              width: SizeConfig.screenHeight * 0.08,
              child:  StatefulBuilder(
                builder: (context, setState2) {
                  return IconAddShowBottomSheet(
                    onPress: (){
                      setState2(()=> turns += 1.0 / 2.0);
                    },
                    iconWidget: AnimatedRotation(
                        duration: const Duration(seconds: 1),
                        turns: turns,
                        onEnd: (){
                          print("end funtion");
                        },
                        child: ImageIcon(const AssetImage(IconsAssets.change),color: Colors.white,size: SizeConfig.screenHeight * 0.04,)),
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}

