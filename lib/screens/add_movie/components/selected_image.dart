import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../uitls/image_assets.dart';
import '../../../uitls/size_config.dart';

class SelectedImage extends StatefulWidget {
  const SelectedImage({Key? key, this.imageFilePath}) : super(key: key);

  final ValueChanged<String>? imageFilePath;

  @override
  State<SelectedImage> createState() => _SelectedImageState();
}

class _SelectedImageState extends State<SelectedImage> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  void imageSelect() async {
    image = null;
    image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    widget.imageFilePath!(image?.path??"");
    return Container(
      height: SizeConfig.screenHeight * 0.315,
      width: SizeConfig.screenHeight * 0.210,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: image != null
              ? DecorationImage(
              image: FileImage(File(image!.path)),
              fit: BoxFit.cover,
          )
              : const DecorationImage(
            image: AssetImage(ImageAssets.movieBg),
            fit: BoxFit.cover,
          )
      ),
      child: ElevatedButton(
        onPressed: () {
          imageSelect();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          primary: Colors.transparent,
          shadowColor: Colors.transparent,

        ),
        child: const SizedBox(),
      ),
    );
  }
}
