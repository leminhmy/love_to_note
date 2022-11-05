import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/models/item_menu.dart';
import 'package:your_money/screens/select_item_menu/select_item_menu.dart';

class SelectItemMenuView extends StatelessWidget {
  const SelectItemMenuView({Key? key, required this.indexItemMenu}) : super(key: key);
  final int indexItemMenu;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SelectItemMenuCubit(indexItemMenu: indexItemMenu)..loadingItemMenu(),
      child: const SelectItemMenuPage(),
    );
  }
}
