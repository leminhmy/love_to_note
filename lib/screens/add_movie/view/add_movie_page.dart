import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/models/item_movie.dart';
import 'package:your_money/repository/repository_menu.dart';
import 'package:your_money/screens/add_movie/add_movie.dart';
import 'package:your_money/screens/detail_item_movie/cubit/detail_item_movie_cubit.dart';


import '../../../app/locate/lang_code.dart';
import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/container_border_liner.dart';
import '../../../widget/icon_border_btn.dart';
import '../../../widget/label_textfield.dart';
import '../../../widget/text_header1.dart';
import '../../../widget/text_header3.dart';
import '../components/selected_image.dart';

class AddMoviePage extends StatefulWidget {
  const AddMoviePage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddMoviePage> createState() => _AddMoviePageState();
}

class _AddMoviePageState extends State<AddMoviePage> {
  int indexDay = 0;
  int indexCategory = 0;
  String imagePath = "";
  ItemMovie itemMovie = ItemMovie.empty;
  List<String> listWeek = AppLang.weekDays();

  final TextEditingController _textController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Container(
      height: double.maxFinite,
      decoration:  BoxDecoration(
          color: ThemeColorDarkLight.color.backgroundScaffold,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconBorderBtn(
                    icon: Icon(
                      Icons.add,
                      size: SizeConfig.screenHeight * 0.035,
                      color: ThemeColorDarkLight.color.icon,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const TextHeader1(
                    text: "Movie Item",
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: ThemeColorDarkLight.color.backgroundItem,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.05,
                    child:  LabelTextField(
                      textEditingController: _textController,
                      valueUnFocus: (String? text){

                      },
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.05,
                    child: Row(
                      children: [
                        SizedBox(
                            width: SizeConfig.screenHeight * 0.1,
                            child: TextHeader3(
                              text: AppLang.lang(LangCode.showTimes),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: listWeek[0],
                            onChanged: (value) {
                              indexDay = listWeek.indexOf(value??listWeek[0]);
                            },
                            items: listWeek
                                .map((e) => DropdownMenuItem(
                                value: e,
                                child: TextHeader3(
                                  text: e,
                                  colorText: ThemeColor.colorBlueLight,
                                )))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.05,
                    child: Row(
                      children: [
                        SizedBox(
                            width: SizeConfig.screenHeight * 0.1,
                            child: TextHeader3(
                              text: AppLang.lang(LangCode.category),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        BlocBuilder<AddMovieCubit, AddMovieState>(
                          buildWhen: (previous, current) => false,
                          builder: (context, state) {
                            return StatefulBuilder(builder: (context, setState2) {
                              List<String> listNameNoteMovie = List.generate(state.listNoteMovie.length, (index) => state.listNoteMovie[index].name);
                              return Expanded(
                                child: DropdownButtonFormField<String>(
                                  value: listNameNoteMovie[0],
                                  onChanged: (value) {
                                    indexCategory = listNameNoteMovie.indexOf(value??listNameNoteMovie[0]);
                                  },
                                  items: listNameNoteMovie
                                      .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: TextHeader3(
                                        text: e,
                                        colorText: ThemeColor.colorBlueLight,
                                      )))
                                      .toList(),
                                ),
                              );
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SelectedImage(
              imageFilePath: (String filePath) {
                imagePath = filePath;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                context.read<AddMovieCubit>().addItemMovie(indexCategory: indexCategory, indexDays: indexDay, itemMovie: ItemMovie(name: _textController.value.text, image: imagePath)).then((value) {
                  if(value){
                    _textController.text = "";
                  }
                });
              },
              child: SizedBox(
                height: SizeConfig.screenHeight * 0.06,
                width: SizeConfig.screenHeight * 0.2,
                child: const ContainerBorderLiner(
                  text: "SAVE",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
