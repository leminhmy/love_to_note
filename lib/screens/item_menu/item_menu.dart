import 'package:flutter/material.dart';
import 'package:your_money/screens/detail_item_movie/detail_item_movie.dart';
import 'package:your_money/screens/detail_item_transactions/detail_item_transactions.dart';
import 'package:your_money/uitls/image_assets.dart';

import '../../uitls/icons_assets.dart';
import '../../uitls/theme_color.dart';
import '../../widget/icon_border_btn.dart';
import '../../widget/icon_circle_btn.dart';
import '../../widget/text_header1.dart';

class ItemMenu extends StatefulWidget {
  const ItemMenu({Key? key}) : super(key: key);

  @override
  State<ItemMenu> createState() => _ItemMenuState();
}

class _ItemMenuState extends State<ItemMenu> with SingleTickerProviderStateMixin{

  late final AnimationController _animationController;
  late final Animation<double> _animationBegin;
  late final Animation<double>  _animationEnd;
   double heightDefault = 0.5;
   double widthDefault = 0.52;
   bool selectedWidget = false;

   @override
  void dispose() {
    // TODO: implement dispose
     _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 1));
    _animationBegin = Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: _animationController, curve: const Interval(
      0,0.5,
      curve: Curves.easeOut,
    )));
    _animationEnd = Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: _animationController, curve: const Interval(
      0.5,1,
      curve: Curves.easeOut,
    )));
    super.initState();
  }


  double animationHeightToFull(Size size,double valueAnimation){
    return size.height * heightDefault + (size.height * heightDefault * valueAnimation);
  }
  double animationHeightToZero(Size size,double valueAnimation){
    return size.height * heightDefault - (size.height * heightDefault * valueAnimation);
  }

  double animationWidthToFull(Size size,double valueAnimation){
    return size.width * widthDefault + (size.width * (1-widthDefault) * valueAnimation);
  }
  double animationWidthToZero(Size size,double valueAnimation){
    return size.width * widthDefault - ((size.width * widthDefault) * valueAnimation);
  }

  double animationHeight(bool selected,Size size){
    if(selected){
      return animationHeightToZero(size, _animationBegin.value);

    }else{
      return animationHeightToFull(size, _animationEnd.value);
    }
  }

  double animationWidth(bool selected,Size size){
    if(selected){
      return animationWidthToZero(size, _animationBegin.value);

    }else{
      return animationWidthToFull(size, _animationEnd.value);

    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _animationController.addListener(() {
      if(_animationController.isCompleted){
        if(selectedWidget){
          Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailItemMovie()));
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailItemTransactions()));

        }
      }
    });

    return Scaffold(
        backgroundColor: ThemeColor.colorOrangeBasic,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconBorderBtn(
                      onPress: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: ThemeColor.colorGrey,
                      ),
                    ),
                    const TextHeader1(
                      text: "Choose Widget",
                      fontSize: 30,
                    ),
                    const SizedBox(
                      height: 50,
                      child: IconCircleBtn(
                        color: ThemeColor.colorOrange,
                        icon: ImageIcon(
                          AssetImage(IconsAssets.application),
                          color: ThemeColor.colorWhile,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               Align(
                 alignment: Alignment.center,
                 child: SingleChildScrollView(
                   physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child:  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {

                      return Padding(
                        padding: EdgeInsets.all(20 - (20 *_animationBegin.value)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: animationHeight(selectedWidget,size),
                              width: animationWidth(selectedWidget,size),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      image: AssetImage(ImageAssets.itemWidgetFood),
                                      fit: BoxFit.cover)),
                              child: ElevatedButton(
                                onPressed: (){
                                  selectedWidget = false;
                                  _animationController.forward();

                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  onPrimary: Colors.black
                                ),
                                child: const SizedBox(),
                              ),
                            ),
                            SizedBox(width: 60 - (60 * _animationBegin.value),),
                            Container(
                              height: animationHeight(!selectedWidget,size),
                              width: animationWidth(!selectedWidget,size),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      image: AssetImage(ImageAssets.itemWidgetMovie),
                                      fit: BoxFit.cover)),
                              child: ElevatedButton(
                                onPressed: (){
                                  selectedWidget = true;
                                  _animationController.forward();

                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent,

                                ),
                                child: const SizedBox(),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
              ),
               ),
            ],
          ),
        ));
  }
}