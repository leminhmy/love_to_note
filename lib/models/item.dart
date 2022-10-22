
class Item{
  final String id;
  final String name;
  final String? image;
  final String? nameNote;
  final String? nameNote2;

  Item({
    required this.id,
    required this.name,
    this.nameNote,
    this.image,
    this.nameNote2,
  });


  Map<String, dynamic> toJson(){
    return {
      "id":id,
      "name":name,
      "image":image,
      "nameNote":nameNote,
      "nameNote2":nameNote2,
    };
  }

}