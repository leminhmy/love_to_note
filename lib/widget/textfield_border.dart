import 'package:flutter/material.dart';
import 'package:your_money/uitls/size_config.dart';
import 'package:your_money/widget/text_header3.dart';

import '../uitls/theme_color.dart';

class TextFieldBorder extends StatelessWidget {
  const TextFieldBorder({
    Key? key, required this.textHint, required this.icon, this.onChanged,
  }) : super(key: key);

  final String? textHint;
  final Widget icon;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      textInputAction: TextInputAction.done,
      maxLines: 1,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.multiline,
      style: TextStyle(fontWeight: FontWeight.w700,color:  ThemeColorDarkLight.color.text,fontSize: SizeConfig.screenHeight * 0.02),
      decoration: InputDecoration(
        prefixIcon: icon,
          hintStyle: TextStyle(color: ThemeColorDarkLight.color.text),
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
