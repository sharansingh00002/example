
import 'package:flutter/material.dart';
import 'package:flutter_app/PokeDetail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_app/models/pokemon_model.dart';

class PokemonApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new PokemonState();
  }

}

class PokemonState extends State<PokemonApp>{
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  PokeHub pokehub;
  @override
  void initState() {
    super.initState();
    fetchData();
  }


  void fetchData() async{
    var response = await http.get(url);
    var jsonData=jsonDecode(response.body);
    pokehub=PokeHub.fromJson(jsonData);
    print(jsonData);
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pokemon",
      home: Pokemon1(),
    );
  }

  Widget Pokemon1(){
    return Scaffold(
      appBar: AppBar(title: Text("Pokemon"),
      backgroundColor: Colors.cyan,),
      body: pokehub==null?Center(
        child: CircularProgressIndicator(),
      ):
      GridView.count(crossAxisCount: 2,
      children: pokehub.pokemon.map((poke)=>Card(
        
        child: InkWell(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> PokeDetail(pokemon: poke,)));},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(poke.img)),
                ),
              ),
              Text(poke.name,style: TextStyle(fontSize: 20.0),)
            ],
          ),
        ),

      ))
          .toList(),
      )
    );
}

}
