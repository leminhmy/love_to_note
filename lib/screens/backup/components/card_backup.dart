import 'package:flutter/material.dart';
import 'package:your_money/models/backup_data.dart';
import 'package:your_money/uitls/app_format.dart';

import '../../../app/locate/lang_code.dart';
import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/text_header3.dart';
import '../../../widget/text_header5.dart';

class CardBackup extends StatefulWidget {
  const CardBackup({
    Key? key, this.onPressAccept, this.onPressDelete, required this.backupData,
  }) : super(key: key);

  final VoidCallback? onPressAccept;
  final VoidCallback? onPressDelete;
  final BackupData backupData;

  @override
  State<CardBackup> createState() => _CardBackupState();
}

class _CardBackupState extends State<CardBackup> with SingleTickerProviderStateMixin {
  bool showPressDelete = false;
  late final AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            height: SizeConfig.screenHeight * 0.12 *(1-_controller.value),
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: ThemeColorDarkLight.color.backgroundItem,
                borderRadius: BorderRadius.circular(SizeConfig.screenHeight * 0.015)),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: SizeConfig.screenHeight * 0.10,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ElevatedButton(
                        onPressed: () {

                        },
                        onLongPress: (){
                          showPressDelete = !showPressDelete;
                          setState(() {

                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          onPrimary: ThemeColor.colorBlueLight,
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: const SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_download,
                          color: ThemeColor.colorBlue,
                          size: SizeConfig.screenHeight * 0.06,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                TextHeader5(text: AppFormat.dateTime(widget.backupData.date)),
                                TextHeader3(
                                  text: widget.backupData.name,
                                  maxLine: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        showPressDelete?ElevatedButton(
                            onPressed: () {
                              _controller.forward();
                              if(widget.onPressDelete != null){
                                widget.onPressDelete!();

                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            child: TextHeader3(
                              text: AppLang.lang(LangCode.delete),
                              colorText: ThemeColor.colorWhile,
                            )):ElevatedButton(

                            onPressed: (){
                              if(widget.onPressAccept != null){
                                widget.onPressAccept!();
                              }
                            },
                            child:  TextHeader3(
                              text: AppLang.lang(LangCode.accept),
                              colorText: ThemeColor.colorWhile,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
