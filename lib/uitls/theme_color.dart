import 'package:flutter/material.dart';
import 'package:your_money/models/theme_color_model.dart';
import 'package:your_money/uitls/image_assets.dart';

class ThemeColorDarkLight {
  static bool _isDarkThemeColor = false;

  static bool get isDarkThemeColor => _isDarkThemeColor;

  static ThemeColorModel _themeColor = _themeDarkColor;

  static ThemeColorModel get color => _themeColor;

  static const ThemeColorModel _themeDarkColor =  ThemeColorModel(
      backgroundScaffold: Color(0xff1a1a20),
      backgroundItem: Color(0xff2a2d41),
      text: Color(0xffffffff),
      text2: Color(0xffe1e1e1),
      button: Color(0xff2a2d41),
      icon: Color(0xffe1e1e1),
      shadow2: Color(0xff35393f),
      shadow: Color(0xff23262a),
      text3: Color(0xff1e212f),
      image:  ImageAssets.darkBg,

  );
  static const ThemeColorModel _themeLightColor =  ThemeColorModel(
      backgroundScaffold: Color(0xffefefef),
      backgroundItem: Color(0xffffffff),
      text: Color(0xff000000),
      text2: Color(0xff282727),
      button: Color(0xffffffff),
      icon: Color(0xff565555),
      image: ImageAssets.imageBg,
      text3: Color(0xffe1e1e1),
      shadow: Color(0xffa7a9af),
      shadow2: Color(0xffe7e7e7),
  );


  Future<bool> loadingThemeColor(bool isDarkTheme) async{
    if (isDarkTheme) {
      _themeColor = _themeDarkColor;
    } else {
      _themeColor = _themeLightColor;
    }
    _isDarkThemeColor = isDarkTheme;
    return true;
  }

  Future<bool> changeTheme() async{
    _isDarkThemeColor = !_isDarkThemeColor;
   await loadingThemeColor(_isDarkThemeColor);

   return true;
  }
}

class ThemeColor {
  //colorDark
  static const Color colorBackgroundDark = Color(0xff1a1a20);
  static const Color colorLiner1 = Color(0xff23232a);
  static const Color colorLiner2 = Color(0xff26262d);

  //color basic
  static const Color colorBlack = Color(0xff000000);
  static const Color colorWhile = Color(0xffffffff);
  static const Color colorGrey = Color(0xff565555);
  static const Color colorGreyWhile = Color(0xffe1e1e1);
  static const Color colorBlack2 = Color(0xff282727);
  static const Color colorBackgroundWhile = Color(0xffefefef);

  static const Color colorBlue = Color(0xff3a8eef);
  static const Color colorBlueLight = Color(0xff51aff8);
  static const Color colorBlueGreen = Color(0xff00dbef);
  static const Color colorGreen = Color(0xff10ff00);
  static const Color colorViolet = Color(0xffb73bf3);
  static const Color colorOrange = Color(0xfff36f11);
  static const Color colorOrangeWhile = Color(0xfff1b582);
  static const Color colorRed = Color(0xfffa001c);

  static const Color colorShadow1 = Color(0xffa7a9af);
  static const Color colorShadow2 = Color(0xffe7e7e7);

  static const List<Color> listLinerColor = [
    colorBlueGreen,
    colorViolet,
    colorOrange
  ];
  static const LinearGradient linerColor = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [colorBlue, colorViolet, colorOrange]);
  static const LinearGradient linerColorCenter = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [colorBlue, colorViolet, colorOrange]);
  static const LinearGradient linerColorReverse = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        colorOrangeBasic,
        colorViolet,
        colorBlueGreen,
      ]);
  static const LinearGradient linerColorBlueLight = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        colorBlue,
        colorBlueLight,
      ]);
  static const LinearGradient linerColorBlackWhile = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        colorLiner1,
        colorLiner2,
      ]);
  static const LinearGradient linerColorOrangeRed = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xfffe8803),
        Color(0xfff93657),
      ]);

  //color icon

  static const Color colorOrangeBasic = Colors.orange;
}
