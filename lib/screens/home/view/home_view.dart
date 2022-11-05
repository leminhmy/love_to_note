import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/home/home.dart';
import 'package:your_money/screens/home/view/home_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (BuildContext context) => HomeCubit()..loadingHome(),
      child: const HomePage(),
    );
  }
}
