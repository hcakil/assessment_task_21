import 'dart:io';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'package:turkaiassessment/pages/list_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _profilPhoto;
  String photoPath;
  final ImagePicker _picker = ImagePicker();

  void _kameradanFotoCek() async {
    var pickedPhoto = await _picker.getImage(source: ImageSource.camera);

    setState(
      () {
        _profilPhoto = File(pickedPhoto.path);
        // print("path of picked photo"+pickedPhoto.path);
        photoPath = pickedPhoto.path;
        Navigator.of(this.context).pop();
      },
    );
  }

  void _galeridenSec() async {
    var pickedPhoto = await _picker.getImage(source: ImageSource.gallery);

    setState(
      () {
        _profilPhoto = File(pickedPhoto.path);
        photoPath = pickedPhoto.path;
        //print("path of picked photo"+pickedPhoto.path);
        Navigator.of(this.context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // print("profil photo"+_profilPhoto.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment Turk AI-Page-1"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(8, 50, 8, 8),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 150,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.camera),
                                title: Text("Kameradan Foto Çek"),
                                onTap: () {
                                  _kameradanFotoCek();
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.image),
                                title: Text("Galeriden Seç"),
                                onTap: () {
                                  _galeridenSec();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade100,
                    backgroundImage: _profilPhoto == null
                        ? AssetImage(
                            "assets/select_img.jpg",
                          )
                        : FileImage(_profilPhoto),
                    radius: 125,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/3,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 50, 8, 8),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.purpleAccent,
                      shadowColor: Colors.purpleAccent,
                      elevation: 18,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child:
                      Text("Doğrula"),
                  onPressed: () => _postHttp(_profilPhoto),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _postHttp(File profilPhoto) async {
    //var url = 'https://task-21.herokuapp.com/store';
    try {
      //print(photoPath);
      // open a bytestream
      var stream =
          new http.ByteStream(DelegatingStream.typed(profilPhoto.openRead()));
      // get file length
      var length = await profilPhoto.length();

      // string to uri
      var uri = Uri.parse("https://task-21.herokuapp.com/store");

      // create multipart request
      var request = new http.MultipartRequest("POST", uri);

      // multipart that takes file
      var multipartFile = new http.MultipartFile('file', stream, length,
          filename: basename(profilPhoto.path));

      // add file to multipart
      request.files.add(multipartFile);
// send
      var response = await request.send();
      print(response.statusCode);
      // listen for response
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });

      if (response.statusCode == 200) {
        Navigator.of(this.context).push(MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => ListPage(),
        ));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
