import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/uitls/app_format.dart';
import 'package:your_money/widget/drop_down_btn.dart';
import 'package:your_money/screens/transactions/cubit/expenses_transaction_cubit.dart';
import 'package:your_money/widget/card_item_food.dart';

import '../../../app/locate/lang_code.dart';
import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/card_item_chart.dart';
import '../../../widget/card_transactions.dart';
import '../../../widget/text_header1.dart';
import '../../../widget/text_header3.dart';
import '../../../widget/text_header5.dart';

class ExpensesTransactionPage extends StatelessWidget {
  const ExpensesTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.4,
            margin: EdgeInsets.all(SizeConfig.screenHeight * 0.02),
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: ThemeColorDarkLight.color.backgroundItem,
                borderRadius:
                BorderRadius.circular(SizeConfig.screenHeight * 0.02)),
            child:
            BlocBuilder<ExpensesTransactionCubit, ExpensesTransactionState>(
              buildWhen: (previous, current) =>
              current.reload == ExpensesTransactionReload.chart,
              builder: (context, state) {
                print("reload chart ${state.totalPriceIncome}");
                List<String> listAxisVertical = AppLang.listValueStatistics(state.totalPriceIncome)..add("0");
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextHeader3(text: AppLang.lang(LangCode.statistical)),
                          const SizedBox(
                            height: 10,
                          ),
                          TextHeader1(
                            text: AppLang.formatPrice(state.totalPriceIncome),
                            fontSize: SizeConfig.screenHeight * 0.03,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: SizeConfig.screenHeight * 0.08,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: List.generate(
                                              5,
                                                  (index) => TextHeader5(
                                                text: listAxisVertical[index],
                                              ))),
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenHeight * 0.045,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: state.listValueChart.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      double percent = 0;
                                      if(state.listValueChart.isNotEmpty && state.totalPriceIncome > 0){
                                        percent = state.listValueChart[index]/state.totalPriceIncome*100;
                                      }

                                      return CardItemChart(index: index, percent: percent,);
                                    }),
                            )],
                        )),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<ExpensesTransactionCubit, ExpensesTransactionState>(
                  buildWhen: (previous, current) => false,
                  builder: (context, state) {
                    return DropDownBtn(
                        listItemDrop: [
                          AppLang.lang(LangCode.allExpenses),
                          ...state.listNameItemExpenses
                        ],
                        indexSelected: (int index) {
                          context
                              .read<ExpensesTransactionCubit>()
                              .changeListExpenses(index);
                        });
                  },
                ),
                BlocBuilder<ExpensesTransactionCubit, ExpensesTransactionState>(
                    buildWhen: (previous, current) =>
                    current.reload == ExpensesTransactionReload.totalPrice,
                    builder: (context, state) {
                      return TextHeader3(
                          text:
                          "-${AppLang.formatPrice(state.totalPrice)}",
                          colorText: ThemeColor.colorRed);
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<ExpensesTransactionCubit, ExpensesTransactionState>(
            buildWhen: (previous, current) =>
            current.reload == ExpensesTransactionReload.listItem,
            builder: (context, state) {
              if (state.isListAll) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.listItemExpenses.length,
                  itemBuilder: (context, index) => CardTransactions(
                    disableBtnDelete: true,
                    itemExpenses: state.listItemExpenses[index],
                  ),
                );
              } else {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.listItemFood.length,
                  itemBuilder: (context, index) => CardItemFood(
                    disableBtnDelete: true,
                    item: state.listItemFood[index],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
