import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/add_item_food/view/add_item_food_page.dart';

import '../../../widget/show_snack.dart';
import '../cubit/add_item_food_cubit.dart';


class AddItemFoodView extends StatelessWidget {
  const AddItemFoodView({Key? key, required this.nameCategory, required this.indexCategory}) : super(key: key);

  final String nameCategory;
  final int indexCategory;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddItemFoodCubit>(
        create: (BuildContext context) => AddItemFoodCubit(indexCategory: indexCategory),
      child:  BlocListener<AddItemFoodCubit,AddItemFoodState>(
          listener: (context, state) {
           if(state.showDialog == AddItemFoodDialog.error){
             ShowSnackCustom.showFlushBar(context: context,isError: true,text: state.messError);
           }
           if(state.showDialog == AddItemFoodDialog.success){
             ShowSnackCustom.showFlushBar(context: context,isError: false,text: "Add Success");
           }
          },
          child: AddItemFoodPage(nameCategory: nameCategory)),
    );
  }
}
