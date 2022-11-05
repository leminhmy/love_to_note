import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:your_money/repository/repository_menu.dart';

import '../../../models/item_movie.dart';
import '../../../models/note_movie.dart';

part 'detail_item_movie_state.dart';

class DetailItemMovieCubit extends Cubit<DetailItemMovieState>{

  int indexDetailMovie;

  DetailItemMovieCubit({ this.indexDetailMovie = 0}): super( const DetailItemMovieState());

  loadingDetailMovie(){
    List<NoteMovie> listNoteMovie = RepositoryMenu.listNoteMovie;
    List<ItemMovie> listItemDay = List.from(listNoteMovie[indexDetailMovie].listDay[0].listItemDay);
    print(listItemDay.map((e) => e.toJson()));
    emit(DetailItemMovieState(listItemMovie: listItemDay,listNoteMovie: listNoteMovie,indexNoteMovie: indexDetailMovie));
  }

  changeTabCategory(int index){
    List<ItemMovie> listItemMovie = List.from(state.listNoteMovie[index].listDay[state.indexWeekdays].listItemDay);
    emit(state.copyWith(listItemMovie: listItemMovie,indexNoteMovie: index));
    reloadWidget(widgetReload: DetailItemMovieReload.tabListItem);
  }

  deleteItemMovie(int index){
    RepositoryMenu().removeItemMovieInWeekdays(indexCategory: state.indexNoteMovie, indexDays: state.indexWeekdays, indexItemMovie: index);
    reloadWidget(widgetReload: DetailItemMovieReload.tabListItem);
  }


  changeTabWeekdays(int index){
    List<ItemMovie> listItemDay = state.listNoteMovie[state.indexNoteMovie].listDay[index].listItemDay;
    emit(state.copyWith(indexWeekdays: index,listItemMovie: listItemDay));
    reloadWidget(widgetReload: DetailItemMovieReload.tabListItem);
  }

  reloadListItemMovie(){
    changeTabWeekdays(state.indexWeekdays);
  }


  reloadWidget({required DetailItemMovieReload widgetReload}){
    emit(state.copyWith(reload: widgetReload));
    emit(state.copyWith(reload: DetailItemMovieReload.empty));

  }

}