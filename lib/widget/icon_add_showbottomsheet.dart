import 'package:flutter/material.dart';
import 'package:your_money/widget/show_bottom_sheet.dart';

import '../screens/add_expenses/add_expenses_page.dart';
import '../uitls/theme_color.dart';

class IconAddShowBottomSheet extends StatelessWidget {
  const IconAddShowBottomSheet({Key? key, this.onPress}) : super(key: key);

  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress??(){
        ShowBottomSheetClass.showBottomDefault(
          context: context,
          child: const AddExpensesPage(),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            gradient: ThemeColor.linerColorReverse,
            boxShadow: [
              BoxShadow(
                  color: ThemeColor.colorGrey,
                  blurRadius: 7,
                  spreadRadius: 1,
                  offset: Offset(0, 2))
            ]),
        child: const Icon(
          Icons.add_outlined,
          size: 45,
          color: Colors.white,
        ),
      ),
    );
  }
}
