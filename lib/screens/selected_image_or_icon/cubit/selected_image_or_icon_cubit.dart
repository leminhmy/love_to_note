import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:your_money/models/item_expenses.dart';
import 'package:your_money/models/item_food.dart';
import 'package:your_money/repository/repository_menu.dart';
import 'package:your_money/uitls/icons_assets.dart';

part 'selected_image_or_icon_state.dart';

class SelectedImageOrIconCubit extends Cubit<SelectedImageOrIconState>{
  SelectedImageOrIconCubit(): super(const SelectedImageOrIconState());

  loadingSelectedImageIcon(){
    emit(SelectedImageOrIconState(listIcon: IconsAssets.listIcon));
  }

  selectedIcon(int indexPrevious, int indexCurrent){
    emit(state.copyWith(indexListReload: indexPrevious));
    emit(state.copyWith(indexListReload: indexCurrent));
    emit(state.copyWith(indexListReload: -1));
  }

  selectedImage(int indexCurrent)
  {
    emit(state.copyWith(indexListReload: indexCurrent));
    emit(state.copyWith(indexListReload: -1));
  }

}