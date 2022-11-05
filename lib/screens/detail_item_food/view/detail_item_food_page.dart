import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/add_item_food/view/add_item_food_view.dart';
import 'package:your_money/screens/detail_item_food/cubit/detail_item_food_cubit.dart';
import 'package:your_money/screens/detail_item_movie/cubit/detail_item_movie_cubit.dart';
import 'package:your_money/uitls/icons_assets.dart';
import 'package:your_money/uitls/size_config.dart';
import 'package:your_money/uitls/theme_color.dart';
import 'package:your_money/widget/drop_down_btn.dart';
import 'package:your_money/widget/icon_border_btn.dart';
import 'package:your_money/widget/icon_circle_btn.dart';
import 'package:your_money/widget/text_header1.dart';
import 'package:your_money/widget/text_header3.dart';
import 'package:your_money/widget/textfield_border.dart';

import '../../../app/router/route_name.dart';
import '../../../models/item_food.dart';
import '../../../widget/card_item_food.dart';
import '../../../widget/show_bottom_sheet.dart';
import '../components/tab_controller.dart';

class DetailItemFoodPage extends StatelessWidget {
  const DetailItemFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.colorBackgroundWhile,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconBorderBtn(
                        onPress: () {
                          Navigator.pushNamed(
                              context, RouteName.initial,
                              arguments: "");
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: ThemeColor.colorGrey,
                        ),
                      ),
                      TextHeader1(
                        text: "Food List",
                        fontSize: SizeConfig.screenHeight * 0.03,
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.05,
                        child: const IconCircleBtn(
                          icon: ImageIcon(
                            AssetImage(IconsAssets.dinner),
                            color: ThemeColor.colorWhile,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const TabControllerWidget(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.06,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFieldBorder(
                      icon: Icon(Icons.search),
                      textHint: "Search Food...",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextHeader3(text: "All Item"),
                      DropDownBtn(
                        listItemDrop: const ["Date", "Ascending", "Descending"],
                        indexSelected: (int index) {
                        context.read<DetailItemFoodCubit>().sortItem(index);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: BlocBuilder<DetailItemFoodCubit, DetailItemFoodState>(
                    buildWhen: (previous, current) =>
                    current.reload == DetailItemFoodReload.listItem,
                    builder: (context, state) {

                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.listItemFood.length,
                          itemBuilder: (context, index) =>
                              CardItemFood(
                                onPressDelete: (){
                                  context.read<DetailItemFoodCubit>().deleteItem(state.listItemFood[index]);
                                },
                                subWidget: TextHeader3(
                                  text: "Quantity: ${state.listItemFood[index].quantity}",
                                ),
                                item: state.listItemFood[index],));
                    },
                  ),
                )
              ],
            ),
            BlocBuilder<DetailItemFoodCubit, DetailItemFoodState>(
              builder: (context, state) {
                String nameCategory = state.listItemExpenses[state.indexListExpenses].name;
                return Positioned(
                  bottom: SizeConfig.screenHeight * 0.06,
                  right: SizeConfig.screenHeight * 0.03,
                  child: GestureDetector(
                    onTap: () {
                      ShowBottomSheetClass.showBottomDefault(
                        context: context,
                        child: AddItemFoodView(nameCategory: nameCategory,indexCategory: state.indexListExpenses),
                      ).then((value) {
                        context.read<DetailItemFoodCubit>()
                            .reloadListItemFood();
                      });
                    },
                    child: Container(
                      width: SizeConfig.screenHeight * 0.08,
                      height: SizeConfig.screenHeight * 0.08,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          gradient: ThemeColor.linerColorReverse,
                          boxShadow: [
                            BoxShadow(
                                color: ThemeColor.colorGrey,
                                blurRadius: 7,
                                spreadRadius: 1,
                                offset: Offset(0, 2))
                          ]),
                      child: Icon(
                        Icons.add_outlined,
                        size: SizeConfig.screenHeight * 0.045,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
