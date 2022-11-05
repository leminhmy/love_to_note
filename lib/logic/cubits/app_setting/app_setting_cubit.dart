import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:your_money/uitls/theme_color.dart';

part 'app_setting_state.dart';

class AppSettingCubit extends Cubit<AppSettingState> with HydratedMixin {
  AppSettingCubit()
      : super(const AppSettingState(
      themeMode: ThemeMode.system,
    ));



  void changeThemeMode(ThemeMode themeMode) =>
      emit(state.copyWith(themeMode: themeMode));



  @override
  AppSettingState? fromJson(Map<String, dynamic> json) {
    return AppSettingState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AppSettingState state) {
    return state.toMap();
  }
}