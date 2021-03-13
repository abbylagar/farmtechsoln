import 'package:flutter/material.dart';


class FeaturedPlant extends StatelessWidget {
FeaturedPlant({Key key,this.name,this.description,this.image}):super(key:key);
final String description;
final String name;
final String image;
  @override
  Widget build(BuildContext context) {
  double _sizeH = MediaQuery.of(context).size.height;
    return Scaffold(appBar:  AppBar(title:Text(name.toUpperCase())),  
    body:
    Container(decoration: BoxDecoration(color: Colors.green[100]),height:double.infinity,
      child: SingleChildScrollView(
        child:Column(children:<Widget> [

      Container(padding: EdgeInsets.all(10),
          child: Card(elevation: 10,child: 
          Container(height: _sizeH*0.3,padding: EdgeInsets.all(5),
              decoration:BoxDecoration(image: DecorationImage(image:AssetImage("assets/images/"+image),fit: BoxFit.fill)),),
            ),),

      
          Container(
            width: MediaQuery.of(context).size.width,
            padding:EdgeInsets.all(5),
            child: Card(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description,textAlign: TextAlign.justify,),
          ))),

          Text("Source: https://plantvillage.psu.edu")
        ],)
    )));
  }
}

