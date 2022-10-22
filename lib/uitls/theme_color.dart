
import 'package:flutter/material.dart';

class ThemeColor{
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
  static const Color colorViolet = Color(0xffb73bf3);
  static const Color colorOrange = Color(0xfff36f11);
  static const Color colorOrangeWhile = Color(0xfff1b582);
  static const Color colorRed = Color(0xfffa001c);

  static const Color colorShadow1 = Color(0xffa7a9af);
  static const Color colorShadow2 = Color(0xffe7e7e7);

  static const List<Color> listLinerColor = [colorBlueGreen,
    colorViolet,
    colorOrange];
  static const LinearGradient linerColor  = LinearGradient(
    begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        colorBlue,
        colorViolet,
        colorOrange
      ]);
  static const LinearGradient linerColorCenter  = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        colorBlue,
        colorViolet,
        colorOrange
      ]);
  static const LinearGradient linerColorReverse  = LinearGradient(
    begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        colorOrangeBasic,
        colorViolet,
        colorBlueGreen,
      ]);
  static const LinearGradient linerColorBlueLight  = LinearGradient(
    begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        colorBlue,
        colorBlueLight,
      ]);
  static const LinearGradient linerColorBlackWhile  = LinearGradient(
    begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        colorLiner1,
        colorLiner2,
      ]);
  static const LinearGradient linerColorOrangeRed  = LinearGradient(
    begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xfffe8803),
        Color(0xfff93657),
      ]);

  //color icon

  static const Color colorOrangeBasic = Colors.orange;


}