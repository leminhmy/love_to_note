import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/uitls/icons_assets.dart';
import 'package:your_money/uitls/theme_color.dart';

import 'package:your_money/widget/icon_border_btn.dart';
import 'package:your_money/widget/text_header1.dart';

import '../../../app/router/route_name.dart';
import '../../../uitls/size_config.dart';

import '../components/swich_button_transactions.dart';
import '../cubit/expenses_transaction_cubit.dart';
import 'expenses_transaction_page.dart';
import 'income_transaction_page.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.colorBackgroundWhile,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  IconBorderBtn(
                    onPress: () => Navigator.pushNamed(context, RouteName.initial,arguments: ""),
                    icon: Icon(
                      Icons.arrow_circle_left,
                      color: ThemeColor.colorGrey,
                      size: SizeConfig.screenHeight * 0.03,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.screenHeight * 0.02,
                  ),
                  TextHeader1(
                    text: "Transactions",
                    fontSize: SizeConfig.screenHeight * 0.03,
                  ),
                  const Spacer(),
                  const IconBorderBtn(
                      icon: ImageIcon(
                    AssetImage(IconsAssets.control),
                    color: ThemeColor.colorGrey,
                  ))
                ],
              ),
            ),
            SizedBox(
                height: SizeConfig.screenHeight * 0.08,
                child: SwitchButton(
                  indexSelected: (int index){
                    _tabController.animateTo(index);
                    if(index == 1){
                      context.read<ExpensesTransactionCubit>().reloadChart();

                    }
                  },
                )),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController, children: const [
                IncomeTransactionPage(),
                ExpensesTransactionPage(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
