import 'package:flutter/material.dart';

class ShowBottomSheetClass {

  static showBottomDefault(
      {required BuildContext context, required Widget child}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
        context: context, builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.8,
          child: child);

    });
  }


}