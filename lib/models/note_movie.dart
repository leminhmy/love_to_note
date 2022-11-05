import 'item_movie.dart';

class NoteMovie {
  final String name;
  final String image;
   List<Weekdays> listDay;

   NoteMovie({required this.name, required this.listDay, required this.image});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "listDay": listDay.map((e) => e.toJson()).toList(),
    };
  }

  factory NoteMovie.fromJson(Map<String, dynamic> json) {
    return NoteMovie(
      name: json['name']??"",
      image: json['image']??"",
      listDay: List<Map<String, dynamic>>.from(json["listDay"]).map((e) => Weekdays.fromJson(e)).toList(),
    );
  }
}

class Weekdays {
  final String? name;
   List<ItemMovie> listItemDay;

   Weekdays({
    this.name,
    required this.listItemDay,
  });

  factory Weekdays.fromJson(Map<String, dynamic> json) {
    return Weekdays(
        name: json['name']??"",
        listItemDay: List<Map<String, dynamic>>.from(json["listItemDay"]??[]).map((e) => ItemMovie.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "itemMovie": listItemDay.map((e) => e.toJson()).toList(),
    };
  }
}

/*
List<NoteMovie> listNoteMovie_demo = [
  NoteMovie(id: "0", name: "Movie", listDay: [
    Weekdays( name: "Thứ 2", listItemDay: [
      ItemMovie(id: "0", name: "Lực Bạt Sơn Hà",image: "assets/images/movie_bg.jpg"),
      ItemMovie(id: "1", name: "Lực Bạt Sơn Hà2",image: "assets/images/movie_bg.jpg"),
    ]),
    Weekdays( name: "Thứ 3", listItemDay: [
      ItemMovie(id: "0", name: "Lực Bạt Sơn HàT3",image: "assets/images/movie_bg.jpg"),
    ]),
    Weekdays( name: "Thứ 4", listItemDay: [
      ItemMovie(id: "0", name: "Lực Bạt Sơn HàT4",image: "assets/images/movie_bg.jpg"),
    ]),
    Weekdays( name: "Thứ 5", listItemDay: [
      ItemMovie(id: "0", name: "Lực Bạt Sơn HàT5",image: "assets/images/movie_bg.jpg"),
    ]),
    Weekdays(id: "4", name: "Thứ 6", listItemDay: [
      ItemMovie(id: "0", name: "Lực Bạt Sơn HàT6",image: "assets/images/movie_bg.jpg"),
    ]),
    Weekdays(id: "5", name: "Thứ 7", listItemDay: [
      ItemMovie(id: "0", name: "Lực Bạt Sơn HàT7",image: "assets/images/movie_bg.jpg"),
    ]),
    Weekdays(id: "6", name: "Chủ Nhật", listItemDay: [
      ItemMovie(id: "0", name: "Lực Bạt Sơn Hà",image: "assets/images/movie_bg.jpg"),
      ItemMovie(id: "0", name: "Lực Bạt Sơn HàCn",image: "assets/images/movie_bg.jpg"),
    ]),
  ]),
  NoteMovie(id: "0", name: "Comic", listDay: [
    Weekdays(id: "0", name: "Thứ 2", listItemDay: [
      ItemMovie(id: "0", name: "Vạn đồ hải quốc",image: "assets/images/movie_bg.jpg"),
      ItemMovie(id: "1", name: "Vạn đồ hải quốc2",image: "assets/images/movie_bg.jpg"),
    ]),
    Weekdays(id: "1", name: "Thứ 3", listItemDay: [
      ItemMovie(id: "0", name: "Vạn đồ hải quốcT3",image: "assets/images/movie_bg.jpg"),
    ]),
    Weekdays(id: "2", name: "Thứ 4", listItemDay: [
      ItemMovie(id: "0", name: "Vạn đồ hải quốcT4",image: "assets/images/movie_bg.jpg"),
    ]),
    Weekdays(id: "3", name: "Thứ 5", listItemDay: [
      ItemMovie(id: "0", name: "Vạn đồ hải quốcT5",image: "assets/images/movie_bg.jpg"),
    ]),
    Weekdays(id: "4", name: "Thứ 6", listItemDay: [
      ItemMovie(id: "0", name: "Vạn đồ hải quốcT6",image: "assets/images/movie_bg.jpg"),
    ]),
    Weekdays(id: "5", name: "Thứ 7", listItemDay: [
      ItemMovie(id: "0", name: "Vạn đồ hải quốcT7",image: "assets/images/movie_bg.jpg"),
    ]),
    Weekdays(id: "6", name: "Chủ Nhật", listItemDay: [
      ItemMovie(id: "0", name: "Vạn đồ hải quốc",image: "assets/images/movie_bg.jpg"),
      ItemMovie(id: "0", name: "Vạn đồ hải quốcCn",image: "assets/images/movie_bg.jpg"),
    ]),
  ]),
];*/
