


import 'package:turkaiassessment/model/auth.dart';
import 'package:turkaiassessment/model/user.dart';
import 'package:turkaiassessment/service/db_base.dart';
import 'package:turkaiassessment/service/first_service.dart';
import 'package:turkaiassessment/service/second_service.dart';

import '../locator.dart';

enum AppMode { DEBUG, RELEASE }


class AuthRepository implements DBBase {


  AppMode appMode = AppMode.RELEASE;

  FirstService _firstService = locator<FirstService>();
  SecondService _secondService = locator<SecondService>();

  List<Auth> allAuths = [];

  @override
  Future<List<Auth>> getAllUser() async {

    if (appMode == AppMode.DEBUG) {
      return await _secondService.getAllUser();
    } else {
      print("first service repository worked ");
      allAuths =await  _firstService.getAllUser();
      print("all auths from repo count "+allAuths.length.toString());
      return allAuths;
    }
  }

  @override
  Future<MyUser> currentUser(String userId) async {
    if (appMode == AppMode.DEBUG) {
      return await _secondService.currentUser(userId);
    } else {
      print("Auth Repo current user worked");
      MyUser _user = await _firstService.currentUser(userId);
      if (_user != null) {
        return  _user;
      } else
        return null;
    }
  }


}
