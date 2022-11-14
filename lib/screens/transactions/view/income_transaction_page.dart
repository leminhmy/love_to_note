import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/models/item_food.dart';
import 'package:your_money/screens/transactions/view/add_item_income_transaction.dart';
import 'package:your_money/screens/transactions/cubit/income_transaction__cubit.dart';
import 'package:your_money/uitls/app_format.dart';
import 'package:your_money/widget/card_item_food.dart';
import 'package:your_money/widget/show_bottom_sheet.dart';
import 'package:your_money/widget/show_dialog.dart';

import '../../../app/locate/lang_code.dart';
import '../../../uitls/icons_assets.dart';
import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/icon_add_showbottomsheet.dart';
import '../../../widget/show_snack.dart';
import '../../../widget/text_header1.dart';
import '../../../widget/text_header3.dart';
import '../../../widget/drop_down_btn.dart';

class IncomeTransactionPage extends StatelessWidget {
  const IncomeTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<IncomeTransactionCubit, IncomeTransactionState>(
      listener: (context, state) {
        if (state.showDialog == AddIncomeTransactionDialog.error) {
          ShowSnackCustom.showFlushBar(
              context: context, isError: true, text: state.messError);
        }
        if (state.showDialog == AddIncomeTransactionDialog.success) {
          ShowSnackCustom.showFlushBar(
              context: context, isError: false, text: AppLang.lang(LangCode.addSuccess));
        }
      },
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     TextHeader3(text: AppLang.lang(LangCode.allIncome)),
                    DropDownBtn(
                      listItemDrop: [AppLang.lang(LangCode.date), AppLang.lang(LangCode.ascending), AppLang.lang(LangCode.descending)],
                      indexSelected: (int index) {
                        context.read<IncomeTransactionCubit>().sortList(index);
                      },
                    ),
                  ],
                ),
              ),
              ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) =>
                      ThemeColor.linerColorOrangeRed.createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                  child: BlocBuilder<IncomeTransactionCubit,
                      IncomeTransactionState>(
                    buildWhen: (previous, current) =>
                    current.reload ==
                        AddIncomeTransactionReload.totalPrice,
                    builder: (context, state) {
                      return TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0,end: 1),
                        duration: const Duration(seconds: 1),
                        child: const SizedBox(),
                        builder: (context, double value, child) {
                          return TextHeader1(
                            text: AppLang.formatPrice(state.totalPrice * value),
                          );
                        }

                      );
                    },
                  )),
              Expanded(
                child:
                    BlocBuilder<IncomeTransactionCubit, IncomeTransactionState>(
                  buildWhen: (previous, current) =>
                      current.reload ==
                      AddIncomeTransactionReload.listItemInCome,
                  builder: (context, state) {
                    return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.listItemIncome.length,
                        itemBuilder: (context, index) {
                          int checkQuantity =
                              state.listItemIncome[index].quantity;
                          return CardItemFood(
                              subWidget: TextHeader3(
                                text: checkQuantity > 1
                                    ? "Quantity $checkQuantity"
                                    : "",
                              ),
                              item: state.listItemIncome[index],
                              onPressDelete: () {
                                context
                                    .read<IncomeTransactionCubit>()
                                    .deleteItemIncome(
                                        state.listItemIncome[index]);
                              });
                        });
                  },
                ),
              )
            ],
          ),
          Align(
            alignment: const Alignment(0.8, 0.8),
            child: SizedBox(
              height: SizeConfig.screenHeight * 0.07,
              width: SizeConfig.screenHeight * 0.07,
              child: IconAddShowBottomSheet(
                iconWidget: const Padding(
                  padding: EdgeInsets.all(15),
                  child: ImageIcon(
                    AssetImage(IconsAssets.add),
                    color: Colors.white,
                  ),
                ),
                onPress: () {
                  ShowBottomSheetClass.showBottomDefault(
                          context: context,
                          child: const AddItemIncomeTransaction())
                      .then((value) {
                    context
                        .read<IncomeTransactionCubit>()
                        .reloadListItemIncome();
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
