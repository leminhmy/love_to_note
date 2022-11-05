
part of 'detail_item_movie_cubit.dart';
enum DetailItemMovieReload {empty, tabCategory, tabListItem}

class DetailItemMovieState extends Equatable{
  final int value;
  final int indexWeekdays;
  final int indexNoteMovie;
  final List<NoteMovie> listNoteMovie;
  final List<ItemMovie> listItemMovie;
  final DetailItemMovieReload reload;
  const DetailItemMovieState({this.indexNoteMovie = 0,this.listItemMovie = const [],this.reload = DetailItemMovieReload.empty,this.indexWeekdays = 0,this.listNoteMovie = const [],this.value = 0});

  @override
  // TODO: implement props
  List<Object?> get props => [indexNoteMovie,listItemMovie,reload,indexWeekdays,listNoteMovie,value];

  DetailItemMovieState copyWith({int? indexNoteMovie,List<ItemMovie>? listItemMovie,DetailItemMovieReload? reload,int? indexWeekdays,List<NoteMovie>? listNoteMovie,int? value}){
    return DetailItemMovieState(
      value: value??this.value,
      listNoteMovie: listNoteMovie??this.listNoteMovie,
      indexWeekdays: indexWeekdays??this.indexWeekdays,
      reload: reload??this.reload,
      listItemMovie: listItemMovie??this.listItemMovie,
      indexNoteMovie: indexNoteMovie??this.indexNoteMovie,
    );
  }
}