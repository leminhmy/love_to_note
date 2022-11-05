part of 'expenses_transaction_cubit.dart';

enum ExpensesTransactionReload{empty, chart, listItem, totalPrice,}
class ExpensesTransactionState extends Equatable{
  final List<ItemExpenses> listItemExpenses;
  final List<ItemFood> listItemFood;
  final ExpensesTransactionReload reload;
  final List<String> listNameItemExpenses;
  final bool isListAll;
  final double totalPrice;
  final double totalPriceIncome;
  final List<double> listValueChart;
  const ExpensesTransactionState({this.listValueChart = const[],this.totalPriceIncome = 0,this.totalPrice = 0,this.listItemFood = const [],this.isListAll = true,this.listNameItemExpenses = const [],this.reload = ExpensesTransactionReload.empty,this.listItemExpenses = const []});

  @override
  // TODO: implement props
  List<Object?> get props => [listValueChart,totalPriceIncome,totalPrice,listItemFood,isListAll,listNameItemExpenses,reload,listItemExpenses];

  ExpensesTransactionState copyWith({List<double>? listValueChart,double? totalPriceIncome,double? totalPrice,List<ItemFood>? listItemFood,bool? isListAll,List<String>? listNameItemExpenses,ExpensesTransactionReload? reload,List<ItemExpenses>? listItemExpenses}){
    return ExpensesTransactionState(
        listItemExpenses:listItemExpenses??this.listItemExpenses,
      reload:reload??this.reload,
      listNameItemExpenses:listNameItemExpenses??this.listNameItemExpenses,
      isListAll:isListAll??this.isListAll,
      listItemFood:listItemFood??this.listItemFood,
      totalPrice:totalPrice??this.totalPrice,
      totalPriceIncome:totalPriceIncome??this.totalPriceIncome,
      listValueChart:listValueChart??this.listValueChart,
    );
  }
}