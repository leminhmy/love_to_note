import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:your_money/app/router/route_name.dart';
import 'package:your_money/models/item_menu.dart';
import 'package:your_money/screens/detail_item_movie/view/detail_item_movie_view.dart';
import 'package:your_money/screens/home/view/home_view.dart';
import 'package:your_money/screens/select_item_menu/view/view.dart';
import 'package:your_money/screens/splash/view/splash_page.dart';
import 'package:your_money/screens/splash/view/splash_view.dart';
import 'package:your_money/screens/transactions/view/transactions_view.dart';

import '../../screens/detail_item_food/view/detail_item_food_view.dart';
import '../../screens/home/view/home_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {

      case RouteName.initial:
        if (args != null && args is String) {
          return PageTransition(
              child: const HomeView(
              ),
              type: PageTransitionType.rightToLeft);
        }
        return _errRoute();
      case RouteName.splash:
        if (args != null && args is String) {
          return PageTransition(
              child: const SplashView(
              ),
              type: PageTransitionType.rightToLeft);
        }
        return _errRoute();
      case RouteName.detailItemFood:
        if (args != null && args is int) {
          return PageTransition(
              child: DetailItemFoodView(
                indexItemExpenses: args,
              ),
              type: PageTransitionType.rightToLeft);
        }
        return _errRoute();
      case RouteName.detailItemMovie:
        if (args != null && args is int) {
          return PageTransition(
              child: DetailItemMovieView(
                indexDetailMovie: args,
              ),
              type: PageTransitionType.rightToLeft);
        }
        return _errRoute();
      case RouteName.selectItemMenu:
        if (args != null && args is int) {
          return PageTransition(
              child: SelectItemMenuView(
                indexItemMenu: args,
              ),
              type: PageTransitionType.rightToLeft);
        }
        return _errRoute();
      case RouteName.transactions:
        if (args != null && args is String) {
          return PageTransition(
              child: const TransactionsView(
              ),
              type: PageTransitionType.rightToLeft);
        }
        return _errRoute();
      default:
        return _errRoute();
    }
  }

  static Route<dynamic> _errRoute() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text("no route"),
          ),
        ));
  }
}