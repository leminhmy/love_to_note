import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:your_money/data/storage/storage.dart';
import 'package:your_money/models/expenses.dart';
import 'package:your_money/models/note_movie.dart';
import 'package:your_money/repository/repository_menu.dart';

import '../../../app/locate/lang_code.dart';
import '../../../app/router/route_name.dart';
import '../../../uitls/icons_assets.dart';
import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/icon_border_btn.dart';
import '../../../widget/icon_circle_btn.dart';
import '../../../widget/text_header1.dart';

class LabelTile extends StatelessWidget {
  const LabelTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconBorderBtn(
            onPress: () {
              Navigator.pushNamed(
                  context, RouteName.initial, arguments: "");
            },
            icon:  Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ThemeColorDarkLight.color.icon,
            ),
          ),
          TextHeader1(
            text: AppLang.lang(LangCode.movieList),

            fontSize: SizeConfig.screenHeight * 0.03,
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.05,
            child:  IconCircleBtn(
              onPress: () async {
                Expenses ex = await StorageSecure.getExpenses();
                // print(ex.listNoteMovie[0].listDay.map((e) => e.toJson()));
                // Expenses ex = await RepositoryMenu().getDataToStorage();
                log("${ex.listNoteMovie.map((e) => e.toJson())}");
              },
              color: ThemeColor.colorOrange,
              icon: const  ImageIcon(
                AssetImage(IconsAssets.film),
                color: ThemeColor.colorWhile,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
