
part of 'selected_image_or_icon_cubit.dart';
class SelectedImageOrIconState extends Equatable{
  final List<String> listIcon;
  final int indexListReload;
  const SelectedImageOrIconState({this.indexListReload = -1,this.listIcon = const []});

  @override
  // TODO: implement props
  List<Object?> get props => [listIcon, indexListReload];

  SelectedImageOrIconState copyWith({List<String>? listIcon,int? indexListReload}){
    return SelectedImageOrIconState(
      indexListReload: indexListReload??this.indexListReload,
      listIcon: listIcon??this.listIcon,

    );
  }
}