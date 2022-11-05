
import 'package:your_money/models/item_expenses.dart';
import 'package:your_money/models/item_movie.dart';
import 'package:your_money/models/note_movie.dart';

import '../data/storage/storage.dart';
import '../models/expenses.dart';
import '../models/item_food.dart';
import '../models/item_menu.dart';
import '../uitls/theme_color.dart';

class RepositoryMenu{
  static Expenses _expenses = Expenses.empty;
  static Expenses get expenses => _expenses;


  static  List<ItemMenuModel> _listItemMenu = [];
  static List<ItemMenuModel> get listItemMenu => _listItemMenu;

  static  List<ItemExpenses> _listItemExpenses = [];
  static List<ItemExpenses> get listItemExpenses => _listItemExpenses;

  static  List<ItemFood> _listItemIncome = [];
  static List<ItemFood> get listItemIncome => _listItemIncome;

  static  List<NoteMovie> _listNoteMovie = [];
  static List<NoteMovie> get listNoteMovie => _listNoteMovie;

  loadData()async{
    _expenses = await StorageSecure.getAllData();

    _listItemMenu = List.from(_expenses.listItemMenu);
    _listItemExpenses = List.from(_expenses.listItemExpenses);
    _listNoteMovie = List.from(_expenses.listNoteMovie);
    _listItemIncome = List.from(_expenses.listItemIncome);
  }
  Expenses getDataToStorage(){
    _expenses.listItemExpenses = _listItemExpenses;
    _expenses.listItemMenu = _listItemMenu;
    _expenses.listItemIncome = _listItemIncome;
    _expenses.listNoteMovie = _listNoteMovie;
    return _expenses;
  }

  //fn

  //update expenses

  updateTotalPriceExpenses(){
    double totalPrice = 0;
    for (var element in _listItemExpenses) {
      totalPrice += element.price;
    }
    _expenses.expensesMoney = totalPrice;
  }

  //insert

  insertItemListIncome(ItemFood itemIncome){
    _expenses.incomeMoney+=itemIncome.price;
    _listItemIncome.insert(0,ItemFood.fromJson(itemIncome.toJson()));
  }

  insertItemListMenu(ItemMenuModel itemMenuModel){
    _listItemMenu.insert(0, ItemMenuModel.fromJson(itemMenuModel.toJson()));
  }

  insertItemListNoteMovie(ItemMenuModel itemNoteMovie){
    NoteMovie noteMovie = NoteMovie(image: itemNoteMovie.image,name: itemNoteMovie.name, listDay: List.generate(7, (index) => Weekdays(listItemDay: [])));
    _listNoteMovie.insert(0,noteMovie);
  }

  insertItemListFood({required int indexCategory,required ItemFood itemFood}){
    _listItemExpenses[indexCategory].price+=itemFood.price;
    _listItemExpenses[indexCategory].listItem.insert(0,ItemFood.fromJson(itemFood.toJson()));
  }
  insertItemListItemExpenses(ItemMenuModel itemMenu){
    ItemExpenses itemExpenses = ItemExpenses(name: itemMenu.name, image: itemMenu.image, price: 0, listItem: []);
    _listItemExpenses.insert(0, itemExpenses);
  }

   addItemMovieInWeekdays({required int indexCategory, required int indexDays,required ItemMovie itemMovie}){
    _listNoteMovie[indexCategory].listDay[indexDays].listItemDay.add(ItemMovie.fromJson(itemMovie.toJson()));

  }

  //delete
   removeItemMovieInWeekdays({required int indexCategory, required int indexDays,required int indexItemMovie}){
    _listNoteMovie[indexCategory].listDay[indexDays].listItemDay.removeAt(indexItemMovie);
  }

  deleteItemListFood({required int indexCategory,required ItemFood itemFood}){
    _listItemExpenses[indexCategory].price-=itemFood.price;
    _listItemExpenses[indexCategory].listItem.remove(itemFood);
  }

  deleteItemMenu(int index){
    _listItemMenu.removeAt(index);
  }
  deleteItemIncome(ItemFood itemIncome){
    _expenses.incomeMoney-=itemIncome.price;
    _listItemIncome.remove(itemIncome);
  }

}