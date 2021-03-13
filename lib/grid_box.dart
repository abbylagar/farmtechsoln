import 'package:farmtechsoln/plant_details.dart';
import 'package:farmtechsoln/tools/plantClass.dart';
import 'package:flutter/material.dart';


class GridBox extends StatelessWidget {
  GridBox({Key key, this.item}):super(key: key);
final PlantClass item;
  @override
  Widget build(BuildContext context) {
    double _sizeW=MediaQuery.of(context).size.width;
    double _sizeH=MediaQuery.of(context).size.height;
        return  GridTile(child:
        MaterialButton(elevation: 20,
          //style: ButtonStyle(backgroundColor: MaterialStateProperty()),
      onPressed: (){
   Navigator.push(context,MaterialPageRoute(builder: (context)=>PlantDetails(item:item)) );        
      },
//  {Navigator.push(context, MaterialPageRoute(builder: (context)=>route));},
          child: Container(
      decoration: BoxDecoration(
        border: Border.all(color:Colors.green,width: 2),
          borderRadius: BorderRadius.circular(5),
      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/"+item.image)),
                ),
      //height: _sizeH*0.5,
    //  ,padding: EdgeInsets.all(5),
                child: Container( width: _sizeW*.8,color: Colors.white,
                  child: Text(item.title.toLowerCase(),textAlign: TextAlign.center ,
                  style: TextStyle(fontWeight: FontWeight.bold,),),),alignment: Alignment.bottomCenter,),
       //        Container(
                 //color: Colors.green,
               //width: _sizeW * 0.4,
//              height: _sizeH*0.1,
         //         child: Text(item.title),alignment: Alignment.center,),
          
          ),
    
    );

  }
}