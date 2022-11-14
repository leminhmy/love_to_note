part of 'backup_cubit.dart';
enum BackupShowMess{empty, messError, messSuccess}
enum BackupReload{empty, listBackup}


class BackupState extends Equatable{
  final bool logged;
  final String message;
  final BackupShowMess showMess;
  final BackupReload reload;
  final String nameSave;
  final int intSort;
  final List<BackupData> listBackup;

  const BackupState({this.intSort = 0,this.reload = BackupReload.empty,this.listBackup = const [],this.nameSave = "",this.logged = false,this.message = "",this.showMess = BackupShowMess.empty});
  @override

  List<Object?> get props => [intSort,reload,listBackup,nameSave,logged, message, showMess];

  BackupState copyWith({int? intSort,BackupReload? reload,List<BackupData>? listBackup,String? nameSave,BackupShowMess? showMess,bool? logged,String? message}){
    return BackupState(
      logged: logged??this.logged,
      showMess: showMess??this.showMess,
      message: message??this.message,
      nameSave: nameSave??this.nameSave,
      listBackup: listBackup??this.listBackup,
      reload: reload??this.reload,
      intSort: intSort??this.intSort,
    );
}
}
