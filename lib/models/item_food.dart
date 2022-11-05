
import 'dart:ui';

import 'package:your_money/uitls/image_assets.dart';
import 'package:your_money/uitls/theme_color.dart';

class ItemFood{
   String name;
   String image;
   String imageLocal;
   Color colorBg;
   Color colorIcon;
   int quantity;
   double price;


  ItemFood({
    required this.name,
    required this.quantity,
    required this.image,
     required this.colorBg,
     required this.colorIcon,
     required this.imageLocal,
    required this.price,
  });

  static ItemFood empty = ItemFood(name: "",colorBg: ThemeColor.colorRed,colorIcon: ThemeColor.colorWhile,quantity: 1, imageLocal: "",image: ImageAssets.noImage, price: 0);
   bool get isEmpty => this == ItemFood.empty;
   bool get isNotEmpty => this != ItemFood.empty;

  Map<String, dynamic> toJson(){
    return {
      "name":name,
      "image":image,
      "colorBg":colorBg,
      "colorIcon":colorIcon,
      "imageLocal":imageLocal,
      "quantity":quantity,
      "price":price,
    };
  }
   Map<String, dynamic> toJsonString(){
     return {
       "name":name,
       "image":image,
       "colorBg":colorBg.value.toString(),
       "colorIcon":colorIcon.value.toString(),
       "imageLocal":imageLocal.toString(),
       "quantity":quantity.toString(),
       "price":price.toString(),
     };
   }

   factory ItemFood.fromJson(Map<String, dynamic> json){
     return ItemFood(
       name: json['name'],
       colorBg: json['colorBg'],
       image: json['image'],
       colorIcon: json['colorIcon'],
       imageLocal: json['imageLocal'],
       quantity: json['quantity'],
       price: json['price'],
     );
   }

   factory ItemFood.fromJsonString(Map<String, dynamic> json){
     return ItemFood(
       name: json['name'],
       colorBg: Color(int.parse(json['colorBg'])),
       image: json['image'],
       colorIcon: Color(int.parse(json['colorIcon'])),
       imageLocal: json['imageLocal'],
       quantity: int.parse(json['quantity']),
       price: double.parse(json['price']),
     );
   }

}