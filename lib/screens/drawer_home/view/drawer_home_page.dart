import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/app/router/route_name.dart';
import 'package:your_money/models/expenses.dart';
import 'package:your_money/models/item_expenses.dart';
import 'package:your_money/screens/drawer_home/components/add_item_drawer.dart';
import 'package:your_money/screens/drawer_home/drawer_home.dart';
import 'package:your_money/uitls/size_config.dart';
import 'package:your_money/widget/text_header1.dart';
import 'package:your_money/widget/text_header3.dart';

import '../../../models/item_menu.dart';
import '../../../uitls/image_assets.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/card_note_drawer.dart';
import '../../../widget/icon_add_showbottomsheet.dart';
import '../../../widget/show_bottom_sheet.dart';


class DrawerHomePage extends StatelessWidget {
  const DrawerHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: SizeConfig.screenWidth * 0.8,
      backgroundColor: ThemeColor.colorBackgroundWhile,
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.25,
            child: DrawerHeader(
              padding: EdgeInsets.all(SizeConfig.screenHeight * 0.02),
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageAssets.imageBg),
                      fit: BoxFit.cover)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: SizeConfig.screenHeight * 0.08,
                        width: SizeConfig.screenHeight * 0.08,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  ImageAssets.imageBgPerson,
                                ))),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: SizeConfig.screenHeight * 0.03,
                            color: ThemeColor.colorGrey,
                          ),
                          const TextHeader1(text: "Name Person"),
                        ],
                      ),
                      const TextHeader3(text: "Danh Sách Lưu Trữ "),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.08,
                    width: SizeConfig.screenHeight * 0.08,
                    child:  IconAddShowBottomSheet(
                      onPress: (){
                        ShowBottomSheetClass.showBottomDefault(
                          context: context,
                          child: const AddItemDrawer(),
                        ).then((value) {
                              context.read<DrawerHomeCubit>().reloadListMenu();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  BlocBuilder<DrawerHomeCubit, DrawerHomeState>(
                    buildWhen: (previous, current) => current.reload == DrawerHomeReload.listMenu,
                    builder: (context, state) {
                      List<ItemMenuModel> listItemMenu = state.listItemMenu;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                          itemCount: listItemMenu.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, RouteName.selectItemMenu,arguments: index);
                                },
                                child: CardNoteDrawer(itemMenu: listItemMenu[index],));
                          });
                    },
                  ),
                  Container(
                    height: 1,
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: const BoxDecoration(
                      color: ThemeColor.colorOrange,
                    ),
                  ),
                  const TextHeader3(text: "Transactions"),
                  BlocBuilder<DrawerHomeCubit, DrawerHomeState>(
                    buildWhen: (previous, current) => current.reload == DrawerHomeReload.listFood,
                    builder: (context, state) {
                      List<ItemMenuModel> listItemMenu = state.listItemExpenses.map((e) => ItemMenuModel.fromJson(e.toJson())).toList();
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: listItemMenu.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, RouteName.detailItemFood,arguments: index);
                                },
                                child: CardNoteDrawer(itemMenu: listItemMenu[index],
                                    category: "Item: ${state.listItemExpenses[index].listItem.length}",
                                ));
                          });
                    },
                  ),
                  Container(
                    height: 1,
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: const BoxDecoration(
                      color: ThemeColor.colorOrange,
                    ),
                  ),
                  const TextHeader3(text: "NoteMovie"),
                  BlocBuilder<DrawerHomeCubit, DrawerHomeState>(
                    buildWhen: (previous, current) => current.reload == DrawerHomeReload.listMovie,
                    builder: (context, state) {
                      List<ItemMenuModel> listItemMenu = state.listNoteMovie.map((e) => ItemMenuModel.fromJson(e.toJson())).toList();
                      print(listItemMenu.map((e) => e.toJson()));
                     return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: listItemMenu.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, RouteName.detailItemMovie,arguments: index);
                                },
                                child: CardNoteDrawer(itemMenu: listItemMenu[index],category: "Movie",));
                          });
                    },
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenHeight * 0.02,
                vertical: SizeConfig.screenHeight * 0.02),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.settings_suggest,
                      size: SizeConfig.screenHeight * 0.03,
                      color: ThemeColor.colorGrey,
                    ),
                    SizedBox(
                      width: SizeConfig.screenHeight * 0.02,
                    ),
                    const TextHeader3(
                      text: "Setting",
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.help,
                      size: SizeConfig.screenHeight * 0.03,
                      color: ThemeColor.colorGrey,
                    ),
                    SizedBox(
                      width: SizeConfig.screenHeight * 0.02,
                    ),
                    const TextHeader3(
                      text: "Help",
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
