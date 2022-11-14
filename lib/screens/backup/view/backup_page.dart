import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/app/router/route_name.dart';
import 'package:your_money/screens/backup/backup.dart';
import 'package:your_money/uitls/icons_assets.dart';
import 'package:your_money/uitls/size_config.dart';
import 'package:your_money/widget/icon_add_showbottomsheet.dart';

import 'package:your_money/widget/show_dialog.dart';

import '../../../app/locate/lang_code.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/drop_down_btn.dart';
import '../../../widget/text_header1.dart';
import '../../../widget/text_header3.dart';
import '../components/card_backup.dart';
import '../components/dialog_acceppt.dart';
import '../components/save_data_cloud.dart';

class BackupPage extends StatelessWidget {
  const BackupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double turns = 0.0;
    bool onClick = false;
    return Scaffold(
      backgroundColor: ThemeColorDarkLight.color.backgroundScaffold,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home, color: Colors.white,size: 35,),
          onPressed: () => Navigator.pushNamed(context, RouteName.initial,arguments: ""),
        ),
        centerTitle: true,
        title:  TextHeader1(
          text: AppLang.lang(LangCode.backup),
          colorText: ThemeColor.colorWhile,
        ),
        elevation: 0,
        actions: [
          Row(
            children: [
              StatefulBuilder(
                builder: (context, setState2) {
                  return ElevatedButton(
                    onPressed: (){
                      if(onClick == false){
                        onClick = true;
                        setState2((){
                          turns += 3.0 / 2.0;
                        });
                      }

                    },
                    style: ElevatedButton.styleFrom(
                      padding:  EdgeInsets.zero,
                      onPrimary: ThemeColor.colorOrange,
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: const CircleBorder(),
                    ),
                    child: AnimatedRotation(
                      duration: const Duration(seconds: 3),
                      turns: turns,
                      onEnd: () {
                          onClick = false;
                          context.read<BackupCubit>().reloadListBackup();
                      },
                      child: Icon(
                        Icons.change_circle_rounded,
                        size: SizeConfig.screenHeight * 0.05,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
          child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextHeader3(text: AppLang.lang(LangCode.backupList)),
                    DropDownBtn(
                      listItemDrop: [
                        AppLang.lang(LangCode.date),
                        AppLang.lang(LangCode.ascending),
                        AppLang.lang(LangCode.descending)
                      ],
                      indexSelected: (int index) {
                        context.read<BackupCubit>().sortList(index);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: BlocBuilder<BackupCubit, BackupState>(
                buildWhen: (previous, current) =>
                    previous.logged != current.logged,
                builder: (context, state) {
                  if (state.logged) {
                    return BlocBuilder<BackupCubit, BackupState>(
                      buildWhen: (previous, current) =>
                      current.reload == BackupReload.listBackup,
                      builder: (context, state) {
                        return ListView.builder(
                            itemCount: state.listBackup.length,
                            itemBuilder: (context, index) {
                              return CardBackup(
                                backupData: state.listBackup[index],
                                onPressDelete: (){
                                  context.read<BackupCubit>().deleteBackup(state.listBackup[index]);
                                },
                                onPressAccept: (){
                                  ShowDialogWidget.openDialogDefault(context: context, child: DialogAccept(
                                    backupData: state.listBackup[index],
                                  ));
                                },
                              );
                            });
                      },
                    );
                  }
                  return Center(
                      child: Container(
                    height: SizeConfig.screenHeight * 0.09,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: ThemeColorDarkLight.color.backgroundItem,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<BackupCubit>().logInWithGoogle();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        onPrimary: ThemeColor.colorBlueLight,
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              IconsAssets.google,
                              fit: BoxFit.contain,
                            ),
                            TextHeader3(
                              text: "Sign in with Google",
                              fontSize: SizeConfig.screenHeight * 0.025,
                            ),
                            const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ));
                },
              )),
            ],
          ),
          Positioned(
            bottom: SizeConfig.screenHeight * 0.05,
            right: SizeConfig.screenHeight * 0.03,
            child: SizedBox(
                height: SizeConfig.screenHeight * 0.07,
                width: SizeConfig.screenHeight * 0.07,
                child: IconAddShowBottomSheet(
                  onPress: () {
                    ShowDialogWidget.openDialogDefault(
                        context: context, child: const SaveDataCloud());
                  },
                  iconWidget: ImageIcon(
                    const AssetImage(IconsAssets.backup),
                    color: ThemeColor.colorWhile,
                    size: SizeConfig.screenHeight * 0.045,
                  ),
                )),
          )
        ],
      )),
    );
  }
}

