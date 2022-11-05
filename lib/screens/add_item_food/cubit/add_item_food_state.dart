
part of 'add_item_food_cubit.dart';
enum AddItemFoodReload{empty, image, name, price,quantity ,color}
enum AddItemFoodDialog{empty, success, error}
class AddItemFoodState extends Equatable{
  final int value;
  final ItemFood itemFood;
  final String messError;
  final AddItemFoodReload reload;
  final AddItemFoodDialog showDialog;
  const AddItemFoodState({this.messError = "",this.showDialog = AddItemFoodDialog.empty,this.reload = AddItemFoodReload.empty,required this.itemFood,this.value = 0});

  @override
  // TODO: implement props
  List<Object?> get props => [messError,showDialog,reload,itemFood,value];

  AddItemFoodState copyWith({String? messError,AddItemFoodDialog? showDialog,AddItemFoodReload? reload,ItemFood? itemFood,int? value}){
    return AddItemFoodState(
      value: value??this.value,
      itemFood: itemFood??this.itemFood,
      reload: reload??this.reload,
      showDialog: showDialog??this.showDialog,
      messError: messError??this.messError,
    );
  }
}