import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/app/locate/lang_code.dart';
import 'package:your_money/app/router/route_name.dart';

import 'package:your_money/screens/add_movie/view/add_movie_view.dart';
import 'package:your_money/screens/detail_item_movie/components/tab_controller_category.dart';
import 'package:your_money/screens/detail_item_movie/cubit/detail_item_movie_cubit.dart';
import 'package:your_money/screens/home/home.dart';

import '../../../uitls/icons_assets.dart';
import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/card_item_movie.dart';
import '../../../widget/icon_border_btn.dart';
import '../../../widget/icon_circle_btn.dart';
import '../../../widget/show_bottom_sheet.dart';
import '../../../widget/text_header1.dart';
import '../components/label_title.dart';
import '../components/tab_controller.dart';

class DetailItemMoviePage extends StatelessWidget {
  const DetailItemMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colorDefault = ThemeColorDarkLight.color.backgroundScaffold;
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
      current.reload == HomeReload.themeColor,
      builder: (context, state) {
    return TweenAnimationBuilder(
        duration: const Duration(seconds: 1),
        tween: ColorTween(begin: colorDefault,
            end: ThemeColorDarkLight.color.backgroundScaffold),

        builder: (context, Color? color, child) {
        return Scaffold(
          backgroundColor: color,
          body: const BodyDetailIteMovie(),
        );
      }
    );
  },
);
  }
}


class BodyDetailIteMovie extends StatelessWidget {
  const BodyDetailIteMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
      current.reload == HomeReload.themeColor,
      builder: (context, state) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LabelTile(),
              const TabControllerCateGory(),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) =>
                            ThemeColor.linerColorOrangeRed.createShader(
                              Rect.fromLTWH(
                                  0, 0, bounds.width, bounds.height),
                            ),
                        child: TextHeader1(
                          text: AppLang.lang(LangCode.showTimes).toUpperCase(),
                        )),
                    SizedBox(
                      height: 2,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Container(
                            width: SizeConfig.screenHeight * 0.1,
                            decoration: const BoxDecoration(
                                gradient: ThemeColor.linerColorOrangeRed),
                          ),
                          const Expanded(
                              child: SizedBox(
                                  height: 2,
                                  child: ColoredBox(
                                    color: ThemeColor.colorGrey,
                                  )))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const TabControllerWidget(),
              Expanded(
                child: BlocBuilder<
                    DetailItemMovieCubit,
                    DetailItemMovieState>(
                  buildWhen: (previous, current) =>
                  current.reload == DetailItemMovieReload.tabListItem,
                  builder: (context, state) {
                    print("reload tablistItem");
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Center(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          runAlignment: WrapAlignment.start,
                          alignment: WrapAlignment.start,
                          children: List.generate(
                              state.listItemMovie.length, (index) =>
                              CardItemMovie(itemMovie: state.listItemMovie[index],onPressDelete: (){
                                context.read<DetailItemMovieCubit>().deleteItemMovie(index);
                              },)),
                        ),
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
          Positioned(
            bottom: SizeConfig.screenHeight * 0.06,
            right: SizeConfig.screenHeight * 0.03,
            child: GestureDetector(
              onTap: () {
                ShowBottomSheetClass.showBottomDefault(
                  context: context,
                  child: const AddMovieView(),
                ).whenComplete(() => context.read<DetailItemMovieCubit>().reloadListItemMovie());
              },
              child: Container(
                width: SizeConfig.screenHeight * 0.08,
                height: SizeConfig.screenHeight * 0.08,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    gradient: ThemeColor.linerColorReverse,
                    boxShadow: [
                      BoxShadow(
                          color: ThemeColor.colorGrey,
                          blurRadius: 7,
                          spreadRadius: 1,
                          offset: Offset(0, 2))
                    ]),
                child: Icon(
                  Icons.add_outlined,
                  size: SizeConfig.screenHeight * 0.045,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  },
);
  }
}


