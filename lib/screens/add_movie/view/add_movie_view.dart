import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/add_movie/add_movie.dart';
import 'package:your_money/screens/add_movie/view/add_movie_page.dart';
import 'package:your_money/screens/detail_item_movie/cubit/detail_item_movie_cubit.dart';
import 'package:your_money/uitls/size_config.dart';
import 'package:your_money/uitls/theme_color.dart';
import 'package:your_money/widget/show_snack.dart';
import 'package:your_money/widget/text_header3.dart';

class AddMovieView extends StatelessWidget {
  const AddMovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddMovieCubit()..loadingAddMovie(),
      child: BlocListener<AddMovieCubit,AddMovieState>(
        listener: (context, state) {
          if(state.showDialog == AddMovieStateShowDialog.error){
            ShowSnackCustom.showFlushBar(context: context,isError: true,text: "Name or Image is Empty");
          }
          if(state.showDialog == AddMovieStateShowDialog.success){

            ShowSnackCustom.showFlushBar(context: context,isError: false,text: "Add Success");

          }
        },
        child: const AddMoviePage(),
      ),
    );
  }
}
