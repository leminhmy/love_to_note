import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/models/expenses.dart';
import 'package:your_money/screens/detail_item_food/cubit/detail_item_food_cubit.dart';
import 'package:your_money/screens/detail_item_food/view/detail_item_food_page.dart';

class DetailItemFoodView extends StatelessWidget {
  const DetailItemFoodView({Key? key, required this.indexItemExpenses})
      : super(key: key);

  final int indexItemExpenses;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailItemFoodCubit>(
      create: (BuildContext context) =>
          DetailItemFoodCubit(indexItem: indexItemExpenses)..loadingDetailItemFood(),
      child: const DetailItemFoodPage(),
    );
  }
}
