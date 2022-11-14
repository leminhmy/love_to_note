import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:your_money/models/expenses.dart';

class BackupData {
  final String id;
  final String name;
  final String date;
  final Expenses expenses;

  const BackupData({
    required this.id,
    required this.name,
    required this.date,
    required this.expenses,
  });

  factory BackupData.formSnapshot(QueryDocumentSnapshot snap) {
    return BackupData(
        id: snap.id,
        name: snap["name"],
        date: snap["date"],
        expenses: Expenses.fromJson(snap["expenses"]));
  }

  factory BackupData.fromJson(Map<String, dynamic> json) {
    return BackupData(
        id: json["id"],
        name: json["name"],
        date: json["date"],
        expenses: Expenses.fromJson(json["expenses"]));
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "date": date,
      "expenses": expenses.toJsonString(),
    };
  }


}
