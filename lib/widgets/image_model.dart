import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget{
  final List<ImageModel> imlist;
  ImageList(this.imlist);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: imlist.length,
        itemBuilder: (context,int index){
          return buildImage(imlist[index]);
        },
        );
  }

  Widget buildImage(ImageModel image){
   return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1.0)),
        margin: EdgeInsets.fromLTRB(20,20,20,0),
        padding: EdgeInsets.all(20),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        Image.network(image.url),
        Container(margin: EdgeInsets.only(top: 5),child:Text(image.title),)
    ],
    )
   ) ;
  }
}