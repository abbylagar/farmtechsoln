import 'dart:async';

import 'package:farmtechsoln/myhomepage.dart';
import 'package:flutter/material.dart';

import "package:flutter_spinkit/flutter_spinkit.dart";

class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), (){

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>MyHomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.green,
    body: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(height: MediaQuery.of(context).size.height*0.4,width: MediaQuery.of(context).size.height*0.4,
                decoration:BoxDecoration(image:DecorationImage(image: AssetImage('assets/launcher/14.png'),fit: BoxFit.fill),
                shape: BoxShape.circle
             
          )),
        ),
        SpinKitCircle(color:Colors.white,size:60)]));
  }
}


