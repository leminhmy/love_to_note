import 'package:your_money/models/item.dart';

import 'category.dart';

class MenuDataStorage {
  final String id;
  final String name;
  final String? type;
  final String? image;
  final List<Category>? listCategory;

  MenuDataStorage({
    required this.id,
    required this.name,
    this.type,
    this.image,
    this.listCategory,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "type": type,
      "listCategory": listCategory?.map((e) => e.toJson()),
    };
  }
}

List<MenuDataStorage> list_menudata_demo = [
  MenuDataStorage(
      id: "1",
      name: "Money",
      image: "assets/icons/money-bag.png",
      type: "food",
      listCategory: [
        Category(
            id: "1",
            name: "Food",
            image: "assets/icons/money-bag.png",
            nameNote: "-\$45.00",
            nameNote2: "EveryDay",
            listItem: [
              Item(
                id: "1", name: "Cheese",
                image: "assets/icons/burger.png",
                nameNote2: "EveryDay",
                nameNote: "-\$45.00"
              )
            ]),
      ]),
  MenuDataStorage(
      id: "1",
      name: "Movie",
      image: "assets/icons/film.png",
      type: "movie",
      listCategory: [
        Category(
            id: "1",
            name: "Movie",
            listItem: [
              Item(
                id: "1", name: "Lực Bạc Sơn Hà",
                image: "assets/images/movie_bg.jpg",
              ),
            ]),
        Category(
            id: "1",
            name: "Comic",
            listItem: [
              Item(
                id: "1", name: "Lực Bạc Sơn Hà Comic",
                image: "assets/images/movie_bg.jpg",

              )
            ]),
      ]),
];
