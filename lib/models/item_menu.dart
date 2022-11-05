

import 'dart:convert';
import 'dart:ui';

import 'package:your_money/uitls/theme_color.dart';

class ItemMenuModel {
   String image;
   String name;
   Color colorBg;
   Color colorIcon;
   String imageLocal;


   ItemMenuModel({
    required this.image,
    required this.name,
    required this.colorBg,
    required this.colorIcon,
    required this.imageLocal,

});

  static ItemMenuModel empty = ItemMenuModel(imageLocal: "",image: "", name: "",colorBg: ThemeColor.colorOrange,colorIcon: ThemeColor.colorWhile);
  bool get isEmpty => this == ItemMenuModel.empty;
  bool get isNotEmpty => this != ItemMenuModel.empty;


  factory ItemMenuModel.fromJson(Map<String, dynamic> json){
    return ItemMenuModel(
      name: json['name']??"",
      image: json['image']??"",
      colorBg: json['colorBg']??ThemeColor.colorOrange,
      colorIcon: json['colorIcon']??ThemeColor.colorWhile,
      imageLocal: json['imageLocal']??"",
    );
  }

   factory ItemMenuModel.fromJsonString(Map<String, dynamic> json){
     return ItemMenuModel(
       name: json['name']??"",
       image: json['image']??"",
       colorBg: Color(int.parse(json['colorBg'])),
       colorIcon: Color(int.parse(json['colorIcon'])),
       imageLocal: json['imageLocal']??"",
     );
   }


  Map<String, dynamic> toJson(){
    return {
      "image": image,
      "name": name,
      "colorBg": colorBg,
      "colorIcon": colorIcon,
      "imageLocal": imageLocal,

    };
  }


   Map<String, dynamic> toJsonString(){
     return {
       "image": image,
       "name": name,
       "colorBg": colorBg.value.toString(),
       "colorIcon": colorIcon.value.toString(),
       "imageLocal": imageLocal,

     };
   }
}

/*
List<ItemMenuModel> listitemmenu_demo = const [
   ItemMenuModel(image: "assets/icons/plane.png",name: "Food",),
   ItemMenuModel(image: "assets/icons/plane.png",name: "Movie",),
   ItemMenuModel(image: "assets/icons/plane.png",name: "WebSite",),
];*/
