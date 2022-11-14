import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../uitls/size_config.dart';
import '../../../widget/container_border_liner.dart';
import '../../../widget/label_textfield.dart';
import '../cubit/backup_cubit.dart';

class SaveDataCloud extends StatelessWidget {
  const SaveDataCloud({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = "";
    return SizedBox(
      height: SizeConfig.screenHeight * 0.15,
      width: SizeConfig.screenWidth *0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LabelTextField(valueUnFocus: (String? value) => text = value??"",),
          GestureDetector(
            onTap: () {
              context.read<BackupCubit>().backupDataToCloud(text);
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
    );
  }
}
