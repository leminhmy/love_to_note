import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/app/locate/lang_code.dart';
import 'package:your_money/app/locate/locate_config.dart';
import 'package:your_money/app/router/route_name.dart';
import 'package:your_money/models/expenses.dart';
import 'package:your_money/models/item_expenses.dart';
import 'package:your_money/screens/drawer_home/components/add_item_drawer.dart';
import 'package:your_money/screens/drawer_home/drawer_home.dart';
import 'package:your_money/uitls/size_config.dart';
import 'package:your_money/widget/icon_circle_btn.dart';
import 'package:your_money/widget/show_dialog.dart';
import 'package:your_money/widget/switch_btn_lang.dart';
import 'package:your_money/widget/text_header1.dart';
import 'package:your_money/widget/text_header3.dart';

import '../../../models/item_menu.dart';
import '../../../repository/repository_auth.dart';
import '../../../uitls/icons_assets.dart';
import '../../../uitls/image_assets.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/card_note_drawer.dart';
import '../../../widget/container_border_liner.dart';
import '../../../widget/icon_add_showbottomsheet.dart';
import '../../../widget/show_bottom_sheet.dart';
import '../../../widget/switch_btn_dark_light.dart';
import '../components/header_drawer_home.dart';

class DrawerHomePage extends StatelessWidget {
  const DrawerHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: SizeConfig.screenWidth * 0.8,
      backgroundColor: ThemeColorDarkLight.color.backgroundScaffold,
      child: Column(
        children: [
         const HeaderDrawerHome(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  BlocBuilder<DrawerHomeCubit, DrawerHomeState>(
                    buildWhen: (previous, current) =>
                        current.reload == DrawerHomeReload.listMenu,
                    builder: (context, state) {
                      List<ItemMenuModel> listItemMenu = state.listItemMenu;
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listItemMenu.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.selectItemMenu,
                                      arguments: index);
                                },
                                child: CardNoteDrawer(
                                  itemMenu: listItemMenu[index],
                                  onPressAcceptDelete: () {
                                    context
                                        .read<DrawerHomeCubit>()
                                        .deleteItemMenu(index);
                                  },
                                ));
                          });
                    },
                  ),
                  Container(
                    height: 1,
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: const BoxDecoration(
                      color: ThemeColor.colorOrange,
                    ),
                  ),
                  TextHeader3(text: AppLang.lang(LangCode.transactions)),
                  BlocBuilder<DrawerHomeCubit, DrawerHomeState>(
                    buildWhen: (previous, current) =>
                        current.reload == DrawerHomeReload.listFood,
                    builder: (context, state) {
                      List<ItemMenuModel> listItemExpenses = state
                          .listItemExpenses
                          .map((e) => ItemMenuModel.fromJson(e.toJson()))
                          .toList();
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: listItemExpenses.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.detailItemFood,
                                      arguments: index);
                                },
                                child: CardNoteDrawer(
                                  itemMenu: listItemExpenses[index],
                                  category:
                                      "Item: ${state.listItemExpenses[index].listItem.length}",
                                  onPressAcceptDelete: () {
                                    context
                                        .read<DrawerHomeCubit>()
                                        .deleteItemExpenses(index);
                                  },
                                ));
                          });
                    },
                  ),
                  Container(
                    height: 1,
                    width: double.maxFinite,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: const BoxDecoration(
                      color: ThemeColor.colorOrange,
                    ),
                  ),
                  TextHeader3(text: AppLang.lang(LangCode.noteMovie)),
                  BlocBuilder<DrawerHomeCubit, DrawerHomeState>(
                    buildWhen: (previous, current) =>
                        current.reload == DrawerHomeReload.listMovie,
                    builder: (context, state) {
                      print("reload list movie");
                      print(state.listNoteMovie.length);
                      List<ItemMenuModel> listNoteMovie = state.listNoteMovie
                          .map((e) => ItemMenuModel.fromJson(e.toJson()))
                          .toList();
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: listNoteMovie.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.detailItemMovie,
                                      arguments: index);
                                },
                                child: CardNoteDrawer(
                                  itemMenu: listNoteMovie[index],
                                  category: "Movie",
                                  onPressAcceptDelete: () {
                                    context
                                        .read<DrawerHomeCubit>()
                                        .deleteItemNoteMovie(index);
                                  },
                                ));
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    onPrimary: ThemeColor.colorBlueLight,
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.backup,
                        arguments: "");
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.backup_sharp,
                        size: SizeConfig.screenHeight * 0.03,
                        color: ThemeColor.colorBlue,
                      ),
                      SizedBox(
                        width: SizeConfig.screenHeight * 0.02,
                      ),
                      const TextHeader3(
                        text: "Backup",
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    onPrimary: ThemeColor.colorBlueLight,
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    ShowDialogWidget.openDialogDefault(
                        context: context,
                        child: SizedBox(
                          height: SizeConfig.screenHeight * 0.25,
                          width: SizeConfig.screenWidth * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TextHeader3(
                                text: "Language",
                                colorText: ThemeColor.colorGrey,
                              ),
                              SwitchBtnLang(
                                  value: LocaleConfig.keyLang == "vi"
                                      ? true
                                      : false,
                                  valueChanged: (String lang) {
                                    LocaleConfig().load(lang);
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              const TextHeader3(
                                text: "DarkMode",
                                colorText: ThemeColor.colorGrey,
                              ),
                              SwitchBtnDarkLight(
                                  value: ThemeColorDarkLight.isDarkThemeColor,
                                  valueChanged: (bool value) {
                                    ThemeColorDarkLight().changeTheme();
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight * 0.05,
                                width: SizeConfig.screenHeight * 0.15,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, RouteName.initial,
                                        arguments: "");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    onPrimary: ThemeColor.colorOrange,
                                  ),
                                  child: const TextHeader1(
                                    text: "Reset",
                                    colorText: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                  child: Row(
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
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    onPrimary: ThemeColor.colorBlueLight,
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {},
                  child: Row(
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

