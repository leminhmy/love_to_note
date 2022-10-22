
import 'item.dart';

class Category{
  final String id;
  final String name;
  final String? image;
  final String? nameNote;
  final String? nameNote2;
  final List<Item>? listItem;

  Category({
    required this.id,
    required this.name,
     this.nameNote,
     this.image,
     this.nameNote2,
     this.listItem,
});

  Map<String, dynamic> toJson(){
    return {
      "id":id,
      "name":name,
      "image":image,
      "nameNote":nameNote,
      "nameNote2":nameNote2,
      "listItem":listItem?.map((e) => e.toJson()),

    };
  }
}