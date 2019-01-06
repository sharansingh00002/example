import 'package:flutter/material.dart';

class Example extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() =>ExampleState();

}

class ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Trial App",
      home: Scaffold(
        body: Padding(padding: EdgeInsets.only(top: 10), child: widgets(),),
      ),
    );
  }

  widgets() {
    return Column(
      children: <Widget>[
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: double.infinity),
          child: Container(
            margin: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 40.0),
            height: 200,
            child: Image.asset("assets/images/image1.png"),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 50),
          child: fbButton(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: fbButton(),
        )
      ],
    );
  }

  fbButton() {
    return Container(
        color: Colors.cyan,
    margin: EdgeInsets.only(left: 40.0,right: 40.0),
    child:Expanded(
      child: RaisedButton(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("facebook",textAlign: TextAlign.center,)
        ],
      ),

   ),
    ));
  }


}


