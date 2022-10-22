import 'package:flutter/material.dart';
import 'package:your_money/widget/text_header3.dart';

import '../uitls/theme_color.dart';

class TextFieldBorder extends StatelessWidget {
  const TextFieldBorder({
    Key? key, required this.textHint, required this.icon,
  }) : super(key: key);

  final String? textHint;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      textInputAction: TextInputAction.done,
      maxLines: 1,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        prefixIcon: icon,
          hintText: textHint,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2.0,
                color: ThemeColor.colorBlueGreen,
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2.0,
                color: ThemeColor.colorGrey,

              )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );
  }
}
