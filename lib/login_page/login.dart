import 'package:flutter/material.dart';


    class LP extends StatefulWidget{
    @override
    createState()=>LoginState();
    }

    class LoginState extends State<LP>{
      String email='';
      String pass='';

    var formKey=GlobalKey<FormState>();
    @override
    Widget build(BuildContext context) {
    return MaterialApp(home:Scaffold(body:Container(
    margin: EdgeInsets.all(30.0),
    child:Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          emailField(),
          passField(),
          submitButton(),
        ],
      ),
    ) ,
      )));
  }

  Widget emailField(){
      return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email Address",
        hintText:"abc@gmail.com",
      ),
      validator: (String val){
        if(!val.contains("@"))
          return "Enter email correctly";
        return null;
      },
        onSaved: (String val){
        email=val;
        },
    );
  }
  Widget passField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText:"enter password",
      ),
      validator: (String val){
        if (val.length < 4)
          return "enter valid pass";
        return null;
      },
      onSaved: (String val){
        pass=val;
      },
    );
  }
  Widget   submitButton(){
    return Container(
      margin: EdgeInsets.only(top: 10),
        child:RaisedButton(
      child: Text("submit"),
      onPressed: (){
        if(formKey.currentState.validate())
          {
           formKey.currentState.save();

          }
      },
    ));
  }
}


  
