
class ItemMovie{
  final String name;
  final String image;


 const ItemMovie({
    required this.name,
    required this.image,
  });

  static ItemMovie empty = const ItemMovie(name: "",image: "");
  bool get isEmpty => this == ItemMovie.empty;
  bool get isNotEmpty => this != ItemMovie.empty;

  factory ItemMovie.fromJson(Map<String, dynamic> json){
    return ItemMovie(
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "name":name,
      "image":image,

    };
  }

}