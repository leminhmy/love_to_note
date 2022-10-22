import 'package:flutter/material.dart';
import 'package:your_money/uitls/icons_assets.dart';
import 'package:your_money/widget/icon_circle_btn.dart';

import '../../uitls/theme_color.dart';
import '../../widget/card_item_movie.dart';
import '../../widget/card_transactions.dart';
import '../../widget/container_border_liner.dart';
import '../../widget/icon_border_btn.dart';
import '../../widget/label_textfield.dart';
import '../../widget/text_header1.dart';
import '../../widget/text_header3.dart';

class AddMoviePage extends StatelessWidget {
  const AddMoviePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> listWeek = List.generate(
        7, (index) => index == 6 ? "Chủ Nhật" : "Thứ ${index + 2}");
    List<String> listCategory = ["Movie", "Comic", "WebSite"];
    return Container(
      height: double.maxFinite,
      decoration: const BoxDecoration(
          color: ThemeColor.colorBackgroundWhile,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                IconBorderBtn(
                  icon: Icon(
                    Icons.add,
                    size: 35,
                    color: ThemeColor.colorBlack2,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextHeader1(
                  text: "Movie More",
                ),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: ThemeColor.colorWhile,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                  child: LabelTextField(),
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      const SizedBox(
                          width: 100,
                          child: TextHeader3(text: "Lịch Chiếu ",)),
                      const SizedBox(width: 10,),
                      StatefulBuilder(
                          builder: (context, setState2) {
                            return Expanded(
                              child: DropdownButtonFormField<String>(
                                value: listWeek[0],
                                onChanged: (value) {

                                },
                                items: listWeek.map((e) =>
                                    DropdownMenuItem(
                                      value: e,
                                        child: TextHeader3(text:e,colorText: ThemeColor.colorBlueLight,)))
                                    .toList(),
                              ),
                            );
                          }
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 100,
                          child: TextHeader3(text: "Thể loại",)),
                      const SizedBox(width: 10,),
                      StatefulBuilder(
                          builder: (context, setState2) {
                            return Expanded(
                              child: DropdownButtonFormField<String>(
                                value: listCategory[0],
                                onChanged: (value) {

                                },
                                items: listCategory.map((e) =>
                                    DropdownMenuItem(
                                      value: e,
                                        child: TextHeader3(text:e,colorText: ThemeColor.colorBlueLight,)))
                                    .toList(),
                              ),
                            );
                          }
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          const CardItemMovie(),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 60,
            width: 200,
            child: ContainerBorderLiner(
              text: "SAVE",
            ),
          ),
        ],
      ),
    );
  }
}
