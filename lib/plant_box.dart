import 'package:flutter/material.dart';
import 'package:farmtechsoln/plant_details.dart';
import 'package:farmtechsoln/tools/plantClass.dart';
class PlantBox extends StatelessWidget {
PlantBox({Key key, this.item}):super(key: key);
final PlantClass item;
  @override
  Widget build(BuildContext context) {
    double _sizeW=MediaQuery.of(context).size.width;
    double _sizeH=MediaQuery.of(context).size.height;
        return Container(width: _sizeW*0.6,
          height: _sizeH*0.15,
          child: Card(child: Center(
            child: ListTile(
              leading:CircleAvatar(backgroundImage: AssetImage("assets/images/"+item.image),radius: _sizeH*0.06,),
              title:Text(item.title,),
              onTap: (){

                Navigator.push(context,MaterialPageRoute(builder: (context)=>PlantDetails(item:item)) );
              },
              ),
          ),
          ),
    );

  }
}