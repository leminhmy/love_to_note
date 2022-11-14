

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:your_money/data/service/auth_service.dart';
import 'package:your_money/data/storage/storage.dart';
import 'package:your_money/uitls/save_download_url.dart';

import '../models/user_model.dart';

class RepositoryAuth{
  static UserModel _currentUser = UserModel.empty;
  static UserModel get currentUser => _currentUser;
 static Stream<User?> streamUser = AuthService().handleAuthState();

  loadingAuth(UserModel userModel){
      _currentUser = userModel;
  }
   listenAuthState(){
    streamUser.listen((data) async {
      if(data != null){
        String downloadImage = await SaveDownload().downloadFile(data.photoURL!);
        _currentUser = UserModel(uid: data.uid, name: data.displayName!, image: downloadImage);
      }else{
        _currentUser = UserModel.empty;
      }
    });

   }

  Future<bool> loginWithGoogle() async{
    listenAuthState();
   await AuthService().signInWithGoogle();
   return true;
  }
  signOut() async{
    await AuthService().signOut();
    _currentUser = UserModel.empty;
  }
}