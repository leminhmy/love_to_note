import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:your_money/repository/repository_menu.dart';

import '../../../models/item_movie.dart';
import '../../../models/note_movie.dart';

part 'add_movie_state.dart';

class AddMovieCubit extends Cubit<AddMovieState>{
  AddMovieCubit(): super( const AddMovieState());

  loadingAddMovie(){
    List<NoteMovie> listNoteMovie = RepositoryMenu.listNoteMovie;
    emit(AddMovieState(listNoteMovie: listNoteMovie));
  }

  Future<bool> addItemMovie({required int indexCategory, required int indexDays,required ItemMovie itemMovie}) async {
    emit(state.copyWith(showDialog: AddMovieStateShowDialog.empty));
    if(itemMovie.name == "" || itemMovie.image == ""){
      emitDialogError(AddMovieStateShowDialog.error);
      return false;
    }
    emitDialogError(AddMovieStateShowDialog.success);

    RepositoryMenu().addItemMovieInWeekdays(indexCategory: indexCategory, indexDays: indexDays, itemMovie: itemMovie);
    return true;
  }

  emitDialogError(AddMovieStateShowDialog showDialog){
    emit(state.copyWith(showDialog: showDialog));
    emit(state.copyWith(showDialog: AddMovieStateShowDialog.empty));

  }


}