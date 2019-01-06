import 'package:flutter/material.dart';
import 'bloc_login.dart';

class Provider extends InheritedWidget{
  @override
  bool updateShouldNotify(_)=>true;

  Provider({Key key,Widget child}):super(key:key,child:child);

  final bloc=LoginBloc2();

  static LoginBloc2 of (BuildContext context)
  {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}