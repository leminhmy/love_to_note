
part of 'detail_item_food_cubit.dart';
enum DetailItemFoodReload {empty, listItem}

class DetailItemFoodState extends Equatable{
  final int value;
  final List<ItemFood> listItemFood;
  final int indexListExpenses;
  final List<ItemExpenses> listItemExpenses;
  final DetailItemFoodReload reload;
  const DetailItemFoodState({this.listItemExpenses = const [],this.indexListExpenses = 0,this.reload = DetailItemFoodReload.empty,this.listItemFood = const [],this.value = 0});

  @override
  // TODO: implement props
  List<Object?> get props => [listItemExpenses,indexListExpenses,reload,listItemFood,value];

  DetailItemFoodState copyWith({List<ItemExpenses>? listItemExpenses,int? indexListExpenses,DetailItemFoodReload? reload,List<ItemFood>? listItemFood,int? value}){
    return DetailItemFoodState(
      value: value??this.value,
      listItemFood: listItemFood??this.listItemFood,
      reload: reload??this.reload,
      indexListExpenses: indexListExpenses??this.indexListExpenses,
      listItemExpenses: listItemExpenses??this.listItemExpenses,
    );
  }
}