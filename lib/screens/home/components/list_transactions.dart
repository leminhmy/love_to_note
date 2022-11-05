import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/models/expenses.dart';
import 'package:your_money/screens/detail_item_food/view/detail_item_food_page.dart';
import 'package:your_money/screens/home/home.dart';

import '../../../app/router/route_name.dart';
import '../../../uitls/size_config.dart';
import '../../../widget/text_header1.dart';
import '../../../widget/text_header3.dart';
import '../../../widget/card_transactions.dart';

class ListTransactions extends StatelessWidget {
  const ListTransactions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(SizeConfig.screenHeight * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TextHeader1(
                  text: "Transactions",
                ),
                TextHeader3(
                  text: "View All",
                )
              ],
            ),
          ),

          Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.listItemExpenses.length,
                    itemBuilder: (context, index) =>
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.detailItemFood,
                                  arguments: index);
                            },
                            child: CardTransactions(itemExpenses: state.listItemExpenses[index],)),
                  );
                },
              )),
        ],
      ),
    );
  }
}
