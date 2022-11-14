import 'package:your_money/uitls/app_format.dart';

import 'locate_config.dart';

class AppLang{

  static Map<String, String> locate = LocaleConfig.locateDefault;

  static String lang(String lang){
    String value = locate[lang]?.toString()??"";
    return value;
  }
  changeLocate(){
    locate = LocaleConfig.locateDefault;
  }
  static List<String> weekDays(){
    if(LocaleConfig.keyLang == "vi")
      {
        return ["Thứ 2", "Thứ 3"," Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7", "Chủ Nhật"];
      }
    return ["Sunday", "Monday","Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
  }

  static String formatPrice(var price){
    if(LocaleConfig.keyLang == "vi"){
      return AppFormat.numberFormatPriceVi(price);
    }
    return AppFormat.numberFormatPriceEn(price);
  }

  static List<String> listValueStatistics(double value){
    if(LocaleConfig.keyLang == "vi"){
      return AppFormat.listValueToVerticalAxisVi(value);
    }
    return AppFormat.listValueToVerticalAxisEn(value);
  }

  static double formatPriceTextField(String string){
    if(LocaleConfig.keyLang == "vi"){
      return double.parse(string.replaceAll(RegExp('[^0-9]'), ""));
    }
    return double.parse(string.replaceAll(RegExp('[^0-9.]'), ""));
  }

}

class LangCode{
  //Home page
  static const String welcome = "welcome";
  static const String theRemainingBalance = "total-balance";
  static const String income = "income";
  static const String expenses = "expenses";
  static const String transactions = "transactions";
  static const String viewAll = "view-all";
  //drawer home
  static const String manageList = "manage-list";
  static const String setting = "setting";
  static const String help = "help";
  //transaction page
  static const String statistical = "statistics-of-spending-per-%-of-income";
  static const String date = "date";
  static const String ascending = "ascending";
  static const String descending = "descending";
  static const String noteMovie = "note-movie";
  static const String allExpenses = "all-expenses";
  static const String allIncome = "all-income";
  static const String price = "price";
  static const String name = "name";
  static const String quantity = "quantity";
  static const String choose = "selected";
  static const String addSuccess = "add-success";
  static const String nameIsEmpty = "name-is-empty";
  static const String imageIsEmpty = "image-is-empty";
  static const String expensesList = "expenses-list";
  static const String movieList = "movie-list";
  static const String search = "search";
  static const String items = "items";
  static const String showTimes = "show-times";
  static const String setColorBackgroundIcon = "set-color-background-icon";
  static const String setColorIcon = "set-color-icon";
  static const String category = "category";
  static const String backup = "backup";
  static const String backupList = "backup-list";
  static const String delete = "delete";
  static const String accept = "accept";
  static const String nameUsed = "name-used";
  static const String noAccount = "no-account";
  static const String cancel = "cancel";
  static const String recommend = "recommend";
  static const String backupCurrentVersion = "backup-current-version";
  static const String recoveryBackup = "recovery-backup";
  //food list page
}