

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:your_money/models/expenses.dart';
import 'package:your_money/repository/repository_menu.dart';

class StorageSecure{
  static const _storage =  FlutterSecureStorage();

  static const _keyExpenses = "expenses";

  static Future saveAllData(Expenses expenses) async{
    await _storage.delete(key: _keyExpenses);
    await _storage.write(key: _keyExpenses, value: jsonEncode(expenses.toJsonString()));

  }
  static Future<Expenses> getAllData() async{
    final expenses = await _storage.read(key: _keyExpenses);

    if(expenses?.isNotEmpty??false) return Expenses.fromJson(jsonDecode(expenses!));
    return Expenses.empty;
  }
}