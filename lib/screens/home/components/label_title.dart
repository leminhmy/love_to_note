import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/app/locate/lang_code.dart';

import 'package:your_money/screens/home/home.dart';
import 'package:your_money/uitls/icons_assets.dart';


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
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
      current.reload == HomeReload.themeColor,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(SizeConfig.screenHeight * 0.02),
          child: Row(
            children: [

              IconBorderBtn(
                onPress: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: ImageIcon(const AssetImage(IconsAssets.menuBar),
                    color: ThemeColorDarkLight.color.text),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextHeader3(text: AppLang.lang(LangCode.welcome),
                    colorText: ThemeColorDarkLight.color.text,
                  ),
                  TextHeader1(
                    text: "John Doe",
                    colorText: ThemeColorDarkLight.color.text,
                  )
                ],
              ),
              const Spacer(),
              IconCircleBtn(
                  onPress: () async {

                  },
                  icon: const Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.white,
                  )),


            ],
          ),
        );
      },
    );
  }
}
