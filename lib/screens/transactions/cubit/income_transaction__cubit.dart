import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:your_money/uitls/theme_color.dart';

import '../../../models/item_food.dart';
import '../../../repository/repository_menu.dart';

part 'income_transaction__state.dart';

class IncomeTransactionCubit extends Cubit<IncomeTransactionState> {
  IncomeTransactionCubit()
      : super(IncomeTransactionState(itemFood: ItemFood.empty));

  List<ItemFood> listItemIncome = RepositoryMenu.listItemIncome;

  loadingIncomeTransaction() {
    emit(IncomeTransactionState(
        itemFood: ItemFood.empty, listItemIncome: listItemIncome));
    if(listItemIncome.isNotEmpty){
      totalPrice();
    }
  }



  //sort list
  sortList(int index) {
    List<ItemFood> sortListItemIncome = List.from(listItemIncome);
    if (index == 0) {
      emit(state.copyWith(listItemIncome: listItemIncome));
    }
    if (index == 1) {
      sortListItemIncome.sort((a, b) => a.price.compareTo(b.price));
      emit(state.copyWith(listItemIncome: sortListItemIncome));
    }
    if (index == 2) {
      sortListItemIncome.sort((a, b) => b.price.compareTo(a.price));
      emit(state.copyWith(listItemIncome: sortListItemIncome));
    }
    reloadWidget(AddIncomeTransactionReload.listItemInCome);
  }

  totalPrice() {
    double totalPrice = 0;
    for (var element in listItemIncome) {
      totalPrice+=element.price;
    }
    emit(state.copyWith(totalPrice: totalPrice));
    reloadWidget(AddIncomeTransactionReload.totalPrice);
  }

  //remove
  deleteItemIncome(ItemFood itemIncome) {
    RepositoryMenu().deleteItemIncome(itemIncome);
    // reloadWidget(AddIncomeTransactionReload.listItemInCome);
    totalPrice();
  }

  //AddItemInCome
  saveToList() {
    if (state.itemFood.name.isEmpty) {
      emit(state.copyWith(messError: "Name is Empty"));
      showDialog(AddIncomeTransactionDialog.error);
      return;
    }
    if (state.itemFood.price < 1) {
      emit(state.copyWith(messError: "Price > 1"));
      showDialog(AddIncomeTransactionDialog.error);
      return;
    }
    if (state.itemFood.image.isEmpty && state.itemFood.imageLocal.isEmpty) {
      emit(state.copyWith(messError: "Image is Empty"));
      showDialog(AddIncomeTransactionDialog.error);
      return;
    }
    showDialog(AddIncomeTransactionDialog.success);
    RepositoryMenu().insertItemListIncome(state.itemFood);
  }

  editName(String text) {
    state.itemFood.name = text;
    reloadWidget(AddIncomeTransactionReload.name);
  }

  editColorBg(Color color) {
    state.itemFood.colorBg = color;
    reloadWidget(AddIncomeTransactionReload.color);
  }

  editColorIcon(Color color) {
    state.itemFood.colorIcon = color;
    reloadWidget(AddIncomeTransactionReload.color);
  }

  editPrice(double price) {
    state.itemFood.price = price * state.itemFood.quantity;
    reloadWidget(AddIncomeTransactionReload.price);
  }

  editQuantity(int quantity, double price) {
    state.itemFood.quantity = quantity;
    state.itemFood.price = price * quantity;
    reloadWidget(AddIncomeTransactionReload.quantity);
    reloadWidget(AddIncomeTransactionReload.price);
  }

  selectedImage(String imageLocal) {
    state.itemFood.image = "";
    state.itemFood.imageLocal = imageLocal;
    reloadWidget(AddIncomeTransactionReload.image);
  }


  selectedIcon(String urlIcon) {
    state.itemFood.imageLocal = "";
    state.itemFood.image = urlIcon;
    reloadWidget(AddIncomeTransactionReload.image);
  }

  //reload

  reloadListItemIncome() {
    reloadWidget(AddIncomeTransactionReload.listItemInCome);
    totalPrice();

  }

  reloadWidget(AddIncomeTransactionReload reload) {
    emit(state.copyWith(reload: reload));
    emit(state.copyWith(reload: AddIncomeTransactionReload.empty));

  }

  showDialog(AddIncomeTransactionDialog statusDialog) {
    emit(state.copyWith(showDialog: statusDialog));
    emit(state.copyWith(showDialog: AddIncomeTransactionDialog.empty));

  }

}
