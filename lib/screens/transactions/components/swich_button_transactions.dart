import 'package:flutter/material.dart';

import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/container_border_liner.dart';
import '../../../widget/text_header3.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({
    Key? key, required this.indexSelected,
  }) : super(key: key);

  final ValueChanged<int> indexSelected;

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
              child:  SizedBox(
                width: SizeConfig.screenHeight * 0.25,
                child: const Padding(
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
                        widget.indexSelected(0);

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
                        widget.indexSelected(1);

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