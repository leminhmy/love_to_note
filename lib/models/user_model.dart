
class UserModel{
  final String uid;
  final String name;
  final String image;

  const UserModel({
    required this.uid,
    required this.name,
    required this.image,
});
  static const empty = UserModel(uid: "", name: "", image: "");
  bool get isEmpty => this == UserModel.empty;
  bool get isNotEmpty => this != UserModel.empty;

  Map<String, dynamic> toJson(){
    return {
      "uid": uid,
      "name": name,
      "image": image,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      uid: json['uid']??"",
      name: json['name']??"",
      image: json['image']??"",
    );
  }
}