import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/detail_item_food/cubit/detail_item_food_cubit.dart';


import '../../../uitls/theme_color.dart';

class TabControllerWidget extends StatefulWidget {
  const TabControllerWidget({Key? key}) : super(key: key);

  @override
  State<TabControllerWidget> createState() => _TabControllerWidgetState();
}

class _TabControllerWidgetState extends State<TabControllerWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailItemFoodCubit, DetailItemFoodState>(
      buildWhen: (previous, current) => false,
      builder: (context, state) {
        _tabController = TabController(
            length: state.listItemExpenses.length, vsync: this,initialIndex: state.indexListExpenses);
        return Column(
          children: [
            TabBar(
                padding: const EdgeInsets.all(20),
                controller: _tabController,
                labelColor: ThemeColor.colorBlack,
                indicatorColor: ThemeColor.colorOrangeBasic,
                unselectedLabelColor: ThemeColor.colorGrey,
                onTap: (index){
                    context.read<DetailItemFoodCubit>().tabChange(index);
                },
                labelStyle:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                unselectedLabelStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                isScrollable: true,
                tabs: List.generate(
                    state.listItemExpenses.length,
                    (index) => Tab(
                          text: state.listItemExpenses[index].name,
                        ))),
          ],
        );
      },
    );
  }
}
