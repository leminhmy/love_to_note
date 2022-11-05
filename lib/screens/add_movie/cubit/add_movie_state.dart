
part of 'add_movie_cubit.dart';
enum AddMovieStateReload {empty, listItemMovie, showBottomSnack}
enum AddMovieStateShowDialog {empty, error,success}

class AddMovieState extends Equatable{
  final int value;
  final List<NoteMovie> listNoteMovie;
  final AddMovieStateReload reload;
  final AddMovieStateShowDialog showDialog;

  const AddMovieState({this.showDialog = AddMovieStateShowDialog.empty,this.reload = AddMovieStateReload.empty,this.listNoteMovie = const [],this.value = 0});

  @override
  // TODO: implement props
  List<Object?> get props => [reload,showDialog,listNoteMovie,value];

  AddMovieState copyWith({AddMovieStateReload? reload,AddMovieStateShowDialog? showDialog,List<NoteMovie>? listNoteMovie,int? value}){
    return AddMovieState(
      value: value??this.value,
      listNoteMovie: listNoteMovie??this.listNoteMovie,
      reload: reload??this.reload,
      showDialog: showDialog??this.showDialog,
    );
  }
}