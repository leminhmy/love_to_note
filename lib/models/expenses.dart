import 'package:flutter/material.dart';
import 'package:your_money/models/item_food.dart';

import 'item_expenses.dart';
import 'item_menu.dart';
import 'note_movie.dart';

class Expenses {
   double expensesMoney;
   double incomeMoney;
   double totalMoney;
   List<ItemExpenses> listItemExpenses;
   List<ItemMenuModel>  listItemMenu;
   List<ItemFood>  listItemIncome;
   List<NoteMovie>  listNoteMovie;

   Expenses({
    required this.expensesMoney,
    required this.incomeMoney,
    required this.totalMoney,
    required this.listItemExpenses,
    required this.listItemIncome,
    required this.listItemMenu,
    required this.listNoteMovie,
  });

  static Expenses empty = Expenses(expensesMoney: 0, incomeMoney: 0, totalMoney: 0, listItemExpenses: [], listNoteMovie: [], listItemIncome: [], listItemMenu: []);
  bool get isEmpty => this == Expenses.empty;
  bool get isNotEmpty => this != Expenses.empty;

   factory Expenses.fromJson(Map<String, dynamic> json){
     return Expenses(
       expensesMoney: json['expensesMoney'],
       incomeMoney: json['incomeMoney'],
       totalMoney: json['totalMoney'],
       listItemExpenses: List<Map<String, dynamic>>.from(json["listItemExpenses"]).map((e) => ItemExpenses.fromJson(e)).toList(),
       listItemIncome: List<Map<String, dynamic>>.from(json["listItemIncome"]).map((e) => ItemFood.fromJsonString(e)).toList(),
       listItemMenu: List<Map<String, dynamic>>.from(json["listItemMenu"]).map((e) => ItemMenuModel.fromJsonString(e)).toList(),
       listNoteMovie: List<Map<String, dynamic>>.from(json["listNoteMovie"]).map((e) => NoteMovie.fromJson(e)).toList(),
     );
   }

  Map<String, dynamic> toJson() {
    return {
      "expensesMoney": expensesMoney,
      "incomeMoney": incomeMoney,
      "totalMoney": totalMoney,
      "listItemExpenses": listItemExpenses.map((e) => e.toJson()).toList(),
      "listItemIncome": listItemIncome.map((e) => e.toJson()).toList(),
      "listItemMenu": listItemMenu.map((e) => e.toJson()).toList(),
      "listNoteMovie": listNoteMovie.map((e) => e.toJson()).toList(),
    };
  }

   Map<String, dynamic> toJsonString() {
     return {
       "expensesMoney": expensesMoney,
       "incomeMoney": incomeMoney,
       "totalMoney": totalMoney,
       "listItemExpenses": listItemExpenses.map((e) => e.toJson()).toList(),
       "listItemIncome": listItemIncome.map((e) => e.toJsonString()).toList(),
       "listItemMenu": listItemMenu.map((e) => e.toJsonString()).toList(),
       "listNoteMovie": listNoteMovie.map((e) => e.toJson()).toList(),
     };
   }
}

