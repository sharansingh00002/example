import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'models/image_model.dart';
import 'widgets/image_model.dart';
import 'login_page/login.dart';
import 'login_page/login_bloc.dart';
import 'package:flutter_app/Pokemon.dart';
import 'package:flutter_app/TrialClass.dart';

void main() => runApp(Example());

class MyApp2 extends StatefulWidget{
  @override
  createState()
  {
    return MyState();
  }
}

class MyState extends State<MyApp2> {
  int counter=0;
  List<ImageModel> imageList=[];
  void fetchImage() async{
  counter++;
  var response =await get('https://jsonplaceholder.typicode.com/photos/$counter');
  var model=ImageModel.fromJson(json.decode(response.body));
  setState(() {
    imageList.add(model);
  });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Trial2 App",
      home: Scaffold(
        appBar: AppBar(title: Text("Trial2 APp"),),
        floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: Icon(Icons.add),
        ),
        body: ImageList(imageList),
      ),
    );

  }

}

