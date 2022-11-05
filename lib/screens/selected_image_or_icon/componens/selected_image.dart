import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../uitls/image_assets.dart';
import '../../../uitls/size_config.dart';
import '../../../widget/icon_circle_btn.dart';

class SelectedImage extends StatefulWidget {
  const SelectedImage({
    Key? key, required this.imageFilePath,
  }) : super(key: key);

  final ValueChanged<String> imageFilePath;

  @override
  State<SelectedImage> createState() => _SelectedImageState();
}

class _SelectedImageState extends State<SelectedImage> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  void imageSelect() async {
    image = null;
    image = await _picker.pickImage(source: ImageSource.gallery,imageQuality: 25);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    if(image!= null){
      widget.imageFilePath(image?.path??"");
    }
    return IconCircleBtn(
      size: SizeConfig.screenHeight * 0.065,
      onPress: (){
        imageSelect();
      },
        icon: Image.asset(ImageAssets.picture,fit: BoxFit.cover,));
  }
}
