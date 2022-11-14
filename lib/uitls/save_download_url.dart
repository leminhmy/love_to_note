import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
class SaveDownload{


 Future<String> downloadFile(String url)async{
      var response = await http.get(Uri.parse(url));
      var documentDirectory = await getApplicationDocumentsDirectory();
      var firstPath = "${documentDirectory.path}/images";
      var filePathAndName = '${documentDirectory.path}/images/pic.jpg';

      await Directory(firstPath).create(recursive: true);
      File file2 = File(filePathAndName);
      file2.writeAsBytesSync(response.bodyBytes);


      return filePathAndName;
  }
}