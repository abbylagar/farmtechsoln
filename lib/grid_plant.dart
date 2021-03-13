import 'package:farmtechsoln/grid_box.dart';
import 'package:farmtechsoln/myhomepage.dart';
import 'package:farmtechsoln/tools/plantClass.dart';
import 'package:flutter/material.dart';

import 'dart:ui';


class GridPlant extends StatelessWidget {
 
    @override 
    Widget build(BuildContext context){
      
    final plants = PlantClass.getPlantClass();
      return  Scaffold(appBar:  AppBar(title:Text("Plant Collection"),
      actions: <Widget>[
           ElevatedButton(child: Icon(Icons.close,color: Colors.white,)
          ,onPressed:(){ 
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
          }
          )
      ],), 
 //gridview
        body:Container(padding:EdgeInsets.fromLTRB(10, 10, 10, 10),child:
        new GridView.builder(itemCount: plants.length,
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing:15,crossAxisSpacing: 2),
      itemBuilder:(context,index){
      return GridBox(item:plants[index]);
             })));
    }
  }





class _gridTiles extends StatelessWidget {
  _gridTiles({Key key,this.image,this.description}):super(key: key); 
  final String image;
  final String description;
  Widget build(BuildContext context) {
     return GridTile(child: new Container(height: 50,margin:EdgeInsets.all(20),
    child:RaisedButton(hoverColor: Colors.teal,onPressed: (){},
    //showDialog(context: context,
    //builder:(BuildContext context)=>_showDetails(image: image,description:description));},
    child: Container(decoration:BoxDecoration(image:DecorationImage(
      image:AssetImage('assets/appimages/'+image),fit: BoxFit.cover)),
      ))) ,
    );
  }
}


class _showDetails extends StatelessWidget {
 _showDetails({Key key,this.image,this.description}):super(key: key); 
  final String image;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,width:100,
      child: Center(child:Container(child:Column(children:<Widget>[Image.asset('assets/appimages/'+image,height: 300),
      SizedBox(height:50),Text(description,style: TextStyle(fontWeight: FontWeight.normal),)])
      )),
    );
  }
}