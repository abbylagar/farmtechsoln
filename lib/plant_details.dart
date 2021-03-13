import 'package:flutter/material.dart';
import 'package:farmtechsoln/tools/plantClass.dart';

class PlantDetails extends StatelessWidget {
PlantDetails({Key key, this.item}):super(key: key);
final PlantClass item;
  @override
  Widget build(BuildContext context) {
     double _sizeH = MediaQuery.of(context).size.height;
    return Scaffold(appBar:  AppBar(title:Text(item.title)),  
    
    body:
    Container(decoration: BoxDecoration(color: Colors.green[100]),height: _sizeH*0.8,
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          _profileImage(item:item,size:_sizeH),
         // SizedBox(height: 10,),
          _details(item: item,size: _sizeH,),
          _reference(reference:item.reference,)],),
      ),
    )
    );
  }
}

class _profileImage extends StatelessWidget {
  _profileImage({Key key, this.item,this.size}):super(key: key);
  final double size;
  final PlantClass item;
  @override
  Widget build(BuildContext context) {
    return  Container(padding: EdgeInsets.all(10),
      child: Card(elevation: 10,child: Column(
        mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
        Container(height: size*0.3,padding: EdgeInsets.all(5),
          decoration:BoxDecoration(image: DecorationImage(image:AssetImage("assets/images/"+item.image),fit: BoxFit.fill)),),
        Container(padding:EdgeInsets.all(5),child: Text(item.title.toLowerCase(),textAlign:TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold,wordSpacing: 2),))    
      ],),),
    );
  }
}

class _details extends StatelessWidget {
  _details({Key key, this.item, this.size}):super(key: key);

  final PlantClass item;
  double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding:EdgeInsets.all(5),
      child: Card(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(item.description,textAlign: TextAlign.justify,),
      )))
    ;
  }
}


class _reference extends StatelessWidget {
  _reference({Key key, this.reference,}):super(key: key);
  final String reference;
  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width,
      padding:EdgeInsets.all(5),
      child: Card(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text("Reference:"),
            Text(reference,textAlign: TextAlign.justify,),
          ],
        ),
      )))
    ;
  }
}