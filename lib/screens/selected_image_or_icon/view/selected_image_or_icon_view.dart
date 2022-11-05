import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/selected_image_or_icon/selected_image_or_icon.dart';
import 'package:your_money/screens/selected_image_or_icon/view/selected_image_or_icon_page.dart';

import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/icon_animation_check.dart';
import '../../../widget/icon_circle_btn.dart';
import '../componens/selected_image.dart';

class SelectedImageOrIconView extends StatelessWidget {
  const SelectedImageOrIconView({Key? key, required this.urlImageOrIcon}) : super(key: key);

  final ValueChanged<String> urlImageOrIcon;

  @override
  Widget build(BuildContext context) {
    return SelectedImageOrIconPage(urlImageOrIcon:urlImageOrIcon,);
  }
}
