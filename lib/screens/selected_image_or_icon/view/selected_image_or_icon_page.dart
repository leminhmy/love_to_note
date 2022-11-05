import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/selected_image_or_icon/selected_image_or_icon.dart';

import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/icon_animation_check.dart';
import '../../../widget/icon_circle_btn.dart';
import '../componens/selected_image.dart';

class SelectedImageOrIconPage extends StatelessWidget {
  const SelectedImageOrIconPage({Key? key, required this.urlImageOrIcon}) : super(key: key);

  final ValueChanged<String> urlImageOrIcon;
  @override
  Widget build(BuildContext context) {
    int indexPrevious = -1;
    int indexCurrent = -1;
    return BlocBuilder<SelectedImageOrIconCubit, SelectedImageOrIconState>(
      buildWhen: (previous, current) => false,
      builder: (context, state) {
        return Wrap(
          children: [
            SelectedImage(
              imageFilePath: (String filePath) {
                if (filePath.isNotEmpty) {
                  context.read<SelectedImageOrIconCubit>().selectedImage(indexCurrent);
                  indexCurrent = -1;
                  urlImageOrIcon(filePath);

                }
              },
            ),
            const SizedBox(
              width: 10,
            ),
            ...List.generate(
                state.listIcon.length,
                    (index) =>
                    Padding(
                      padding:
                      const EdgeInsets.only(right: 10, bottom: 10),
                      child: IconCircleBtn(
                          size: SizeConfig.screenHeight * 0.065,
                          onPress: () {
                            indexPrevious = indexCurrent;
                            indexCurrent = index;
                            context
                                .read<SelectedImageOrIconCubit>()
                                .selectedIcon(
                                indexPrevious, index);
                          },
                          icon: BlocBuilder<SelectedImageOrIconCubit,
                              SelectedImageOrIconState>(
                            buildWhen: (previous, current) =>
                            current.indexListReload == index,
                            builder: (context, state) {
                              print("reload $index");
                              if(indexCurrent == index){
                                urlImageOrIcon(state.listIcon[index]);
                              }
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  ImageIcon(
                                      AssetImage(
                                          state.listIcon[index]),
                                      color: ThemeColor.colorWhile,
                                      size: SizeConfig.screenHeight *
                                          0.04),
                                  indexCurrent == index
                                      ? const IconAnimationCheck()
                                      : const SizedBox(),
                                ],
                              );
                            },
                          )),
                    )),
          ],
        );
      },
    );
  }
}
