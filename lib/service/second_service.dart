

import 'package:turkaiassessment/model/auth.dart';
import 'package:turkaiassessment/model/user.dart';
import 'package:turkaiassessment/service/db_base.dart';

class SecondService implements DBBase{
  @override
  Future<List<Auth>> getAllUser() {
    // TODO: implement getAllUser
    throw UnimplementedError();
  }

  @override
  Future<MyUser> currentUser(String userId) {
    // TODO: implement currentUser
    throw UnimplementedError();
  }



}
