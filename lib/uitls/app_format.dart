import 'dart:io';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';


class AppFormat{
 static String _formatNumber(String s) => NumberFormat.decimalPattern('vi').format(double.parse(s));

  static String numberFormatPriceVi(var price){
    String number =  NumberFormat.currency(
        locale: 'vi', decimalDigits: 0,
    ).format(price);
    return number;

  }

 static String dateTime(String time) {
   DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss")
       .parse(time);
   DateFormat outputFormat = DateFormat.yMd().add_Hm();
   String outputDate = outputFormat.format(parseDate);
   return outputDate;
 }

 static String numberFormatPriceEn(var price){
   String number =  NumberFormat.currency(
     locale: 'en', decimalDigits: 2,customPattern:'#,### \$',
   ).format(price);
   return number;

 }

  static TextEditingValue formatNumberTextField(String string){
    string = _formatNumber(string.replaceAll('.',''));
    return TextEditingValue(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }


  static Future<String> getImageFileFormAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file.path;
  }

  static List<String> listValueToVerticalAxisEn(double value){
    List<String> listItem = [];
    double price = value.ceilToDouble();
    listItem = List.generate(4, (index) {

      double value = (price * (0.25 * (index +1)))/*(price-(index+1)/1000)*/;
      if(value>=1000000000){
        value/=1000000000;
        return "${value.toInt()}B";
      }
      if(value>=1000000){
        value/=1000000;
        return "${value.toInt()}M";
      }
      value /=1000;
      if(value>=10){
        return "${value.toInt()}K";
      }
      return "${value.toStringAsFixed(1)}K";

    });

    return listItem.reversed.toList();
  }


 static List<String> listValueToVerticalAxisVi(double value){
   List<String> listItem = [];
   double price = value.ceilToDouble();
   listItem = List.generate(4, (index) {

     double value = (price * (0.25 * (index +1)))/*(price-(index+1)/1000)*/;
     if(value>=1000000000){
       value/=1000000000;
       return "${value.toInt()}T";
     }
     if(value>=1000000){
       value/=1000000;
       return "${value.toInt()}Tr";
     }
     value /=1000;
     if(value>=10){
       return "${value.toInt()}K";
     }
     return "${value.toStringAsFixed(1)}K";

   });

   return listItem.reversed.toList();
 }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

