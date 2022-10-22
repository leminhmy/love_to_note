import 'package:flutter/material.dart';

import '../uitls/icons_assets.dart';
import '../uitls/theme_color.dart';
import 'container_border_liner.dart';
import 'icon_circle_btn.dart';
import 'text_header1.dart';
import 'text_header3.dart';
import 'text_header5.dart';

class CardTransactions extends StatefulWidget {
  const CardTransactions({
    Key? key,
    this.dateTime, this.onPress,
  }) : super(key: key);

  final Widget? dateTime;
  final VoidCallback? onPress;

  @override
  State<CardTransactions> createState() => _CardTransactionsState();
}

class _CardTransactionsState extends State<CardTransactions>
    with SingleTickerProviderStateMixin  {
  final  Duration _duration = const Duration(milliseconds: 500);
  final ScrollController _scrollController = ScrollController();
  late final AnimationController _animationController;
  late final Animation _animation;


  animationDelete() {
    _scrollController.animateTo(600,
            duration: _duration, curve: Curves.easeOut);
    _animationController.forward();
  }

  @override
  void initState() {
    // TODO: implement initState
    _animationController =  AnimationController(vsync: this, duration: _duration);
    _animation = Tween<double>(begin: 0,end: 119).animate(CurvedAnimation(parent: _animationController,
        curve: const Interval(
          0.5,1,
      curve: Curves.easeOut,

    )));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return SizedBox(
            height: 120-(double.parse(_animation.value.toString())),
            child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 440,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: ThemeColor.colorWhile,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const IconCircleBtn(
                            color: ThemeColor.colorOrangeBasic,
                            icon: Padding(
                              padding: EdgeInsets.all(5),
                              child: ImageIcon(
                                AssetImage(IconsAssets.burger),
                                color: Colors.white,
                              ),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        const TextHeader1(
                          text: "Food",
                          fontSize: 20,
                          colorText: ThemeColor.colorBlack2,
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const TextHeader3(
                              text: "-\$45.00",
                            ),
                            widget.dateTime ??
                                const TextHeader5(
                                  text: "Today",
                                ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.onPress;
                    animationDelete();
                  },
                  child:  SizedBox(
                    width: 100,
                    child: Stack(
                      children: [
                        const ContainerBorderLiner(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: TextHeader3(text: "Delete",colorText: ThemeColor.colorWhile,),
                        ),
                        Container(
                          width: 10,
                          decoration: const BoxDecoration(
                            color: ThemeColor.colorWhile,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
                ),
          );
        },
      ),
    );
  }
}
