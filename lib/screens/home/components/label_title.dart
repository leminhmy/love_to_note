import 'package:flutter/material.dart';
import 'package:your_money/uitls/icons_assets.dart';

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
      padding: const EdgeInsets.all(20),
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
          const IconCircleBtn(
              icon: Icon(
                Icons.shopping_cart_rounded,
                color: Colors.white,
              )),


        ],
      ),
    );
  }
}
