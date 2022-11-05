import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/models/item_food.dart';
import 'package:your_money/repository/repository_menu.dart';

import '../../../models/item_expenses.dart';

part 'expenses_transaction_state.dart';

class ExpensesTransactionCubit extends Cubit<ExpensesTransactionState> {
  ExpensesTransactionCubit() : super(const ExpensesTransactionState());


  List<ItemExpenses> listItem = [];
  List<String> listNameItemExpenses = [];
  double totalPrice = 0;
  double totalPriceItem = 0;
  double totalPriceIncome = 0;
  loadingExpensesTransaction(){
    listItem = RepositoryMenu.listItemExpenses;
    totalPrice = RepositoryMenu.expenses.expensesMoney;
    totalPriceIncome = RepositoryMenu.expenses.incomeMoney;

    listNameItemExpenses = RepositoryMenu.listItemExpenses.map((e) {
      return e.name;
    }).toList();

    emit(ExpensesTransactionState(totalPriceIncome: totalPriceIncome,totalPrice: totalPrice,listItemExpenses: listItem,listNameItemExpenses: listNameItemExpenses));
    fnPriceChart(true);
  }

  reloadChart(){
    totalPriceIncome = RepositoryMenu.expenses.incomeMoney;
    emit(state.copyWith(totalPriceIncome: totalPriceIncome));
    reloadWidget(ExpensesTransactionReload.chart);
  }
  
  changeListExpenses(int index){
    if(index== 0){
      emit(state.copyWith(isListAll: true,totalPrice: totalPrice));
      reloadWidget(ExpensesTransactionReload.listItem);
      fnPriceChart(true);
      return;
    }
    fnTotalPriceItem(index-1);
    emit(state.copyWith(isListAll: false,listItemFood: listItem[index-1].listItem));
    reloadWidget(ExpensesTransactionReload.listItem);
    fnPriceChart(false);
  }

  fnPriceChart(bool isListAll){
    List<double> listValue = [];
    if(isListAll){
      listValue = state.listItemExpenses.map((e) => e.price).toList();
    }else{
      listValue = state.listItemFood.map((e) => e.price).toList();
    }
    emit(state.copyWith(listValueChart: listValue));
    reloadWidget(ExpensesTransactionReload.chart);
  }

  fnTotalPriceItem(int index){
    totalPriceItem = 0;
    for (var element in listItem[index].listItem) {
      totalPriceItem += element.price;
    }
    emit(state.copyWith(totalPrice: totalPriceItem));
    reloadWidget(ExpensesTransactionReload.totalPrice);
  }

  
  reloadWidget(ExpensesTransactionReload reload){
    emit(state.copyWith(reload: reload));
    emit(state.copyWith(reload: ExpensesTransactionReload.empty));
  }

}
