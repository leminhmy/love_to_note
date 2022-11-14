import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:your_money/models/backup_data.dart';
import 'package:your_money/models/expenses.dart';
import 'package:your_money/repository/repository_menu.dart';

class RepositoryBackup {
  final FirebaseFirestore _firebaseFiretore;

  RepositoryBackup({FirebaseFirestore? firebaseFirestore})
      : _firebaseFiretore = firebaseFirestore ?? FirebaseFirestore.instance;


 Future<String> saveData({required String uid,required BackupData data}) async{
   try{
     await _firebaseFiretore.collection('backup').doc(uid).collection('listBackup').add(data.toJson());
    return "success";
   } on FirebaseException  catch (error){
     return error.message!;
   }
  }

  Future<List<BackupData>> getAllBackup(String uid) async{
    try{
      var snapshot =  await _firebaseFiretore.collection('backup').doc(uid).collection('listBackup').get();
      return snapshot.docs.map((e) => BackupData.formSnapshot(e)).toList();
    } on FirebaseException  catch (error){
      log("$error");
      return [];
    }
  }

  Future<String> deleteBackup(String uid,String idBackup) async{
   try{
     await _firebaseFiretore.collection('backup').doc(uid).collection('listBackup').doc(idBackup).delete();
     return  "success";
   } on FirebaseException catch (error){
     return error.message??"error";
   }
  }
}
