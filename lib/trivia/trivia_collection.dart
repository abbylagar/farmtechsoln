import 'package:flutter/material.dart';
import 'package:farmtechsoln/myhomepage.dart';
import 'package:farmtechsoln/trivia_selections.dart';


class TriviaCollection extends StatefulWidget {
  @override
  _TriviaCollectionState createState() => _TriviaCollectionState();
}

class _TriviaCollectionState extends State<TriviaCollection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:  AppBar(title:Text("Trivia Collection"),
      actions: <Widget>[
           ElevatedButton(child: Icon(Icons.close,color: Colors.white,)
          ,onPressed:(){ 
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
          }
          )
      ],),
body: Container(padding: EdgeInsets.all(10),
  //height: MediaQuery.of(context).size.height*0.5,
  child:TriviaSelections() ,) ,     
    );
  }
}
