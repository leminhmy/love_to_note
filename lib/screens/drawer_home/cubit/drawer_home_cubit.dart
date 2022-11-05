import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:your_money/models/expenses.dart';
import 'package:your_money/models/item_expenses.dart';
import 'package:your_money/models/item_menu.dart';
import 'package:your_money/models/note_movie.dart';
import 'package:your_money/repository/repository_menu.dart';

import '../../../models/item_food.dart';

part 'drawer_home_state.dart';

class DrawerHomeCubit extends Cubit<DrawerHomeState>{
  DrawerHomeCubit(): super( const DrawerHomeState());

  loadingDrawerHome(){
    List<ItemMenuModel> listItemMenu = RepositoryMenu.listItemMenu;
    List<ItemExpenses> listItemExpenses = RepositoryMenu.listItemExpenses;
    List<NoteMovie> listNoteMovie = RepositoryMenu.listNoteMovie;
    emit(DrawerHomeState(itemDrawer: ItemMenuModel.empty,listItemMenu: listItemMenu,listNoteMovie: listNoteMovie,listItemExpenses: listItemExpenses));
  }

  saveToList(){

    if(state.itemDrawer!.name.isEmpty){
      emit(state.copyWith(messError: "Name is Empty"));
      showDialogAddItem(dialog: AddItemDrawerHomeDialog.error);
      return;
    }

    if(state.itemDrawer!.image.isEmpty && state.itemDrawer!.imageLocal.isEmpty){
      emit(state.copyWith(messError: "Image is Empty"));
      showDialogAddItem(dialog: AddItemDrawerHomeDialog.error);
      return;
    }
    showDialogAddItem(dialog: AddItemDrawerHomeDialog.success);
    RepositoryMenu().insertItemListMenu(state.itemDrawer!);
  }

  editName(String text){
    state.itemDrawer!.name = text;
    reloadAddItemDrawer(reload: AddItemDrawerHomeReload.name);
  }

  selectedIcon(String urlIcon){
    state.itemDrawer!.imageLocal = "";
    state.itemDrawer!.image = urlIcon;
    reloadAddItemDrawer(reload: AddItemDrawerHomeReload.image);
  }

  selectedImage(String imageLocal){
    state.itemDrawer!.image = "";
    state.itemDrawer!.imageLocal = imageLocal;
    reloadAddItemDrawer(reload: AddItemDrawerHomeReload.image);
  }

  editColorBg(Color color){
    state.itemDrawer!.colorBg = color;
    reloadAddItemDrawer(reload: AddItemDrawerHomeReload.color);
  }
  editColorIcon(Color color){
    state.itemDrawer!.colorIcon = color;
    reloadAddItemDrawer(reload: AddItemDrawerHomeReload.image);
  }


  reloadAddItemDrawer({required AddItemDrawerHomeReload reload}){
    emit(state.copyWith(addItemReload: reload));
    emit(state.copyWith(addItemReload: AddItemDrawerHomeReload.empty));

  }

  showDialogAddItem({required AddItemDrawerHomeDialog dialog}){
    emit(state.copyWith(addItemDialog: dialog));
    emit(state.copyWith(addItemDialog: AddItemDrawerHomeDialog.empty));
  }

  reloadListMenu(){
    reloadWidget(widgetReload: DrawerHomeReload.listMenu);
  }

  reloadWidget({required DrawerHomeReload widgetReload}){
    emit(state.copyWith(reload: widgetReload));
    emit(state.copyWith(reload: DrawerHomeReload.empty));

  }
}