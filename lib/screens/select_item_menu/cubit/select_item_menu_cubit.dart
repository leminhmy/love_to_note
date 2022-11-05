import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:your_money/models/item_expenses.dart';
import 'package:your_money/models/item_menu.dart';

import '../../../models/note_movie.dart';
import '../../../repository/repository_menu.dart';

part 'select_item_menu_state.dart';

class SelectItemMenuCubit extends Cubit<SelectItemMenuState>{
  final int indexItemMenu;
  SelectItemMenuCubit({required this.indexItemMenu}): super( const SelectItemMenuState());

   late ItemMenuModel itemMenu;


  loadingItemMenu(){
    itemMenu = RepositoryMenu.listItemMenu[indexItemMenu];
  }


  selectedWidgetFood(){
    if(itemMenu.isEmpty) {
      return;
    }
    RepositoryMenu().insertItemListItemExpenses(itemMenu);
    RepositoryMenu().deleteItemMenu(indexItemMenu);
  }
  selectedWidgetMovie(){
    if(itemMenu.isEmpty) {
      return;
    }
    RepositoryMenu().insertItemListNoteMovie(itemMenu);
    RepositoryMenu().deleteItemMenu(indexItemMenu);
  }


}