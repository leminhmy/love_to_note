import 'package:flutter/material.dart';

import '../models/item_expenses.dart';
import '../uitls/app_format.dart';
import '../uitls/icons_assets.dart';
import '../uitls/size_config.dart';
import '../uitls/theme_color.dart';
import 'container_border_liner.dart';
import 'icon_circle_btn.dart';
import 'text_header1.dart';
import 'text_header3.dart';
import 'text_header5.dart';

class CardTransactions extends StatefulWidget {
  const CardTransactions({
    Key? key,
    required this.itemExpenses, this.onPressDelete, this.subWidget, this.disableBtnDelete = false,
  }) : super(key: key);
  final Widget? subWidget;
  final bool disableBtnDelete;
  final ItemExpenses itemExpenses;
  final VoidCallback? onPressDelete;

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
    _animation = Tween<double>(begin: 0,end: SizeConfig.screenHeight * 0.119).animate(CurvedAnimation(parent: _animationController,
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
            height: SizeConfig.screenHeight * 0.12-(double.parse(_animation.value.toString())),
            child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                Container(
                  height: double.maxFinite,
                  width: SizeConfig.screenWidth * 0.92,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal:SizeConfig.screenHeight * 0.02 ),
                  decoration:  BoxDecoration(
                    color: ThemeColor.colorWhile,
                    borderRadius: widget.disableBtnDelete == false?BorderRadius.only(
                      bottomLeft: Radius.circular(SizeConfig.screenHeight * 0.015),
                      topLeft: Radius.circular(SizeConfig.screenHeight * 0.015),

                    ):BorderRadius.circular(SizeConfig.screenHeight * 0.015),
                  ),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         IconCircleBtn(
                            color: ThemeColor.colorOrangeBasic,
                            icon: ImageIcon(
                              AssetImage(widget.itemExpenses.image),
                              color: Colors.white,
                              size: SizeConfig.screenHeight * 0.045,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                         TextHeader1(
                          text: widget.itemExpenses.name,
                          fontSize: SizeConfig.screenHeight * 0.02,
                          colorText: ThemeColor.colorBlack2,
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             TextHeader3(
                              text: AppFormat.numberFormatPriceVi(widget.itemExpenses.price),
                            ),
                            widget.subWidget ??
                                const SizedBox(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                widget.disableBtnDelete == false?GestureDetector(
                  onTap: () {
                    widget.onPressDelete;
                    animationDelete();
                  },
                  child:  SizedBox(
                    width: SizeConfig.screenHeight * 0.1,
                    child: ContainerBorderLiner(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(SizeConfig.screenHeight * 0.015),
                        topRight: Radius.circular(SizeConfig.screenHeight * 0.015),
                      ),
                      child: const TextHeader3(text: "Delete",colorText: ThemeColor.colorWhile,),
                    ),
                  ),
                ): const SizedBox(),
              ],
            ),
                ),
          );
        },
      ),
    );
  }
}
