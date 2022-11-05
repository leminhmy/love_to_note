import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:your_money/core/type/enum.dart';
import 'package:your_money/models/expenses.dart';
import 'package:your_money/models/item_expenses.dart';
import 'package:your_money/repository/repository_menu.dart';
import 'package:your_money/screens/home/home.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState>{
   HomeCubit(): super( const HomeState());

   loadingHome(){
      RepositoryMenu().updateTotalPriceExpenses();
      Expenses expenses = RepositoryMenu.expenses;
      List<ItemExpenses> listItem  = RepositoryMenu.listItemExpenses;
      emit(HomeState(expenses: expenses,listItemExpenses: listItem));
   }


   textReloadMulti(){
      reloadWidget(widgetReload: HomeReload.balance);
   }
   reloadWidget({required HomeReload widgetReload}){
      //
      emit(state.copyWith(reload: widgetReload));

      emit(state.copyWith(reload: HomeReload.empty));
   }
}

