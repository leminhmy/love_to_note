import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/models/item_food.dart';
import 'package:your_money/models/item_menu.dart';
import 'package:your_money/repository/repository_menu.dart';
import 'package:your_money/screens/home/home.dart';
import 'package:your_money/uitls/icons_assets.dart';

import '../../../data/storage/storage.dart';
import '../../../models/expenses.dart';
import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/icon_border_btn.dart';
import '../../../widget/icon_circle_btn.dart';
import '../../../widget/text_header1.dart';
import '../../../widget/text_header3.dart';

class LabelTitle extends StatefulWidget {
  const LabelTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<LabelTitle> createState() => _LabelTitleState();
}

class _LabelTitleState extends State<LabelTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.screenHeight * 0.02),
      child: Row(
        children: [
           IconBorderBtn(
            onPress: (){
              Scaffold.of(context).openDrawer();
            },
            icon: const ImageIcon(AssetImage(IconsAssets.menuBar),color: ThemeColor.colorBlack),
          ),
          const SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TextHeader3(text: "Welcome"),
              TextHeader1(
                text: "John Doe",
              )
            ],
          ),
          const Spacer(),
           IconCircleBtn(
            onPress: () async{
                Expenses ex = await StorageSecure.getAllData();
                print(ex.toJson());
            },
              icon: const Icon(
                Icons.shopping_cart_rounded,
                color: Colors.white,
              )),


        ],
      ),
    );
  }
}
