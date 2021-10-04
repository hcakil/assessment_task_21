import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkaiassessment/view_model/auth_model.dart';
import 'package:turkaiassessment/view_model/user_model.dart';

import 'details_page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List-Page-2"),),
      body: Consumer<AllAuthViewModel>(
          builder: (context, model, child){

             if (model.state == AuthViewState.Busy) {
               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Center(
                   child: CircularProgressIndicator(),
                 ),
               );
             }else if (model.state == AuthViewState.Loaded){
               print("---->LOADED");
               return ListView.builder(itemBuilder: (context, index) {
                 if (model.kullanicilarListesi.length == 0) {
                   return nothingUI();
                 } else {
                   // print("yeni eleman bekleniyor");
                   return _listItemCreate(index);
                 }

               },
                 itemCount: model.kullanicilarListesi.length,
               );
             }else {
               return Container();
             }



          }
      )
    );
  }

  Widget nothingUI() {
    return Center(child: Text("No Item",
      style: (TextStyle(fontSize: 42)
      ),),
    );
  }

  Widget _listItemCreate(int index) {

    final _allAuthViewModel = Provider.of<AllAuthViewModel>(context);
    var _oAnkiUser = _allAuthViewModel.kullanicilarListesi[index];
    return GestureDetector(
      onTap: (){
        print(index.toString()+" inci liste elemanı tıklandı");
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => UserModel(
                  userId:  _oAnkiUser.id),
                child: DetailsPage(),
              )),
        );
      },
      child: Card(
          child: ListTile(
            title: _oAnkiUser.name == null ? Text("No name") : Text(_oAnkiUser.name + " "+ _oAnkiUser.surname),
            subtitle:  Text(_oAnkiUser.id),
            leading: Icon(Icons.person),
          ),),
    );

  }
}
