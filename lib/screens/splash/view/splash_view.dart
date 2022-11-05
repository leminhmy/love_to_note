import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/repository/repository_menu.dart';
import 'package:your_money/screens/splash/cubit/splash_cubit.dart';
import 'package:your_money/screens/splash/view/splash_page.dart';

import '../../../uitls/size_config.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    RepositoryMenu().loadData();
    return BlocProvider<SplashCubit>(
      create: (BuildContext context) => SplashCubit(),
      child: const SplashPage(),
    );
  }
}
