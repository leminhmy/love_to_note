

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:your_money/uitls/size_config.dart';
import 'package:your_money/uitls/theme_color.dart';
import 'package:your_money/widget/text_header1.dart';

class ShowDialogWidget{

  static openDialogDefault({required BuildContext context, required Widget child}){
    return showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: ThemeColorDarkLight.color.backgroundItem,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: child,
        );
    });
  }



 static Future openDialogColorPicker(
     {required String label, required BuildContext context, required ValueChanged<Color> colorPicker}){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: SizedBox(
              height: SizeConfig.screenHeight * 0.7,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: TextHeader1(text: label),
                content: Column(
                  children: [
                    ColorPicker(pickerColor: Colors.red, onColorChanged: colorPicker),
                    TextButton(
                      child: const TextHeader1(
                        text: "SELECT",
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();

                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

}