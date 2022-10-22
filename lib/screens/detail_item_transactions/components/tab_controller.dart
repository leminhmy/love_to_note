import 'package:flutter/material.dart';

import '../../../uitls/theme_color.dart';
import '../../../widget/text_header3.dart';

class TabControllerWidget extends StatefulWidget {
  const TabControllerWidget({Key? key}) : super(key: key);

  @override
  State<TabControllerWidget> createState() => _TabControllerWidgetState();
}

class _TabControllerWidgetState extends State<TabControllerWidget> with SingleTickerProviderStateMixin{
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
          labelColor: ThemeColor.colorBlack,
          indicatorColor: ThemeColor.colorOrangeBasic,
          unselectedLabelColor: ThemeColor.colorGrey,
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
            Tab(text: "Food",),
             Tab(text: "Shopping",),
            Tab(text: "Travel",),
          ],
        ),
      ],
    );
  }
}
