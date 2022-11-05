import 'package:flutter/material.dart';
import 'package:your_money/app/router/route_name.dart';


import '../../../uitls/icons_assets.dart';
import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/icon_bg_btn.dart';
import '../../transactions/view/transactions_page.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.1,
      decoration:  BoxDecoration(
          color: ThemeColor.colorWhile,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SizeConfig.screenHeight * 0.05),
            topRight: Radius.circular(SizeConfig.screenHeight * 0.05),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
           SizedBox(
            height: SizeConfig.screenHeight * 0.04,
            width: SizeConfig.screenHeight * 0.04,
            child: const ImageIcon(
              AssetImage(IconsAssets.application),
              color: ThemeColor.colorGrey,
            ),
          ),
          InkWell(
            onTap: (){
             Navigator.pushNamed(context, RouteName.transactions,arguments: "");
            },
            child: IconBgBtn(
              icon: Icon(
                Icons.bar_chart,
                color: ThemeColor.colorWhile,
                size: SizeConfig.screenHeight * 0.02,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

