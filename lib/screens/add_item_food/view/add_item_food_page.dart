import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/add_item_food/components/card_demo_item_food.dart';
import 'package:your_money/screens/add_item_food/cubit/add_item_food_cubit.dart';

import 'package:your_money/uitls/icons_assets.dart';

import 'package:your_money/widget/icon_circle_btn.dart';

import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/container_border_liner.dart';
import '../../../widget/icon_border_btn.dart';
import '../../../widget/text_header1.dart';
import '../components/edit_info_item_food.dart';

class AddItemFoodPage extends StatelessWidget {
  const AddItemFoodPage({
    Key? key, required this.nameCategory,
  }) : super(key: key);

  final String nameCategory;

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
            children:  [
              const IconBorderBtn(
                icon: Icon(Icons.add,size: 35,color: ThemeColor.colorBlack2,),
              ),
              const SizedBox(width: 10,),
              TextHeader1(text: "ItemFood - $nameCategory",),
            ],
          ),
          const SizedBox(height: 10,),
         const CardDemoItemFood(),
          Expanded(
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: ThemeColor.colorWhile,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: const EditInfoItemFood(),
            ),
          ),

           GestureDetector(
             onTap: (){
               context.read<AddItemFoodCubit>().saveToList();
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


