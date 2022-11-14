import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/detail_item_movie/cubit/detail_item_movie_cubit.dart';

import '../../../uitls/theme_color.dart';
import '../../../widget/text_header3.dart';
import '../../home/cubit/home_cubit.dart';

class TabControllerCateGory extends StatefulWidget {
  const TabControllerCateGory({Key? key}) : super(key: key);

  @override
  State<TabControllerCateGory> createState() => _TabControllerCategoryState();
}

class _TabControllerCategoryState extends State<TabControllerCateGory>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
      current.reload == HomeReload.themeColor,
      builder: (context, state) {
    return BlocBuilder<DetailItemMovieCubit, DetailItemMovieState>(
      buildWhen: (previous, current) =>false,
      builder: (context, state) {
        _tabController = TabController(initialIndex: state.indexNoteMovie,length: state.listNoteMovie.length, vsync: this);
        return Column(
          children: [
            TabBar(
              padding: const EdgeInsets.all(20),
              controller: _tabController,
              labelColor: ThemeColorDarkLight.color.text,
              indicatorColor: ThemeColor.colorOrangeBasic,
              unselectedLabelColor: ThemeColor.colorGreyWhile,
              labelStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
              unselectedLabelStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
              ),
              isScrollable: true,
              onTap: (index){
                context.read<DetailItemMovieCubit>().changeTabCategory(index);
              },
              tabs: List.generate(state.listNoteMovie.length, (index) => Tab(
                text: state.listNoteMovie[index].name,
              )),
            ),
          ],
        );
      },
    );
  },
);
  }
}
