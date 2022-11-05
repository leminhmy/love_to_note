import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:your_money/uitls/size_config.dart';
import 'package:your_money/uitls/theme_color.dart';
import 'package:your_money/widget/text_header1.dart';
import 'package:your_money/widget/text_header3.dart';


class ShowSnackCustom {


  static showSnackCustom(
      {required BuildContext context,
        bool isError = false,
        String? text}) {
    Size size = SizeConfig.size;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: ClipRRect(
          borderRadius: BorderRadius.circular(size.height * 0.03),
          child: SizedBox(
            height: size.height * 0.07,
            child: ColoredBox(
              color: ThemeColor.colorBlue.withOpacity(0.7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isError
                      ? Icon(
                    Icons.error,
                    color: Colors.red,
                    size: size.height * 0.03,
                  )
                      : Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: size.height * 0.03,
                  ),
                  TextHeader1(text: text ?? "Add Success",colorText: ThemeColor.colorWhile,),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ),
    );
  }

  static showFlushBar({required BuildContext context, String? text, bool isError = false}){
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(8),
      messageText: Row(
        children: [
          isError?
          Icon(Icons.info_outline,color: ThemeColor.colorBlueLight,size: SizeConfig.screenHeight * 0.03,):
          Icon(Icons.check_circle,color: ThemeColor.colorGreen,size: SizeConfig.screenHeight * 0.03,),
          const SizedBox(width: 10,),
          TextHeader3(text: text??"Error",colorText: ThemeColor.colorWhile,),
        ],
      ),
      duration: const Duration(seconds: 3),
      borderRadius: BorderRadius.circular(8),
    ).show(context);
  }

}