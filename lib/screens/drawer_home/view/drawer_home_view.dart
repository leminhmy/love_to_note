import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/drawer_home/drawer_home.dart';

import '../../../app/locate/lang_code.dart';
import '../../../widget/show_snack.dart';
import 'drawer_home_page.dart';

class DrawerHomeView extends StatelessWidget {
  const DrawerHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DrawerHomeCubit, DrawerHomeState>(
        listener: (context, state) {
          if(state.addItemDialog == AddItemDrawerHomeDialog.error){
            ShowSnackCustom.showFlushBar(context: context,isError: true,text: state.messError);
          }
          if(state.addItemDialog == AddItemDrawerHomeDialog.success){
            ShowSnackCustom.showFlushBar(context: context,isError: false,text: AppLang.lang(LangCode.addSuccess));
          }
        },
        child: const DrawerHomePage());
  }
}
