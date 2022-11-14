import 'package:flutter/material.dart';
import 'package:your_money/uitls/app_format.dart';
import 'package:your_money/uitls/keyborad_visibility_builder.dart';
import 'package:your_money/widget/text_header3.dart';
import '../app/locate/lang_code.dart';
import '../uitls/size_config.dart';
import '../uitls/theme_color.dart';

class LabelTextField extends StatelessWidget {
  const LabelTextField({
    Key? key,
    this.textEditingController, this.label, this.textInputType, this.hintTextField, required this.valueUnFocus,
  }) : super(key: key);
  final String? label;
  final String? hintTextField;
  final TextInputType? textInputType;
  final ValueChanged<String?> valueUnFocus;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    String textOnChange = "";
    return KeyboardVisibilityBuilder(
      builder: (context, child, isKeyboardVisible) {
        if (isKeyboardVisible) {
          print("open keyborad");
        } else {
          FocusManager.instance.primaryFocus?.unfocus();
          valueUnFocus(textOnChange);
        }
        return child;
      },
      child: Row(
        children: [
          SizedBox(
              width: SizeConfig.screenHeight * 0.1,
              child:  TextHeader3(
                text: label??AppLang.lang(LangCode.name),
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              autofocus: false,
              textInputAction: TextInputAction.done,
              maxLines: 1,
              style: TextStyle(color: ThemeColorDarkLight.color.text,fontWeight: FontWeight.w700),
              controller: textEditingController,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: textInputType??TextInputType.multiline,
              onChanged: (String text){
                textOnChange = text.replaceAll('.', '');
                if(textInputType == TextInputType.number && text.isNotEmpty){
                  textEditingController?.value = AppFormat.formatNumberTextField(text);
                }
              },
              decoration: InputDecoration(
                  hintText: hintTextField??"Enter ${AppLang.lang(LangCode.name)}...",
                  hintStyle: TextStyle(color: ThemeColorDarkLight.color.text),

                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: ThemeColor.colorBlueGreen,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: ThemeColor.colorGrey,
                      )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
