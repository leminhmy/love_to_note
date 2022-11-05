import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/drawer_home/components/card_item_drawer_demo.dart';
import 'package:your_money/screens/drawer_home/components/edit_info_drawer_item.dart';

import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/container_border_liner.dart';
import '../../../widget/icon_border_btn.dart';
import '../../../widget/label_textfield.dart';
import '../../../widget/text_header1.dart';
import '../cubit/drawer_home_cubit.dart';

class AddItemDrawer extends StatelessWidget {
  const AddItemDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Container(
      height: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 20),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  const [
              IconBorderBtn(
                icon: Icon(Icons.add,size: 35,color: ThemeColor.colorBlack2,),
              ),
              SizedBox(width: 10,),
              TextHeader1(text: "ItemDrawer",),
            ],
          ),
          const SizedBox(height: 10,),
          const CardItemDrawerDemo(),
          Expanded(
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: ThemeColor.colorWhile,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: const EditInfoItemDrawer()
            ),
          ),

          GestureDetector(
            onTap: (){
              context.read<DrawerHomeCubit>().saveToList();
            },
            child: SizedBox(
              height: SizeConfig.screenHeight * 0.06,
              width: SizeConfig.screenHeight * 0.2,
              child: const ContainerBorderLiner(
                text: "SAVE",
              ),
            ),
          )
        ],
      ),
    );
  }
}
