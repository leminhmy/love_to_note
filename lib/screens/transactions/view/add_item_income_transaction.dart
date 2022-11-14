import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/screens/transactions/components/components_add_item_income/card_demo_item_income.dart';

import '../../../app/locate/lang_code.dart';
import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/container_border_liner.dart';
import '../../../widget/icon_border_btn.dart';
import '../../../widget/text_header1.dart';
import '../cubit/income_transaction__cubit.dart';
import '../components/components_add_item_income/edit_info_item_income.dart';

class AddItemIncomeTransaction extends StatelessWidget {
  const AddItemIncomeTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration:  BoxDecoration(
          color: ThemeColorDarkLight.color.backgroundScaffold,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:   [
               IconBorderBtn(
                icon: Icon(Icons.add,size: 35,color: ThemeColorDarkLight.color.icon,),
              ),
              const SizedBox(width: 10,),
              TextHeader1(text: AppLang.lang(LangCode.income),),
            ],
          ),
          const SizedBox(height: 10,),
          const CardDemoItemIncome(),
          Expanded(
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: ThemeColorDarkLight.color.backgroundItem,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: const EditInfoItemIncome(),
            ),
          ),

          GestureDetector(
            onTap: (){
              context.read<IncomeTransactionCubit>().saveToList();
            },
            child: SizedBox(
              height: SizeConfig.screenHeight * 0.06,
              width: SizeConfig.screenHeight * 0.2,
              child: const ContainerBorderLiner(
                text: "SAVE",
              ),
            ),
          )
        ],
      ),
    );
  }
}
