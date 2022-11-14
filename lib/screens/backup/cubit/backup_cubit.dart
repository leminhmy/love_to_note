

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_money/app/locate/lang_code.dart';
import 'package:your_money/data/storage/storage.dart';
import 'package:your_money/models/backup_data.dart';
import 'package:your_money/models/expenses.dart';
import 'package:your_money/repository/repository_auth.dart';
import 'package:your_money/repository/repository_backup.dart';
import 'package:your_money/repository/repository_menu.dart';
import 'package:your_money/screens/backup/backup.dart';

part 'backup_state.dart';

class BackupCubit extends Cubit<BackupState> {
  BackupCubit() : super(const BackupState());

  List<BackupData> listBackupDefault = [];

  loading() async {
    streamUser();
    if(RepositoryAuth.currentUser.uid != ""){
      emit(const BackupState(logged: true,message: "",nameSave: ""));
      loadListBackupLocal();
      await logInWithGoogle();
    }else{
      emit(const BackupState(logged: false,message: "",nameSave: ""));
    }
  }

  recoveryBackup(BackupData data){
    RepositoryMenu().loadData(data.expenses);
    Future.delayed(const Duration(seconds: 3),(){
      showMess(BackupShowMess.messSuccess);
    });
  }

  deleteBackup(BackupData data){
    state.listBackup.remove(data);
    RepositoryBackup().deleteBackup(RepositoryAuth.currentUser.uid, data.id).then((value) {
      if(value == "success"){
        showMess(BackupShowMess.messSuccess);
      }else{
        emit(state.copyWith(message: value));
        showMess(BackupShowMess.messError);
      }
    });
    print(data.id);
  }

  loadListBackupLocal()async{
    List<BackupData> listBackup = await StorageSecure.getListBackup();
    listBackupDefault = listBackup;
    emit(state.copyWith(listBackup: listBackup));
    reload(BackupReload.listBackup);
  }

  saveBackupLocal() async{
    StorageSecure.saveListBackup(state.listBackup);
  }

  reloadListBackup() async{
    if(RepositoryAuth.currentUser.uid != ""){
      List<BackupData> listBackup = await RepositoryBackup().getAllBackup(RepositoryAuth.currentUser.uid);
      listBackupDefault = listBackup;
      emit(state.copyWith(listBackup: listBackup));
      reload(BackupReload.listBackup);
    }
  }

  sortList(int index){
    List<BackupData> listSort = List.from(listBackupDefault);
    if(index == 0){
      emit(state.copyWith(listBackup: listSort));
    }
    if(index == 1){
      listSort.sort((a,b) => a.date.compareTo(b.date));
    }
    if(index == 2){
      listSort.sort((a,b) => b.date.compareTo(a.date));
    }
    emit(state.copyWith(listBackup: listSort));
    reload(BackupReload.listBackup);
  }

  loadListBackup(String uid) async{
    List<BackupData> listBackup = await RepositoryBackup().getAllBackup(uid);
    listBackupDefault = listBackup;
    emit(state.copyWith(listBackup: listBackup));
    reload(BackupReload.listBackup);
  }

  streamUser(){
    RepositoryAuth.streamUser.listen((event) {
      if(event != null){
        emit(const BackupState(logged: true));
        loadListBackup(event.uid);
      }else{
        emit(const BackupState(logged: false));
      }
    });
  }

 Future<bool> logInWithGoogle() async{
    await RepositoryAuth().loginWithGoogle();
    return true;
  }


  backupDataToCloud(String nameSave) async{
    if(RepositoryAuth.currentUser.uid == ""){
      emit(state.copyWith(message: AppLang.lang(LangCode.noAccount)));
      showMess(BackupShowMess.messError);
      return;
    }
    if(nameSave == state.nameSave){
      emit(state.copyWith(message: AppLang.lang(LangCode.nameUsed)));
      showMess(BackupShowMess.messError);
      return;
    }
    if(nameSave==""){
      emit(state.copyWith(message: AppLang.lang(LangCode.nameIsEmpty)));
      showMess(BackupShowMess.messError);
      return;
    }
    if(RepositoryAuth.currentUser.uid != ""){
    }

    Expenses ex = await RepositoryMenu().getDataToStorage();
    BackupData data = BackupData(id: "", name: nameSave, date: DateTime.now().toString(), expenses: ex);
    RepositoryBackup().saveData(uid: RepositoryAuth.currentUser.uid, data: data).then((value) {
      if(value == "success"){
        showMess(BackupShowMess.messSuccess);
        state.listBackup.insert(0,data);
        listBackupDefault = state.listBackup;
        emit(state.copyWith(nameSave: nameSave));
        reload(BackupReload.listBackup);
        return;
      }
      emit(state.copyWith(message: value));
      showMess(BackupShowMess.messError);
    });
  }
  
  showMess(BackupShowMess showMess){
    emit(state.copyWith(showMess: showMess));
    emit(state.copyWith(showMess: BackupShowMess.empty));
  }

  reload(BackupReload reload){
    emit(state.copyWith(reload: reload));
    emit(state.copyWith(reload: BackupReload.empty));
  }
}
