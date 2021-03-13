import 'package:farmtechsoln/myhomepage.dart';
import 'package:flutter/material.dart';
import 'package:farmtechsoln/plant_selections.dart';

class PlantCollection extends StatefulWidget {
  @override
  _PlantCollectionState createState() => _PlantCollectionState();
}

class _PlantCollectionState extends State<PlantCollection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:  AppBar(title:Text("Plant Collection"),
      actions: <Widget>[
           ElevatedButton(child: Icon(Icons.close,color: Colors.white,)
          ,onPressed:(){ 
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
          }
          )
      ],),
body: Container(padding: EdgeInsets.all(10),
  //height: MediaQuery.of(context).size.height*0.5,
  child:PlantSelections() ,) ,     
    );
  }
}