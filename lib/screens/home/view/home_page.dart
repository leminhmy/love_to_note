import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/repository/repository_menu.dart';
import 'package:your_money/screens/detail_item_movie/view/detail_item_movie_view.dart';
import 'package:your_money/screens/drawer_home/view/drawer_home_view.dart';
import 'package:your_money/screens/home/components/btn_switch_screen.dart';
import 'package:your_money/screens/home/home.dart';

import 'package:your_money/uitls/theme_color.dart';

import '../components/banner_balance.dart';
import '../components/bottom_nativator.dart';
import '../components/label_title.dart';
import '../components/list_transactions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colorDefault = ThemeColorDarkLight.color.backgroundScaffold;
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
      current.reload == HomeReload.themeColor,
      builder: (context, state) {
        print("home reload");

        return TweenAnimationBuilder(
            duration: const Duration(seconds: 1),
            tween: ColorTween(begin: colorDefault,
                end: ThemeColorDarkLight.color.backgroundScaffold),

            builder: (context, Color? color, child) {
              return Scaffold(
                backgroundColor: color,
                drawer: const DrawerHomeView(),
                body: Stack(
                  alignment: const Alignment(0, 0),
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: BlocBuilder<HomeCubit, HomeState>(
                            builder: (context, state) {
                              if(!state.isHomePage && RepositoryMenu.listNoteMovie.isNotEmpty){
                                return const DetailItemMovieView(indexDetailMovie: 0,);
                              }
                              return const BodyHomePage();

                            },
                          ),
                        ),
                        const BottomNavigator(),
                      ],
                    ),
                    const BtnSwitchScreen(),
                  ],
                ),
              );
            }
        );
      },
    );
  }
}

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          LabelTitle(),
          BannerBalance(),
          ListTransactions(),
        ],
      ),
    );
  }
}

