
import 'package:your_money/app/locate/lang/vi.dart';
import 'package:your_money/app/locate/lang_code.dart';

import 'lang/en.dart';

class LocaleConfig{

  static Map<String, String> locateDefault = vi;
  static String keyLang = "vi";

 Future<bool> load(String lang) async{
   switch(lang){
     case "vi":
       locateDefault = vi;
       keyLang = "vi";
       break;
     case "en":
       locateDefault = en;
       keyLang = "en";
       break;
     default:
       break;
   }
   AppLang().changeLocate();
   return true;
 }
}