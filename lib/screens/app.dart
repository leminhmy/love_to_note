import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/data/storage/storage.dart';
import 'package:your_money/logic/cubits/app_setting/app_setting_cubit.dart';
import 'package:your_money/repository/repository_menu.dart';
import 'package:your_money/screens/detail_item_movie/cubit/detail_item_movie_cubit.dart';
import 'package:your_money/screens/drawer_home/drawer_home.dart';
import 'package:your_money/screens/selected_image_or_icon/selected_image_or_icon.dart';
import 'package:your_money/screens/splash/view/splash_page.dart';
import 'package:your_money/screens/splash/view/splash_view.dart';
import 'package:your_money/screens/transactions/cubit/income_transaction__cubit.dart';

import '../app/router/app_router.dart';
import '../logic/cubits/internet/internet_cubit.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit(),
        ),
        BlocProvider(
          create: (context) => AppSettingCubit(),
        ),
        BlocProvider(
          create: (context) => DetailItemMovieCubit(),
        ),
        BlocProvider<DrawerHomeCubit>(
          create: (context) => DrawerHomeCubit()..loadingDrawerHome(),
        ),
        BlocProvider<SelectedImageOrIconCubit>(
          create: (context) => SelectedImageOrIconCubit()..loadingSelectedImageIcon(),
        ),
        BlocProvider(create: (BuildContext context) => IncomeTransactionCubit()..loadingIncomeTransaction()),

      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
      //Execute the code here when user come back the app.
      //In my case, I needed to show if user active or not,

        break;
      case AppLifecycleState.paused:
      //Execute the code the when user leave the app
        StorageSecure.saveAllData(RepositoryMenu().getDataToStorage());
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingCubit, AppSettingState>(
  builder: (context, state) {
    return Listener(
      onPointerDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();

      },
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        home: const SplashView(),
      ),
    );
  },
);
  }
}
