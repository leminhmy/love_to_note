import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/add_item_food/add_expenses.dart';
import 'package:your_money/screens/transactions/cubit/income_transaction__cubit.dart';
import 'package:your_money/uitls/image_assets.dart';
import 'package:your_money/uitls/size_config.dart';
import 'package:your_money/widget/icon_circle_btn.dart';
import 'package:your_money/widget/show_dialog.dart';

import '../../../../app/locate/lang_code.dart';
import '../../../../uitls/app_format.dart';
import '../../../../uitls/theme_color.dart';
import '../../../../widget/text_header1.dart';
import '../../../../widget/text_header3.dart';


class CardDemoItemIncome extends StatelessWidget {
  const CardDemoItemIncome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color selectedColorBg = ThemeColor.colorRed;
    Color selectedColorIcon = ThemeColor.colorRed;
    return Container(
      height: SizeConfig.screenHeight * 0.1,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: ThemeColorDarkLight.color.backgroundItem,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          BlocBuilder<IncomeTransactionCubit, IncomeTransactionState>(
            buildWhen: (previous, current) =>
            current.reload == AddIncomeTransactionReload.color,
            builder: (context, state) {
              return IconCircleBtn(
                color: state.itemFood.colorBg,
                onLongPress: () {
                  ShowDialogWidget.openDialogColorPicker(label: "Set Color Background",context:  context,colorPicker:  (value) {
                    selectedColorBg = value;
                  }).then((value) {
                      context.read<AddItemFoodCubit>().editColorBg(selectedColorBg);
                  });
                },
                onPress: () {
                  ShowDialogWidget.openDialogColorPicker(label: "Set Color Icon",context:  context,colorPicker:  (value) {
                    selectedColorIcon = value;
                  }).then((value) {
                    context.read<AddItemFoodCubit>().editColorIcon(selectedColorIcon);
                  });
                },
                size: SizeConfig.screenHeight * 0.07,
                icon: BlocBuilder<IncomeTransactionCubit, IncomeTransactionState>(
                  buildWhen: (previous, current) =>
                  current.reload == AddIncomeTransactionReload.image,
                  builder: (context, state) {
                    if (state.itemFood.imageLocal != "") {
                      return CircleAvatar(

                          minRadius: SizeConfig.screenHeight * 0.06,
                          backgroundImage: FileImage(File(state.itemFood.imageLocal)));
                    } else {
                      return ImageIcon(
                        AssetImage(state.itemFood.image.isNotEmpty?state.itemFood.image:ImageAssets.noImage),
                        size: SizeConfig.screenHeight * 0.05,
                        color: state.itemFood.colorIcon,
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
          BlocBuilder<IncomeTransactionCubit, IncomeTransactionState>(
            buildWhen: (previous, current) =>
            current.reload == AddIncomeTransactionReload.name,
            builder: (context, state) {
              return TextHeader1(
                text: state.itemFood.name,
                fontSize: SizeConfig.screenHeight * 0.02,
                colorText: ThemeColor.colorBlack2,
              );
            },
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<IncomeTransactionCubit, IncomeTransactionState>(
                buildWhen: (previous, current) =>
                current.reload == AddIncomeTransactionReload.price,
                builder: (context, state) {
                  return TextHeader3(
                    text: AppLang.formatPrice(state.itemFood.price),
                  );
                },
              ),
              BlocBuilder<IncomeTransactionCubit, IncomeTransactionState>(
                buildWhen: (previous, current) =>
                current.reload == AddIncomeTransactionReload.quantity,
                builder: (context, state) {
                  return TextHeader3(
                    text: "${AppLang.lang(LangCode.quantity)}: ${state.itemFood.quantity}",
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
