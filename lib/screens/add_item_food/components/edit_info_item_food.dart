import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/selected_image_or_icon/view/selected_image_or_icon_view.dart';
import 'package:your_money/widget/neumorphism_container.dart';
import 'package:your_money/widget/text_header1.dart';

import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/label_textfield.dart';
import '../../../widget/text_header3.dart';
import '../cubit/add_item_food_cubit.dart';

class EditInfoItemFood extends StatefulWidget {
  const EditInfoItemFood({Key? key}) : super(key: key);

  @override
  State<EditInfoItemFood> createState() => _EditInfoItemFoodState();
}

class _EditInfoItemFoodState extends State<EditInfoItemFood> {
  int quantity = 1;
  double price = 0;
  int indexPrevious = -1;
  int indexCurrent = -1;
  final TextEditingController _textEditingControllerPrice =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.05,
          child: LabelTextField(
            valueUnFocus: (String? text) {
              context.read<AddItemFoodCubit>().editName(text ?? "");
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.05,
          child: LabelTextField(
            textInputType: TextInputType.number,
            hintTextField: "Price...",
            textEditingController: _textEditingControllerPrice,
            label: "Price",
            valueUnFocus: (String? text) {
              print(" text price $text");
              if (text != null && text != "") {
                price = double.parse(text.replaceAll(RegExp('[^0-9]'), ""));
              }
              context.read<AddItemFoodCubit>().editPrice(price);
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
                width: SizeConfig.screenHeight * 0.1,
                child: const TextHeader3(
                  text: "Quantity",
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(child: StatefulBuilder(builder: (context, setState2) {
              return SizedBox(
                height: SizeConfig.screenHeight * 0.04,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (quantity == 1) {
                          return;
                        }
                        quantity--;
                        context
                            .read<AddItemFoodCubit>()
                            .editQuantity(quantity, price);
                        setState2(() {});
                      },
                      child: const Icon(Icons.remove_rounded),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.15,
                      child: NeumorphismContainer(
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent,
                              onPrimary: ThemeColor.colorBlueLight,
                            ),
                            child: TextHeader1(text: "$quantity")),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (quantity == 99) {
                          return;
                        }
                        quantity++;
                        context
                            .read<AddItemFoodCubit>()
                            .editQuantity(quantity, price);
                        setState2(() {});
                      },
                      child: const Icon(Icons.add_rounded),
                    ),
                  ],
                ),
              );
            }))
          ],
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
            child: SelectedImageOrIconView(
              urlImageOrIcon: (String value) {
                if (value.isNotEmpty) {
                  if(value.contains("assets/icons")){
                    context.read<AddItemFoodCubit>().selectedIcon(value);
                  }else{
                    context.read<AddItemFoodCubit>().selectedImage(value);
                  }
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
