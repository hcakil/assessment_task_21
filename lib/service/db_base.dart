


import 'package:turkaiassessment/model/auth.dart';
import 'package:turkaiassessment/model/user.dart';

abstract class DBBase{

   Future<List<Auth>> getAllUser();
   Future<MyUser> currentUser(String userId);


}
