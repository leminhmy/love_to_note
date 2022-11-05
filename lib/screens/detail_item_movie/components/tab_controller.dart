import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/detail_item_movie/cubit/detail_item_movie_cubit.dart';
import 'package:your_money/widget/container_border_liner.dart';

import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/text_header3.dart';

class TabControllerWidget extends StatefulWidget {
  const TabControllerWidget({Key? key}) : super(key: key);

  @override
  State<TabControllerWidget> createState() => _TabControllerWidgetState();
}

class _TabControllerWidgetState extends State<TabControllerWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: ThemeColor.colorBlack,
          indicatorColor: ThemeColor.colorOrangeBasic,
          unselectedLabelColor: ThemeColor.colorGrey,
          labelStyle:
              const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          unselectedLabelStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          labelPadding: const EdgeInsets.only(right: 5,bottom: 5),
          isScrollable: true,
          onTap: (index){
            context.read<DetailItemMovieCubit>().changeTabWeekdays(index);

          },
          tabs:  List.generate(7, (index) => Tab(
              height: SizeConfig.screenHeight * 0.05,
              iconMargin: EdgeInsets.zero,
              child: SizedBox(
                width: SizeConfig.screenHeight * 0.15,
                child: ContainerBorderLiner(
                  borderRadius: BorderRadius.circular(7),
                  gradient: ThemeColor.linerColorBlackWhile,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      StatefulBuilder(
                          builder: (context, setState2) {
                            _tabController.addListener(() {
                              if(_tabController.previousIndex == index || _tabController.index == index){
                                setState2(() {
                                });
                              }
                            });
                            return Align(
                              alignment: const Alignment(1,0),
                              child: SizedBox(
                                width: SizeConfig.screenHeight * 0.15,
                                child: ContainerBorderLiner(
                                  borderRadius: BorderRadius.circular(7),
                                  gradient: _tabController.index == index?ThemeColor.linerColorBlueLight:ThemeColor.linerColorBlackWhile,
                                ),
                              ),
                            );
                          }
                      ),
                      TextHeader3(
                        text: index==6?"Chủ Nhật":"Thứ ${index+2}",
                        colorText: ThemeColor.colorWhile,
                      ),

                    ],
                  ),
                ),
              )),),
        ),
      ],
    );
  }
}
