
part of 'drawer_home_cubit.dart';
enum DrawerHomeReload {empty, listFood, listMenu, listMovie}
enum AddItemDrawerHomeReload {empty, color, image, name}
enum AddItemDrawerHomeDialog {empty, success, error}

class DrawerHomeState extends Equatable{
  final int value;
  final DrawerHomeReload reload;
  final ItemMenuModel? itemDrawer;
  final List<ItemMenuModel> listItemMenu;
  final List<NoteMovie> listNoteMovie;
  final List<ItemExpenses> listItemExpenses;
  final AddItemDrawerHomeReload addItemReload;
  final AddItemDrawerHomeDialog addItemDialog;
  final String messError;
  const DrawerHomeState({this.messError = "",this.addItemDialog = AddItemDrawerHomeDialog.empty,this.itemDrawer,this.addItemReload = AddItemDrawerHomeReload.empty,this.listNoteMovie = const[],this.listItemExpenses = const [],this.listItemMenu = const [],this.reload = DrawerHomeReload.empty,this.value = 0});

  @override
  // TODO: implement props
  List<Object?> get props => [messError,addItemDialog,itemDrawer,addItemReload,listItemExpenses,listNoteMovie,listItemMenu,reload,value];

  DrawerHomeState copyWith({String? messError,AddItemDrawerHomeDialog? addItemDialog,ItemMenuModel? itemDrawer,AddItemDrawerHomeReload? addItemReload,List<ItemExpenses>? listItemExpenses,List<NoteMovie>? listNoteMovie,List<ItemMenuModel>? listItemMenu,DrawerHomeReload? reload,int? value}){
    return DrawerHomeState(
      value: value??this.value,
      reload: reload??this.reload,
      listItemMenu: listItemMenu??this.listItemMenu,
      listItemExpenses: listItemExpenses??this.listItemExpenses,
      listNoteMovie: listNoteMovie??this.listNoteMovie,
      addItemReload: addItemReload??this.addItemReload,
      itemDrawer: itemDrawer??this.itemDrawer,
      addItemDialog: addItemDialog??this.addItemDialog,
      messError: messError??this.messError,
    );
  }
}