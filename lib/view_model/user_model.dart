

import 'package:flutter/material.dart';
import 'package:turkaiassessment/locator.dart';
import 'package:turkaiassessment/model/auth.dart';
import 'package:turkaiassessment/model/user.dart';
import 'package:turkaiassessment/repository/auth_repository.dart';
import 'package:turkaiassessment/service/db_base.dart';

enum ViewState { Idle, Busy }

class UserModel with ChangeNotifier implements DBBase {

  ViewState _state = ViewState.Idle;
  AuthRepository _authRepository = locator<AuthRepository>();
  MyUser _user;
 final String userId;

  MyUser get user => _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserModel({this.userId}) {
    currentUser(userId);
  }

  @override
  Future<MyUser> currentUser(String userId) async {
    try {
      state = ViewState.Busy;
      _user = await _authRepository.currentUser(userId);
      if (_user != null) {
        return _user;
      } else
        return null;
    } catch (e) {
      debugPrint(" User ViewModel deki current user hata " + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }


  @override
  Future<List<Auth>> getAllUser() {
    // TODO: implement getAllUser
    throw UnimplementedError();
  }
}
