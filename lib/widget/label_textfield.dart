import 'package:flutter/material.dart';
import 'package:your_money/widget/text_header3.dart';

import '../uitls/theme_color.dart';

class LabelTextField extends StatelessWidget {
  const LabelTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
            width: 100,
            child: TextHeader3(text: "Name",)),
        const SizedBox(width: 10,),
        Expanded(
          child: TextFormField(
            autofocus: false,
            textInputAction: TextInputAction.done,
            maxLines: 1,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: "Enter name...",
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: ThemeColor.colorBlueGreen,
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: ThemeColor.colorGrey,

                    )
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
            ),
          ),
        )
      ],
    );
  }
}
