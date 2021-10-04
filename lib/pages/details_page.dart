import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkaiassessment/view_model/user_model.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page -3 "),
      ),
      body: _userModel.state == ViewState.Busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage(
                        "assets/profil.jpg",
                      ),
                      radius: 75,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "User ID = ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(_userModel.user.id,
                            style: TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Name = ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            _userModel.user.name == null
                                ? "-"
                                : _userModel.user.name,
                            style: TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Surame = ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            _userModel.user.surname == null
                                ? "-"
                                : _userModel.user.surname,
                            style: TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Identity Nu = ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            _userModel.user.identityNumber == null
                                ? "-"
                                : _userModel.user.identityNumber,
                            style: TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Father Name = ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            _userModel.user.fatherName == null
                                ? "-"
                                : _userModel.user.fatherName,
                            style: TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Mother Name = ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            _userModel.user.motherName == null
                                ? "-"
                                : _userModel.user.motherName,
                            style: TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Gender = ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            _userModel.user.gender == null
                                ? "-"
                                : _userModel.user.gender,
                            style: TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Birthday = ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            _userModel.user.birthday == null
                                ? "-"
                                : _userModel.user.birthday,
                            style: TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Birth Place = ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            _userModel.user.birthPlace == null
                                ? "-"
                                : _userModel.user.birthPlace,
                            style: TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Marital Status = ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            _userModel.user.maritalStatus == null
                                ? "-"
                                : _userModel.user.maritalStatus,
                            style: TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "City = ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            _userModel.user.city == null
                                ? "-"
                                : _userModel.user.city,
                            style: TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Town = ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            _userModel.user.town == null
                                ? "-"
                                : _userModel.user.town,
                            style: TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Date of Death = ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            _userModel.user.dateOfDeath == null
                                ? " --- "
                                : _userModel.user.dateOfDeath,
                            style: TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
