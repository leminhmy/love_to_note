import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/drawer_home/drawer_home.dart';

import '../../../uitls/image_assets.dart';
import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/icon_circle_btn.dart';
import '../../../widget/show_dialog.dart';
import '../../../widget/text_header1.dart';
import '../../../widget/text_header3.dart';

class CardItemDrawerDemo extends StatelessWidget {
  const CardItemDrawerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color selectedColorBg = ThemeColor.colorRed;
    Color selectedColorIcon = ThemeColor.colorRed;
    return Container(
      height: SizeConfig.screenHeight * 0.1,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: ThemeColor.colorWhile,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          BlocBuilder<DrawerHomeCubit, DrawerHomeState>(
            buildWhen: (previous, current) =>
                current.addItemReload == AddItemDrawerHomeReload.color,
            builder: (context, state) {
              return IconCircleBtn(
                color: state.itemDrawer!.colorBg,
                onLongPress: () {
                  ShowDialogWidget.openDialogColorPicker(
                      label: "Set Color Background",
                      context: context,
                      colorPicker: (value) {
                        selectedColorBg = value;
                      }).then((value) {
                    context.read<DrawerHomeCubit>().editColorBg(selectedColorBg);
                  });
                },
                onPress: () {
                  ShowDialogWidget.openDialogColorPicker(
                      label: "Set Color Icon",
                      context: context,
                      colorPicker: (value) {
                        selectedColorIcon = value;
                      }).then((value) {
                    context.read<DrawerHomeCubit>().editColorIcon(selectedColorIcon);
                  });
                },
                size: SizeConfig.screenHeight * 0.07,
                icon: BlocBuilder<DrawerHomeCubit, DrawerHomeState>(
                  buildWhen: (previous, current) =>
                      current.addItemReload == AddItemDrawerHomeReload.image,
                  builder: (context, state) {
                    if (state.itemDrawer!.imageLocal != "") {
                      return CircleAvatar(
                          minRadius: SizeConfig.screenHeight * 0.06,
                          backgroundImage:
                              FileImage(File(state.itemDrawer!.imageLocal)));
                    } else {
                      return ImageIcon(
                        AssetImage(state.itemDrawer!.image.isNotEmpty
                            ? state.itemDrawer!.image
                            : ImageAssets.noImage),
                        size: SizeConfig.screenHeight * 0.05,
                        color: state.itemDrawer!.colorIcon,
                      );
                    }
                  },
                ),
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
          BlocBuilder<DrawerHomeCubit, DrawerHomeState>(
            buildWhen: (previous, current) =>
                current.addItemReload == AddItemDrawerHomeReload.name,
            builder: (context, state) {
              return TextHeader1(
                text: state.itemDrawer!.name,
                fontSize: SizeConfig.screenHeight * 0.02,
                colorText: ThemeColor.colorBlack2,
              );
            },
          ),
          const Spacer(),
          const TextHeader3(
            text: "Empty",
          ),
        ],
      ),
    );
  }
}
