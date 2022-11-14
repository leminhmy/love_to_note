import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/backup/backup.dart';
import 'package:your_money/screens/drawer_home/drawer_home.dart';
import 'package:your_money/screens/home/home.dart';

import '../../../app/locate/lang_code.dart';
import '../../../widget/show_snack.dart';

class BackupView extends StatefulWidget {
  const BackupView({Key? key}) : super(key: key);

  @override
  State<BackupView> createState() => _BackupViewState();
}

class _BackupViewState extends State<BackupView> with WidgetsBindingObserver{
  late final BackupCubit blocBackupCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    blocBackupCubit.saveBackupLocal();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();

  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
      //Execute the code here when user come back the app.
      //In my case, I needed to show if user active or not,
        break;
      case AppLifecycleState.paused:
      //Execute the code the when user leave the app
        blocBackupCubit.saveBackupLocal();
        break;

      default:
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    blocBackupCubit = BlocProvider.of<BackupCubit>(context);
    return BlocListener<BackupCubit, BackupState>(
        listener: (context, state) {
          if(state.showMess == BackupShowMess.messError){
            ShowSnackCustom.showFlushBar(context: context,isError: true,text: state.message);
          }
          if(state.showMess == BackupShowMess.messSuccess){
            ShowSnackCustom.showFlushBar(context: context,isError: false,text: AppLang.lang(LangCode.addSuccess));
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: const BackupPage());
  }
}
