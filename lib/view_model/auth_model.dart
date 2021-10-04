


import 'package:flutter/material.dart';
import 'package:turkaiassessment/model/auth.dart';
import 'package:turkaiassessment/repository/auth_repository.dart';

import '../locator.dart';

enum AuthViewState { Idle, Loaded, Busy }

class AllAuthViewModel with ChangeNotifier {
  AuthViewState _state = AuthViewState.Idle;

  AuthRepository _authRepository = locator<AuthRepository>();

  List<Auth> _allAuths;


  List<Auth> get kullanicilarListesi => _allAuths;

  AuthViewState get state => _state;

  set state(AuthViewState value) {
    _state = value;
    notifyListeners();
  }

  AllAuthViewModel(){
    _allAuths = [];
    getAuths();
  }

  void getAuths() async{
    print(" auth_model get auth worked");
    state = AuthViewState.Busy;
    var newList = await _authRepository.getAllUser();
     print ("NEW LİST ITEMS COUNT  "+newList.length.toString());

   if(newList != null)
     {
       newList.forEach(
             (auth) => print("eleman------------>" + auth.id),
       );
     }

    _allAuths.addAll(newList);
    state = AuthViewState.Loaded;
    print("auth view state ==>" + state.toString());


  }


}
