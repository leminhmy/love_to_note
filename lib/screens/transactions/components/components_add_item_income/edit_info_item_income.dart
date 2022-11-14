import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/app/locate/lang_code.dart';
import 'package:your_money/screens/selected_image_or_icon/view/selected_image_or_icon_view.dart';
import 'package:your_money/screens/transactions/view/add_item_income_transaction.dart';
import 'package:your_money/screens/transactions/cubit/income_transaction__cubit.dart';
import 'package:your_money/uitls/app_format.dart';
import 'package:your_money/widget/neumorphism_container.dart';
import 'package:your_money/widget/text_header1.dart';

import '../../../../uitls/size_config.dart';
import '../../../../uitls/theme_color.dart';
import '../../../../widget/label_textfield.dart';
import '../../../../widget/text_header3.dart';
import '../../../add_item_food/cubit/add_item_food_cubit.dart';


class EditInfoItemIncome extends StatefulWidget {
  const EditInfoItemIncome({Key? key}) : super(key: key);

  @override
  State<EditInfoItemIncome> createState() => _EditInfoItemIncomeState();
}

class _EditInfoItemIncomeState extends State<EditInfoItemIncome> {
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
              context.read<IncomeTransactionCubit>().editName(text ?? "");
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
            hintTextField: "Enter ${AppLang.lang(LangCode.price)}...",
            textEditingController: _textEditingControllerPrice,
            label: AppLang.lang(LangCode.price),
            valueUnFocus: (String? text) {
              if (text != null && text != "") {
                price = AppLang.formatPriceTextField(text.replaceAll(',', '.'));
              }
              context.read<IncomeTransactionCubit>().editPrice(price);
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
                child: TextHeader3(
                  text: AppLang.lang(LangCode.quantity),
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
                            .read<IncomeTransactionCubit>()
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
                            .read<IncomeTransactionCubit>()
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
         Padding(
          padding: const EdgeInsets.all(10),
          child: TextHeader1(
            text: "${AppLang.lang(LangCode.choose)} Icons",
            colorText: ThemeColorDarkLight.color.text2,
          ),
        ),
        Expanded(
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.only(left: 15, top: 15),
            decoration: BoxDecoration(
              color: ThemeColorDarkLight.color.backgroundScaffold,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SelectedImageOrIconView(
              urlImageOrIcon: (String value) {
                if (value.isNotEmpty) {
                  if(value.contains("assets/icons")){
                    context.read<IncomeTransactionCubit>().selectedIcon(value);
                  }else{
                    context.read<IncomeTransactionCubit>().selectedImage(value);
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
