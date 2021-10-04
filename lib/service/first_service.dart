import 'package:turkaiassessment/model/auth.dart';
import 'package:http/http.dart' as http;
import 'package:turkaiassessment/model/user.dart';
import 'package:turkaiassessment/service/db_helper.dart';
import 'dart:convert' as convert;

import 'db_base.dart';

class FirstService implements DBBase {
  var databaseHelper = DatabaseHelper();

  @override
  Future<List<Auth>> getAllUser() async {
    print(" FIRST SERVICE get auth worked");
    var url = 'https://task-21.herokuapp.com/index';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      print("response ===>>" + jsonResponse["data"].toString());
      List<Auth> authList =
          (jsonResponse["data"] as List).map((p) => Auth.fromJson(p)).toList();

      // NOW STORE THE AUTHS JSON INFORMATIONS INTO turk_ai_db.db

      //first list them
      //databaseHelper.getAuths();
      //add all auth to list
      databaseHelper.addAuths(authList);

      return authList;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Future<MyUser> currentUser(String userId) async {
    try {
      //check if it is in db with user id
      var isInDb = await databaseHelper.checkUser(userId);
      print("db de var mı -->" + isInDb.toString());

      if (!isInDb) {
        print("means not in db get and add it");
        print(" FIRST SERVICE current user worked");
        var url = 'https://task-21.herokuapp.com/show/' + userId;

        // Await the http get response, then decode the json-formatted response.
        var response = await http.get(url);
        if (response.statusCode == 200) {
          var jsonResponse = convert.jsonDecode(response.body);

          print("response ===>>" + jsonResponse["data"].toString());
          MyUser user = MyUser.fromJson(jsonResponse["data"]);
          //add it to local db
          await databaseHelper.addUser(user);
          return MyUser.fromJson(jsonResponse["data"]);
        }
      } else {
        //in db there is this user still there
        //get it from local db
        print("artık db de var bu " + userId);
        var sonuc = await databaseHelper.getUser(userId);
        MyUser user = MyUser.fromJson(sonuc);
        return user;
      }
    } catch (e) {
      print(" Hata Current User  " + e.toString());
      return null;
    }
  }
}
