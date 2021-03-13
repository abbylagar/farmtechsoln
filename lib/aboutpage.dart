import 'dart:ui';

import 'package:farmtechsoln/myhomepage.dart';
import 'package:flutter/material.dart';
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   double _screenH = MediaQuery.of(context).size.height;
   double _screenW = MediaQuery.of(context).size.width;

    return Scaffold(appBar: AppBar(title:Text("FarmTechSoln"),
      actions: <Widget>[
           ElevatedButton(child: Icon(Icons.close,color: Colors.white,)
          ,onPressed:(){ 
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
          }
          )
      ],),
      body: Container(
          width:_screenW, 
           decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,
           colors: [Colors.green, Colors.greenAccent,Colors.green[100]])),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(elevation: 5,
                        child: Container(
                        height: _screenH*0.4,
                        decoration: BoxDecoration(image:DecorationImage(image:AssetImage("assets/images/design2.png"),fit:BoxFit.fill)),
                          child:Center(child: Container(color: Colors.white70,
                            child: Text("Delivering farm technology within your reach",style: TextStyle(fontSize:15 ,color: Colors.black,fontWeight: FontWeight.bold),))) 
                        )),
                    )
                  ,  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: _screenH*0.3, width: _screenW,
                    decoration:BoxDecoration(image:DecorationImage(image:AssetImage("assets/images/veg2.jpg"),fit:BoxFit.fill)),
                          child: Center(
                            child: Container(color:Colors.white70,height: _screenH*0.15,
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Sources:",textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text("Information from"),
                                  Text("https://plantvillage.psu.edu/",style:TextStyle(fontWeight: FontWeight.bold)),
                                  Text("Images from:"),
                                  Text("PlantVillage and Canva",style:TextStyle(fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ),
                        ),
                  ),
    //                  Container(color: Colors.greenAccent, width: _screenW*0.9,
    //                    child:Text("Contact me at abbylagar07@gmail.com",style: TextStyle(fontWeight: FontWeight.bold),),)
                       ])));          
  }
}