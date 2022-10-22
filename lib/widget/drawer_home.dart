import 'package:flutter/material.dart';
import 'package:your_money/screens/item_menu/item_menu.dart';
import 'package:your_money/widget/text_header1.dart';
import 'package:your_money/widget/text_header3.dart';

import '../uitls/image_assets.dart';
import '../uitls/theme_color.dart';
import 'card_note_drawer.dart';
import 'icon_add_showbottomsheet.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 400,
      backgroundColor: ThemeColor.colorBackgroundWhile,
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: DrawerHeader(
              padding: const EdgeInsets.all(20),
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageAssets.imageBg),
                      fit: BoxFit.cover)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  ImageAssets.imageBgPerson,
                                ))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.person,
                            size: 30,
                            color: ThemeColor.colorGrey,
                          ),
                          TextHeader1(text: "Name Person"),
                        ],
                      ),
                      const TextHeader3(text: "Danh Sách Lưu Trữ "),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                    width: 80,
                    child: IconAddShowBottomSheet(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ItemMenu()));
                  },
                    child: const CardNoteDrawer());

              })),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.settings_suggest,
                      size: 30,
                      color: ThemeColor.colorGrey,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    TextHeader3(
                      text: "Setting",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.help,
                      size: 30,
                      color: ThemeColor.colorGrey,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    TextHeader3(
                      text: "Help",
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
