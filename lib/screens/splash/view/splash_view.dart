import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/app/locate/lang_code.dart';
import 'package:your_money/app/locate/locate_config.dart';
import 'package:your_money/data/storage/storage.dart';
import 'package:your_money/repository/repository_menu.dart';
import 'package:your_money/screens/splash/cubit/splash_cubit.dart';
import 'package:your_money/screens/splash/view/splash_page.dart';

import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    StorageSecure.getAllData();
    return BlocProvider<SplashCubit>(
      create: (BuildContext context) => SplashCubit(),
      child: const SplashPage(),
    );
  }
}
