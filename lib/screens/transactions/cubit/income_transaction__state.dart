part of 'income_transaction__cubit.dart';

enum AddIncomeTransactionReload{empty, image, name, price,quantity ,color, listItemInCome, totalPrice}
enum AddIncomeTransactionDialog{empty, success, error}
class IncomeTransactionState extends Equatable{
  final List<ItemFood> listItemIncome;
  final ItemFood itemFood;
  final String messError;
  final double totalPrice;
  final AddIncomeTransactionReload reload;
  final AddIncomeTransactionDialog showDialog;
  const IncomeTransactionState({this.totalPrice = 0,this.listItemIncome = const [],this.messError = "",this.showDialog = AddIncomeTransactionDialog.empty,this.reload = AddIncomeTransactionReload.empty,required this.itemFood});

  @override
  // TODO: implement props
  List<Object?> get props => [totalPrice,listItemIncome,messError,showDialog,reload,itemFood];

  IncomeTransactionState copyWith({double? totalPrice,List<ItemFood>? listItemIncome,String? messError,AddIncomeTransactionDialog? showDialog,AddIncomeTransactionReload? reload,ItemFood? itemFood,int? value}){
    return IncomeTransactionState(
      itemFood: itemFood??this.itemFood,
      reload: reload??this.reload,
      showDialog: showDialog??this.showDialog,
      messError: messError??this.messError,
      listItemIncome: listItemIncome??this.listItemIncome,
      totalPrice: totalPrice??this.totalPrice,
    );
  }
}