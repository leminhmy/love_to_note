import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/models/backup_data.dart';
import 'package:your_money/screens/drawer_home/drawer_home.dart';

import '../../../app/locate/lang_code.dart';
import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/text_header1.dart';
import '../../../widget/text_header3.dart';
import '../cubit/backup_cubit.dart';

class DialogAccept extends StatefulWidget {
  const DialogAccept({
    Key? key, required this.backupData,
  }) : super(key: key);

  final BackupData backupData;

  @override
  State<DialogAccept> createState() => _DialogAcceptState();
}

class _DialogAcceptState extends State<DialogAccept> {
  double turns = 0.0;
  bool onClick = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.15,
          width: SizeConfig.screenWidth *0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Icon(Icons.warning_outlined,color: Colors.yellow,),
                    const SizedBox(width: 5,),
                    TextHeader3(text: "${AppLang.lang(LangCode.recommend)}: ${AppLang.lang(LangCode.backupCurrentVersion)}"),
                  ]
              ),
              TextHeader1(text: AppLang.lang(LangCode.recoveryBackup)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child:  TextHeader3(
                        text: AppLang.lang(LangCode.cancel),
                        colorText: ThemeColor.colorWhile,
                      )),
                  ElevatedButton(
                      onPressed: (){
                        if(onClick == false){
                          context.read<BackupCubit>().recoveryBackup(widget.backupData);

                          onClick = true;
                          setState((){
                            turns += 3.0 / 2.0;
                          });
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        primary: ThemeColor.colorGreen,
                      ),
                      child:  TextHeader3(
                        text: AppLang.lang(LangCode.accept),
                        colorText: ThemeColor.colorWhile,
                      )),
                ],
              )
            ],
          ),
        ),
        AnimatedRotation(
          duration: const Duration(seconds: 3),
          turns: turns,
          onEnd: () {
            context.read<DrawerHomeCubit>().reloadData();
          },
          child: Icon(
            Icons.change_circle_rounded,
            size: SizeConfig.screenHeight * 0.06,
            color: onClick?ThemeColorDarkLight.color.text:Colors.transparent,
          ),
        ),
      ],
    );
  }
}
