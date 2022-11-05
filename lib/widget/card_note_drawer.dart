import 'package:flutter/material.dart';
import 'package:your_money/models/item_menu.dart';
import 'package:your_money/uitls/size_config.dart';
import 'package:your_money/widget/neumorphism_container.dart';

import '../uitls/image_assets.dart';
import '../uitls/theme_color.dart';
import 'container_border_liner.dart';
import 'icon_circle_btn.dart';
import 'text_header1.dart';
import 'text_header3.dart';
import 'text_header5.dart';

class CardNoteDrawer extends StatefulWidget {
  const CardNoteDrawer({
    Key? key,
    this.dateTime, this.onPress, required this.itemMenu, this.category,
  }) : super(key: key);

  final Widget? dateTime;
  final VoidCallback? onPress;
  final ItemMenuModel? itemMenu;
  final String? category;


  @override
  State<CardNoteDrawer> createState() => _CardTransactionsState();
}

class _CardTransactionsState extends State<CardNoteDrawer>
    with SingleTickerProviderStateMixin  {
  final  Duration _duration = const Duration(milliseconds: 500);
  final ScrollController _scrollController = ScrollController();
  late final AnimationController _animationController;
  late final Animation _animation;
   bool showWidgetDialog = false;


  animationDelete() {
    _scrollController.animateTo(600,
        duration: _duration, curve: Curves.easeOut);
    _animationController.forward();
  }

  @override
  void initState() {
    // TODO: implement initState
    _animationController =  AnimationController(vsync: this, duration: _duration);
    _animation = Tween<double>(begin: 0,end: SizeConfig.screenHeight * 0.089).animate(CurvedAnimation(parent: _animationController,
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
            height: SizeConfig.screenHeight * 0.09-(double.parse(_animation.value.toString())),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight * 0.01, horizontal: SizeConfig.screenHeight * 0.02),

              child: StatefulBuilder(
                builder: (context, setStateDialog) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: SizeConfig.screenHeight * 0.35,
                            padding: EdgeInsets.all(SizeConfig.screenHeight * 0.01),
                            decoration:  BoxDecoration(
                              color: ThemeColor.colorWhile,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(SizeConfig.screenHeight * 0.015),
                                topLeft: Radius.circular(SizeConfig.screenHeight * 0.015),
                              ),
                            ),
                            child: SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                   IconCircleBtn(
                                    size: SizeConfig.screenHeight * 0.05,
                                      color: ThemeColor.colorOrangeBasic,
                                      icon:  Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: ImageIcon(
                                          AssetImage(widget.itemMenu?.image??ImageAssets.noImage),
                                          color: Colors.white,
                                        ),
                                      )),
                                   SizedBox(
                                    width: SizeConfig.screenHeight * 0.01,
                                  ),
                                   TextHeader1(
                                    text: widget.itemMenu?.name??"null name",
                                    fontSize: SizeConfig.screenHeight * 0.02,
                                    colorText: ThemeColor.colorBlack2,
                                  ),
                                  const Spacer(),
                                  TextHeader5(
                                    text: widget.category??"Empty",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {

                              showWidgetDialog = !showWidgetDialog;
                              setStateDialog((){});
                              // animationDelete();
                            },
                            child:  SizedBox(
                              width: SizeConfig.screenHeight * 0.08,
                              child: Stack(
                                children: [
                                   ContainerBorderLiner(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(SizeConfig.screenHeight * 0.015),
                                      topRight: Radius.circular(SizeConfig.screenHeight * 0.015),
                                    ),
                                    child: const TextHeader3(text: "Delete",colorText: ThemeColor.colorWhile,),
                                  ),
                                  Container(
                                    width: SizeConfig.screenHeight * 0.01,
                                    decoration:  BoxDecoration(
                                      color: ThemeColor.colorWhile,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(SizeConfig.screenHeight * 0.015),
                                        topRight: Radius.circular(SizeConfig.screenHeight * 0.015),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      showWidgetDialog?SizedBox(
                        height: SizeConfig.screenHeight * 0.09,
                          width: SizeConfig.screenHeight * 0.22,
                          child: ShowWidgetAccept(onPressAccept: (){
                            widget.onPress;
                            animationDelete();
                          }, onPressCancel: (){
                            showWidgetDialog = false;
                            setStateDialog((){});
                          })):const SizedBox(),
                    ],
                  );
                }
              ),
            ),
          );
        },
      ),
    );
  }
}

class ShowWidgetAccept extends StatelessWidget {
  const ShowWidgetAccept({Key? key, required this.onPressAccept, required this.onPressCancel}) : super(key: key);

  final VoidCallback onPressAccept;
  final VoidCallback onPressCancel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        SizedBox(
          width: SizeConfig.screenHeight * 0.1,
          height: SizeConfig.screenHeight * 0.045,
          child: InkWell(
            onTap: onPressAccept,
            child: const NeumorphismContainer(
              inset: false,
              colorShadow1: ThemeColor.colorWhile,
              child: TextHeader3(text: "Delete",colorText: ThemeColor.colorOrange,),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.screenHeight * 0.1,
          height: SizeConfig.screenHeight * 0.045,
          child: InkWell(
            onTap: onPressCancel,
            child: const NeumorphismContainer(
                inset: false,
              colorShadow1: ThemeColor.colorWhile,
              child: TextHeader3(text: "Cancel",),
            ),
          ),
        ),
      ],
    );
  }
}

