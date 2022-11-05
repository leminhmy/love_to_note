import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:your_money/models/item_expenses.dart';
import 'package:your_money/models/item_food.dart';
import 'package:your_money/repository/repository_menu.dart';
import 'package:your_money/uitls/icons_assets.dart';

part 'add_item_food_state.dart';

class AddItemFoodCubit extends Cubit<AddItemFoodState>{
  int indexCategory;
  AddItemFoodCubit({required this.indexCategory}): super( AddItemFoodState(itemFood: ItemFood.empty));





  saveToList(){

    if(state.itemFood.name.isEmpty){
      emit(state.copyWith(messError: "Name is Empty"));
      showDialog(AddItemFoodDialog.error);
      return;
    }
    if(state.itemFood.price < 1 ){
      emit(state.copyWith(messError: "Price > 1"));
      showDialog(AddItemFoodDialog.error);
      return;
    }
    if(state.itemFood.image.isEmpty && state.itemFood.imageLocal.isEmpty){
      emit(state.copyWith(messError: "Image is Empty"));
      showDialog(AddItemFoodDialog.error);
      return;
    }
    showDialog(AddItemFoodDialog.success);
    RepositoryMenu().insertItemListFood(indexCategory: indexCategory, itemFood: state.itemFood);
  }

  editName(String text){
    state.itemFood.name = text;
    reloadWidget(AddItemFoodReload.name);
  }

  editColorBg(Color color){
    state.itemFood.colorBg = color;
    reloadWidget(AddItemFoodReload.color);
  }
  editColorIcon(Color color){
    state.itemFood.colorIcon = color;
    reloadWidget(AddItemFoodReload.color);
  }

  editPrice(double price){
    state.itemFood.price = price * state.itemFood.quantity;
    reloadWidget(AddItemFoodReload.price);
  }

  editQuantity(int quantity, double price){
    state.itemFood.quantity = quantity;
    state.itemFood.price = price * quantity;
    reloadWidget(AddItemFoodReload.quantity);
    reloadWidget(AddItemFoodReload.price);
  }

  selectedImage(String imageLocal){
    state.itemFood.image = "";
    state.itemFood.imageLocal = imageLocal;
    reloadWidget(AddItemFoodReload.image);
  }



  reloadWidget(AddItemFoodReload reload){
    emit(state.copyWith(reload: reload));
    emit(state.copyWith(reload: AddItemFoodReload.empty));

  }

  showDialog(AddItemFoodDialog statusDialog){
    emit(state.copyWith(showDialog: statusDialog));
    emit(state.copyWith(showDialog: AddItemFoodDialog.empty));
  }

  selectedIcon(String urlIcon){
    state.itemFood.imageLocal = "";
    state.itemFood.image = urlIcon;
    reloadWidget(AddItemFoodReload.image);
  }

}