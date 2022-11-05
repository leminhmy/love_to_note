
part of 'select_item_menu_cubit.dart';

class SelectItemMenuState extends Equatable{
  final int value;
  const SelectItemMenuState({this.value = 0});

  @override
  // TODO: implement props
  List<Object?> get props => [value];

  SelectItemMenuState copyWith({int? itemMenu,int? value}){
    return SelectItemMenuState(
      value: value??this.value,
    );
  }
}