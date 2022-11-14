import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/app/router/route_name.dart';


import '../../../uitls/icons_assets.dart';
import '../../../uitls/size_config.dart';
import '../../../uitls/theme_color.dart';
import '../../../widget/icon_bg_btn.dart';
import '../../transactions/view/transactions_page.dart';
import '../cubit/home_cubit.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
      current.reload == HomeReload.themeColor,
      builder: (context, state) {
        return Container(
          height: SizeConfig.screenHeight * 0.1,
          decoration: BoxDecoration(
              color: ThemeColorDarkLight.color.backgroundItem,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SizeConfig.screenHeight * 0.05),
                topRight: Radius.circular(SizeConfig.screenHeight * 0.05),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.06,
                width: SizeConfig.screenHeight * 0.06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    onPrimary: ThemeColor.colorBlueLight,
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {
                    context.read<HomeCubit>().switchPage();
                  },
                  child: ImageIcon(
                    const AssetImage(IconsAssets.application),
                    color: ThemeColorDarkLight.color.icon,
                    size: SizeConfig.screenHeight * 0.04,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context, RouteName.transactions, arguments: "");
                },
                child: IconBgBtn(
                  icon: Icon(
                    Icons.bar_chart,
                    color: ThemeColor.colorWhile,
                    size: SizeConfig.screenHeight * 0.02,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

