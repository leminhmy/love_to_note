import 'package:flutter/widgets.dart';

class SizeConfig{
  static late MediaQueryData _mediaQueryData;
  static late Size size;
  static late  double screenWidth;
  static late  double screenHeight;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    size = _mediaQueryData.size;
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
  }

}