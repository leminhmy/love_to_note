import 'item_food.dart';

class ItemExpenses{
   String name;
   String image;
   double price;
   List<ItemFood> listItem;

   ItemExpenses({
    required this.name,
    required this.image,
    required this.price,
    required this.listItem,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "price": price.toString(),
      "listItem": listItem.map((e) => e.toJsonString()).toList(),
    };
  }
  factory ItemExpenses.fromJson(Map<String, dynamic> json){
    return ItemExpenses(
      name: json['name'],
      image: json['image'],
      price: double.parse(json['price']??"0"),
      listItem: List<Map<String, dynamic>>.from(json["listItem"]).map((e) => ItemFood.fromJsonString(e)).toList(),
    );
  }
}