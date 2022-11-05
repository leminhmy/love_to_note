import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/selected_image_or_icon/view/selected_image_or_icon_view.dart';

import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/label_textfield.dart';
import '../../../widget/text_header1.dart';
import '../cubit/drawer_home_cubit.dart';

class EditInfoItemDrawer extends StatelessWidget {
  const EditInfoItemDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.05,
          child: LabelTextField(
            valueUnFocus: (String? text) {
              if (text!.isNotEmpty) {
                context.read<DrawerHomeCubit>().editName(text);
              }
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.all(10),
          child: TextHeader1(
            text: "Selected Icons",
            colorText: ThemeColor.colorGrey,
          ),
        ),
        Expanded(
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.only(left: 15, top: 15),
            decoration: BoxDecoration(
              color: ThemeColor.colorBackgroundWhile,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SelectedImageOrIconView(urlImageOrIcon: (String url) {
              if (url.isNotEmpty) {
                if (url.contains("assets/icons")) {
                  context.read<DrawerHomeCubit>().selectedIcon(url);
                }else{
                  context.read<DrawerHomeCubit>().selectedImage(url);
                }
              }
            }),
          ),
        ),
      ],
    );
  }
}
