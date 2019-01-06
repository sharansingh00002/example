import 'package:flutter/material.dart';
import '../blocs/bloc_login.dart';
import '../blocs/Provider.dart';

class LoginBloc extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider(
        child:MaterialApp(
            home: Scaffold(
            body: LoginApp(),
      ),
    ));
  }
}

class LoginApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final bloc=Provider.of(context);

    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          email(bloc),
          pass(bloc),
          Container(margin: EdgeInsets.only(top: 25)),
          button(bloc)
        ],
      ),
    );
  }
  
  Widget email(LoginBloc2 bloc)
  {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context,snapshot){
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: "Email Address",
              hintText: "abc@gmail.com",
              errorText: snapshot.error
          ),
        );
      },
    );



  }

  Widget pass(LoginBloc2 bloc)
  {return StreamBuilder(
    stream: bloc.pass,
    builder: (context,snapshot){
      return TextField(
        onChanged: bloc.changePass,
        obscureText: true,
        decoration: InputDecoration(
            labelText: "pass",
            hintText: "*****",
            errorText: snapshot.error
        ),
      );
    },
  );
}

  Widget button(LoginBloc2 bloc)
  {

  return StreamBuilder(
    stream: bloc.submitValid,
    builder: (context,snapshot){
      return RaisedButton(
        child: Text("Login"),
        onPressed: snapshot.hasData ?  (){
        bloc.submit();
        }:null ,
        color: Colors.blue,
      );
    },
  );

  }


}
