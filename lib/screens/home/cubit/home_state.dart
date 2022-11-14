
part of 'home_cubit.dart';

enum HomeReload {empty, balance, listTransactions, themeColor, switchPage}

class HomeState extends Equatable{
  final int value;
  final Expenses? expenses;
  final List<ItemExpenses> listItemExpenses;
  final HomeReload reload;
  final bool isHomePage;
   const HomeState({this.isHomePage = true,this.listItemExpenses = const [],this.reload = HomeReload.empty,this.value = 0,this.expenses});

  @override
  // TODO: implement props
  List<Object?> get props => [isHomePage,listItemExpenses,reload,value,expenses];

  HomeState copyWith({bool? isHomePage,List<ItemExpenses>? listItemExpenses,HomeReload? reload,int? value,Expenses? expenses}){
    return HomeState(
      value: value??this.value,
      expenses: expenses??this.expenses,
      reload: reload??this.reload,
      listItemExpenses: listItemExpenses??this.listItemExpenses,
      isHomePage: isHomePage??this.isHomePage,
    );
  }
}

