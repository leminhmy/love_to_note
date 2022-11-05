import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/detail_item_movie/cubit/detail_item_movie_cubit.dart';
import 'package:your_money/screens/detail_item_movie/view/detail_item_movie_page.dart';

class DetailItemMovieView extends StatefulWidget {
  const DetailItemMovieView({Key? key, required this.indexDetailMovie})
      : super(key: key);
  final int indexDetailMovie;

  @override
  State<DetailItemMovieView> createState() => _DetailItemMovieViewState();
}

class _DetailItemMovieViewState extends State<DetailItemMovieView> {


  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            DetailItemMovieCubit(indexDetailMovie: widget.indexDetailMovie)
              ..loadingDetailMovie(),
      child: const DetailItemMoviePage(),
    );
  }
}
