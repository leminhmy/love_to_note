import 'package:flutter/material.dart';

class ShowBottomSheetClass {

  static Future showBottomDefault(
      {required BuildContext context, required Widget child}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
        context: context, builder: (contextDialog) {
      return FractionallySizedBox(
        heightFactor: 0.8,
          child: child);

    });
  }


}