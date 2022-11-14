import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:your_money/models/expenses.dart';
import 'package:your_money/repository/repository_menu.dart';

import '../../../models/item_expenses.dart';
import '../../../models/item_food.dart';

part 'detail_item_food_state.dart';

class DetailItemFoodCubit extends Cubit<DetailItemFoodState>{
  final int indexItem;
  DetailItemFoodCubit({required this.indexItem}): super( const DetailItemFoodState());

  List<ItemExpenses> listItemExpense = [];
  List<ItemFood> listItemFood = [];
  int indexSort = 0;
  loadingDetailItemFood(){
    listItemExpense = RepositoryMenu.listItemExpenses;
    listItemFood = List.from(listItemExpense[indexItem].listItem);
    emit(DetailItemFoodState(listItemFood: listItemFood,indexListExpenses: indexItem,listItemExpenses: listItemExpense));
  }

  search(String query){
    List<ItemFood> listSearch = listItemFood.where((itemFood) {
      final nameLower = itemFood.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();
    emit(state.copyWith(listItemFood: listSearch));
    reloadWidget(widgetReload: DetailItemFoodReload.listItem);
  }

  tabChange(int index){
    emit(state.copyWith(indexListExpenses: index));
    sortItem(indexSort);
  }

  reloadListItemFood(){
    sortItem(0);
  }

  deleteItem(ItemFood itemFood){
    RepositoryMenu().deleteItemListFood(indexCategory: state.indexListExpenses, itemFood: itemFood);
  }

  sortItem(int index)
  {
    indexSort = index;
    listItemFood = List.from(state.listItemExpenses[state.indexListExpenses].listItem);
    if(index == 1){
      listItemFood.sort((a,b) => a.price.compareTo(b.price));

    }
    if(index == 2){
      listItemFood.sort((a,b) => b.price.compareTo(a.price));
    }
    emit(state.copyWith(listItemFood: listItemFood));
    reloadWidget(widgetReload: DetailItemFoodReload.listItem);
  }

  reloadWidget({required DetailItemFoodReload widgetReload}){

    emit(state.copyWith(reload: widgetReload));
    emit(state.copyWith(reload: DetailItemFoodReload.empty));

  }
}