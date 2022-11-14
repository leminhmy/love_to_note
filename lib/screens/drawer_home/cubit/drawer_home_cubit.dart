import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:your_money/app/locate/lang_code.dart';
import 'package:your_money/models/expenses.dart';
import 'package:your_money/models/item_expenses.dart';
import 'package:your_money/models/item_menu.dart';
import 'package:your_money/models/note_movie.dart';
import 'package:your_money/models/user_model.dart';
import 'package:your_money/repository/repository_auth.dart';
import 'package:your_money/repository/repository_menu.dart';

import '../../../models/item_food.dart';

part 'drawer_home_state.dart';

class DrawerHomeCubit extends Cubit<DrawerHomeState>{
  DrawerHomeCubit(): super( const DrawerHomeState());


  loadingDrawerHome(){
    List<ItemMenuModel> listItemMenu = RepositoryMenu.listItemMenu;
    List<ItemExpenses> listItemExpenses = RepositoryMenu.listItemExpenses;
    List<NoteMovie> listNoteMovie = RepositoryMenu.listNoteMovie;
    emit(DrawerHomeState(logged: false,itemDrawer: ItemMenuModel.empty,listItemMenu: listItemMenu,listNoteMovie: listNoteMovie,listItemExpenses: listItemExpenses));
    loadingCurrentUser();
    streamUser();
  }

  reloadData() async{
    Expenses ex =  RepositoryMenu.expenses;
    List<ItemMenuModel> listItemMenu = ex.listItemMenu;
    List<ItemExpenses> listItemExpenses = ex.listItemExpenses;
    List<NoteMovie> listNoteMovie = ex.listNoteMovie;
    emit(state.copyWith(itemDrawer: ItemMenuModel.empty,listItemMenu: listItemMenu,listNoteMovie: listNoteMovie,listItemExpenses: listItemExpenses));
  }



  loadingCurrentUser(){
    UserModel userModel = RepositoryAuth.currentUser;
    if(userModel.uid != ""){
      emit(state.copyWith(currentUser: userModel,logged: true));
    }else{
      emit(state.copyWith(currentUser: userModel,logged: false));
    }
  }

  streamUser(){
    RepositoryAuth.streamUser.listen((event) {
      print("listen user from drawer home");
      Future.delayed(const Duration(seconds: 2),(){
        print(RepositoryAuth.currentUser.toJson());
        loadingCurrentUser();
      });
    });
  }


  signOut(){
    RepositoryAuth().signOut();
    emit(state.copyWith(currentUser: UserModel.empty,logged: false));
  }

  logInWithGoogle(){
    RepositoryAuth().loginWithGoogle();
  }

  saveToList(){
    if(state.itemDrawer!.name.isEmpty){
      emit(state.copyWith(messError: AppLang.lang(LangCode.nameIsEmpty)));
      showDialogAddItem(dialog: AddItemDrawerHomeDialog.error);
      return;
    }

    if(state.itemDrawer!.image.isEmpty && state.itemDrawer!.imageLocal.isEmpty){
      emit(state.copyWith(messError: AppLang.lang(LangCode.imageIsEmpty)));
      showDialogAddItem(dialog: AddItemDrawerHomeDialog.error);
      return;
    }
    showDialogAddItem(dialog: AddItemDrawerHomeDialog.success);
    RepositoryMenu().insertItemListMenu(state.itemDrawer!);
  }

  //add item new
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
  showDialogAddItem({required AddItemDrawerHomeDialog dialog}){
    emit(state.copyWith(addItemDialog: dialog));
    emit(state.copyWith(addItemDialog: AddItemDrawerHomeDialog.empty));
  }

  //delete
  deleteItemMenu(int index){
   RepositoryMenu().deleteItemMenu(index);
  }

  deleteItemExpenses(int index){
    RepositoryMenu().deleteItemExpenses(index);
  }

  deleteItemNoteMovie(int index){
    RepositoryMenu().deleteItemNoteMovie(index);
  }

  //reload
  reloadAddItemDrawer({required AddItemDrawerHomeReload reload}){
    emit(state.copyWith(addItemReload: reload));
    emit(state.copyWith(addItemReload: AddItemDrawerHomeReload.empty));

  }

  reloadListMenu(){
    reloadWidget(widgetReload: DrawerHomeReload.listMenu);
  }

  reloadWidget({required DrawerHomeReload widgetReload}){
    emit(state.copyWith(reload: widgetReload));
    emit(state.copyWith(reload: DrawerHomeReload.empty));

  }
}