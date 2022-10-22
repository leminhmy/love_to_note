import 'package:flutter/material.dart';
import 'package:your_money/uitls/icons_assets.dart';
import 'package:your_money/uitls/theme_color.dart';
import 'package:your_money/widget/container_border_liner.dart';
import 'package:your_money/widget/icon_bg_btn.dart';
import 'package:your_money/widget/icon_border_btn.dart';
import 'package:your_money/widget/text_header1.dart';

import '../../widget/card_item_chart.dart';
import '../../widget/card_transactions.dart';
import '../../widget/text_header3.dart';
import '../../widget/text_header5.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.colorBackgroundWhile,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  IconBorderBtn(
                    onPress: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_circle_left,
                      color: ThemeColor.colorGrey,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const TextHeader1(
                    text: "Transactions",
                    fontSize: 30,
                  ),
                  const Spacer(),
                  const IconBorderBtn(
                      icon: ImageIcon(
                    AssetImage(IconsAssets.control),
                    color: ThemeColor.colorGrey,
                  ))
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80, child: SwitchButton()),
                    Container(
                      height: 370,
                      margin: const EdgeInsets.all(20),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: ThemeColor.colorWhile,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: const [
                                TextHeader3(
                                    text: "01 Jan 2021 - 01 Aprill 2022"),
                                SizedBox(
                                  height: 10,
                                ),
                                TextHeader1(
                                  text: "\$3500.00",
                                  fontSize: 30,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              child: Row(
                            children: [
                              SizedBox(
                                width: 80,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: List.generate(
                                              5,
                                              (index) => TextHeader5(
                                                    text: "\$ ${index}k",
                                                    colorText:
                                                        ThemeColor.colorGrey,
                                                  ))),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: 12,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          const Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: CardItemChart(),
                                          )))
                            ],
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TextHeader3(
                            text: "Sat, 20 March 2021",
                          ),
                          TextHeader3(text: "-500.00"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) =>
                          const CardTransactions(dateTime: SizedBox()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SwitchButton extends StatefulWidget {
  const SwitchButton({
    Key? key,
  }) : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Alignment> _animation;
  bool selected = true;


  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _animation = AlignmentTween(
            begin: const Alignment(1, 0), end: const Alignment(-1, 0))
        .animate(_animationController);
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

    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: ThemeColor.colorWhile,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          StatefulBuilder(builder: (context, setState) {
            _animationController.addListener(() {
              setState(() {});
            });
            return Align(
              alignment: _animation.value,
              child: const SizedBox(
                width: 250,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: ContainerBorderLiner(),
                ),
              ),
            );
          }),
          StatefulBuilder(
            builder: (context, setState2) {
              return Row(
                children: [
                  Expanded(child: InkWell(
                    onTap: () {
                      if (_animation.value == const Alignment(1, 0)) {
                        _animationController.forward();
                        Future.delayed(const Duration(milliseconds: 100),(){
                          selected = false;
                          setState2((){});
                        });
                      }
                    },
                    child: Center(
                        child: TextHeader3(
                          text: "Income",
                          colorText: selected?ThemeColor.colorGrey:ThemeColor.colorWhile,
                        )),
                  ),),
                  Expanded(child: InkWell(
                    onTap: () {
                      if (_animation.value == const Alignment(-1, 0)) {
                        _animationController.reverse();
                        Future.delayed(const Duration(milliseconds: 100),(){
                          selected = true;
                          setState2((){});
                        });
                      }
                    },
                    child:  Center(
                        child: TextHeader3(
                            text: "Expenses",
                          colorText: selected?ThemeColor.colorWhile:ThemeColor.colorGrey,
                           )),
                  )),
                ],
              );
            }
          ),
        ],
      ),
    );
  }
}
