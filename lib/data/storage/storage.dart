

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:your_money/app/locate/locate_config.dart';
import 'package:your_money/models/backup_data.dart';
import 'package:your_money/models/expenses.dart';
import 'package:your_money/models/user_model.dart';
import 'package:your_money/repository/repository_auth.dart';
import 'package:your_money/uitls/theme_color.dart';

import '../../repository/repository_menu.dart';

class StorageSecure{
  static const _storage =  FlutterSecureStorage();

  static const _keyExpenses = "expenses";
  static const _keyThemeColor = "theme-color";
  static const _keyLangCode = "lang-code";
  static const _keyCurrentUser = "current_user";
  static const _keyListBackup = "list-backup";


  //save
  static Future saveAllData() async{
   saveExpenses(await RepositoryMenu().getDataToStorage());
   saveThemeColor(isDarkTheme: ThemeColorDarkLight.isDarkThemeColor);
   saveLangCode(langCode: LocaleConfig.keyLang);
   saveCurrentUser(currentUser: RepositoryAuth.currentUser);
  }

  static Future saveListBackup(List<BackupData> listBackup) async{
    await _storage.delete(key: _keyListBackup);
    await _storage.write(key: _keyListBackup, value: jsonEncode(listBackup));

  }

  static Future saveExpenses(Expenses expenses) async{
    await _storage.delete(key: _keyExpenses);
    await _storage.write(key: _keyExpenses, value: jsonEncode(expenses.toJsonString()));

  }

  static Future saveThemeColor({required bool isDarkTheme}) async{
    await _storage.delete(key: _keyThemeColor);
    await _storage.write(key: _keyThemeColor, value: isDarkTheme?"dark":"light");
  }

  static Future saveLangCode({required String langCode}) async{
    await _storage.delete(key: _keyLangCode);
    await _storage.write(key: _keyLangCode, value: langCode);
  }

  static Future saveCurrentUser({required UserModel currentUser}) async{
    await _storage.delete(key: _keyCurrentUser);
    await _storage.write(key: _keyCurrentUser, value: jsonEncode(currentUser.toJson()));
  }


  //get
  static Future<bool> getAllData() async{
    await getExpenses().then((value) => RepositoryMenu().loadData(value));
    await getThemeColor().then((value) => ThemeColorDarkLight().loadingThemeColor(value));
    await getLangCode().then((value) =>  LocaleConfig().load(value));
    await getCurrentUser().then((value) =>  RepositoryAuth().loadingAuth(value));
    return true;
  }

  static Future<List<BackupData>> getListBackup() async{
    final listBackup = await _storage.read(key: _keyListBackup);

    if(listBackup?.isNotEmpty??false) return  List<Map<String, dynamic>>.from(jsonDecode(listBackup!)).map((e) => BackupData.fromJson(e)).toList();
    return [];
  }

  static Future<Expenses> getExpenses() async{
    final expenses = await _storage.read(key: _keyExpenses);

    if(expenses?.isNotEmpty??false) return Expenses.fromJson(jsonDecode(expenses!));
    return Expenses.empty;
  }

  static Future<bool> getThemeColor() async{
    final value = await _storage.read(key: _keyThemeColor);
    if(value == null){
      return false;
    }
    return value == "dark"?true:false;
  }

  static Future<String> getLangCode() async{
    final value = await _storage.read(key: _keyLangCode);
    if(value == null){
      return "vi";
    }
    return value;
  }

  static Future<UserModel> getCurrentUser() async{
    final value = await _storage.read(key: _keyCurrentUser);
    if(value == null){
      return UserModel.empty;
    }
    return UserModel.fromJson(jsonDecode(value));
  }

}