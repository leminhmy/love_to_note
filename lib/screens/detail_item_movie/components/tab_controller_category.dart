import 'package:flutter/material.dart';

import '../../../uitls/theme_color.dart';
import '../../../widget/text_header3.dart';

class TabControllerCateGory extends StatefulWidget {
  const TabControllerCateGory({Key? key}) : super(key: key);

  @override
  State<TabControllerCateGory> createState() => _TabControllerCategoryState();
}

class _TabControllerCategoryState extends State<TabControllerCateGory> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        TabBar(
          padding: const EdgeInsets.all(20),
          controller: _tabController,
          labelColor: ThemeColor.colorWhile,
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
          tabs: const [
            Tab(text: "Movie",),
            Tab(text: "Comic",),
            Tab(text: "WebSite",),
          ],
        ),
      ],
    );
  }
}
