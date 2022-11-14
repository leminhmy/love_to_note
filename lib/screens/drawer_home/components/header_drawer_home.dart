import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/locate/lang_code.dart';
import '../../../repository/repository_auth.dart';
import '../../../uitls/icons_assets.dart';
import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/icon_add_showbottomsheet.dart';
import '../../../widget/icon_circle_btn.dart';
import '../../../widget/show_bottom_sheet.dart';
import '../../../widget/text_header1.dart';
import '../../../widget/text_header3.dart';
import '../cubit/drawer_home_cubit.dart';
import 'add_item_drawer.dart';

class HeaderDrawerHome extends StatelessWidget {
  const HeaderDrawerHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * 0.24,
      child: DrawerHeader(
        padding: EdgeInsets.all(SizeConfig.screenHeight * 0.02),
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ThemeColorDarkLight.color.image),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<DrawerHomeCubit, DrawerHomeState>(
                      buildWhen: (previous, current) => previous.logged != current.logged,
                      builder: (context, state) {
                        if (state.logged == false) {
                          return Container(
                            height: SizeConfig.screenHeight * 0.06,
                            decoration: BoxDecoration(
                              color: ThemeColorDarkLight
                                  .color.backgroundItem,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<DrawerHomeCubit>().logInWithGoogle();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                onPrimary: ThemeColor.colorBlueLight,
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(IconsAssets.google,
                                      fit: BoxFit.contain,
                                      height: SizeConfig.screenHeight *
                                          0.030),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const TextHeader3(
                                    text: "Sign in with Google",
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: SizeConfig.screenHeight * 0.08,
                                  width: SizeConfig.screenHeight * 0.08,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(File(state.currentUser.image)),
                                    ),
                                  ),
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
                                    TextHeader1(
                                        text:
                                        state.currentUser.name),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.06,
                              child: ElevatedButton(
                                onPressed: (){
                                    context.read<DrawerHomeCubit>().signOut();
                                },
                                style: ElevatedButton.styleFrom(
                                  padding:  EdgeInsets.zero,
                                  onPrimary: ThemeColor.colorBlueLight,
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: const CircleBorder(),
                                ),
                                child: Icon(
                                  Icons.logout,
                                  color: ThemeColorDarkLight.color.text,
                                ),
                              ),
                            ),

                          ],
                        );
                      },
                    ),
                    TextHeader3(text: AppLang.lang(LangCode.manageList)),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                  width: SizeConfig.screenHeight * 0.08,
                  child: IconAddShowBottomSheet(
                    onPress: () {
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
          ],
        ),
      ),
    );
  }
}
