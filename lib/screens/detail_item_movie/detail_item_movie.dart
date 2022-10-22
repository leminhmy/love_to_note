
import 'package:flutter/material.dart';
import 'package:your_money/screens/add_movie/add_movie.dart';
import 'package:your_money/screens/detail_item_movie/components/tab_controller_category.dart';
import 'package:your_money/screens/home/home_page.dart';

import '../../uitls/icons_assets.dart';
import '../../uitls/theme_color.dart';
import '../../widget/card_item_movie.dart';
import '../../widget/icon_border_btn.dart';
import '../../widget/icon_circle_btn.dart';
import '../../widget/show_bottom_sheet.dart';
import '../../widget/text_header1.dart';
import 'components/tab_controller.dart';

class DetailItemMovie extends StatelessWidget {
  const DetailItemMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.colorBackgroundDark,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconBorderBtn(
                        onPress: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));

                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: ThemeColor.colorGrey,
                        ),
                      ),
                      const TextHeader1(
                        text: "Movie List",
                        colorText: ThemeColor.colorWhile,
                        fontSize: 30,
                      ),
                      const SizedBox(
                        height: 50,
                        child: IconCircleBtn(
                          color: ThemeColor.colorOrange,
                          icon: ImageIcon(
                            AssetImage(IconsAssets.film),
                            color: ThemeColor.colorWhile,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const TabControllerCateGory(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) =>
                              ThemeColor.linerColorOrangeRed.createShader(
                                Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height),
                              ),
                          child: const TextHeader1(
                            text: "LỊCH CHIẾU",
                          )),
                      SizedBox(
                        height: 2,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              decoration: const BoxDecoration(
                                  gradient: ThemeColor.linerColorOrangeRed),
                            ),
                            const Expanded(
                                child: SizedBox(
                                    height: 2,
                                    child: ColoredBox(
                                      color: ThemeColor.colorGrey,
                                    )))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const TabControllerWidget(),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Center(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        runAlignment: WrapAlignment.start,
                        alignment: WrapAlignment.start,
                        children: List.generate(5, (index) => const CardItemMovie()),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            Positioned(
              bottom: 60,
              right: 30,
              child: GestureDetector(
                onTap: () {
                  ShowBottomSheetClass.showBottomDefault(
                    context: context,
                    child: const AddMoviePage(),
                  );
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      gradient: ThemeColor.linerColorReverse,
                      boxShadow: [
                        BoxShadow(
                            color: ThemeColor.colorGrey,
                            blurRadius: 7,
                            spreadRadius: 1,
                            offset: Offset(0, 2))
                      ]),
                  child: const Icon(
                    Icons.add_outlined,
                    size: 45,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

