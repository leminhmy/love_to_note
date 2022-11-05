import 'dart:io';

import 'package:flutter/material.dart';
import 'package:your_money/models/item_movie.dart';
import 'package:your_money/widget/text_header1.dart';
import 'package:your_money/widget/text_header3.dart';

import '../uitls/image_assets.dart';
import '../uitls/size_config.dart';
import '../uitls/theme_color.dart';
import 'neumorphism_container.dart';


class CardItemMovie extends StatefulWidget {
  const   CardItemMovie({
    Key? key, required this.itemMovie, this.onPressDelete,
  }) : super(key: key);

  final ItemMovie itemMovie;
  final VoidCallback? onPressDelete;

  @override
  State<CardItemMovie> createState() => _CardItemMovieState();
}

class _CardItemMovieState extends State<CardItemMovie>  with SingleTickerProviderStateMixin{
  late final AnimationController _animationController;
  bool selected = false;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 500));

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
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          if(_animationController.isCompleted){
            return const SizedBox();
          }else{
            return Container(
              height: SizeConfig.screenHeight * 0.315-(SizeConfig.screenHeight * 0.315*_animationController.value),
              width: SizeConfig.screenHeight * 0.210-(SizeConfig.screenHeight * 0.210*_animationController.value),
              margin: const EdgeInsets.all(5),
              decoration:  BoxDecoration(
                image:  DecorationImage(
                    image: FileImage(File(widget.itemMovie.image)),
                    fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(15),

              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    height: SizeConfig.screenHeight * 0.06,
                    width: SizeConfig.screenHeight * 0.210,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.bottomLeft,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(SizeConfig.screenHeight * 0.015),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black87,

                            ]
                        )
                    ),
                    child: TextHeader1(text: widget.itemMovie.name,colorText: ThemeColor.colorWhile,),
                  ),
                  StatefulBuilder(
                      builder: (context, setStateShowBtn) {
                        return ElevatedButton(
                          onPressed: (){
                            if(selected == true){
                              selected = false;
                              setStateShowBtn((){});
                            }
                          },
                          onLongPress: (){
                            selected = !selected;
                            setStateShowBtn((){});
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,

                          ),
                          child: SizedBox(
                            width: SizeConfig.screenHeight * 0.1,
                            height: SizeConfig.screenHeight * 0.05,
                            child: selected?TextBtnAnimation(onPressAccept: (){
                              widget.onPressDelete!();
                              print("call fn ");
                              _animationController.forward();
                            }):const SizedBox(),
                          ),
                        );
                      }
                  ),

                ],
              ),
            );

          }
        }
    );
  }
}


class TextBtnAnimation extends StatelessWidget {
  const TextBtnAnimation({Key? key, required this.onPressAccept}) : super(key: key);

  final VoidCallback onPressAccept;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressAccept,
      child: const NeumorphismContainer(
        inset: false,
        colorShadow1: Colors.transparent,
        child: TextHeader3(text: "Delete",colorText: ThemeColor.colorOrange,),
      ),
    );
  }
}