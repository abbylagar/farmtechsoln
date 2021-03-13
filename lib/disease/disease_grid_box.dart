
import 'package:farmtechsoln/disease_grid.dart';
import 'package:farmtechsoln/disease_subcollection.dart';
import 'package:farmtechsoln/plant_details.dart';
import 'package:farmtechsoln/tools/plantClass.dart';
import 'package:flutter/material.dart';

class DiseaseGridBox extends StatelessWidget {
  
  DiseaseGridBox({Key key,this.disease,this.reference}):super(key:key);
  final Diseases disease;
  final String reference;
  @override
  Widget build(BuildContext context) {
    double _sizeW=MediaQuery.of(context).size.width;
    double _sizeH=MediaQuery.of(context).size.height;
        return  GridTile(child:
        MaterialButton(elevation: 30,
      onPressed: (){
   Navigator.push(context,MaterialPageRoute(builder: (context)=>DiseaseSublistDetails(disease:disease,reference:reference)));        
      },
          child: Container(
      decoration: BoxDecoration(
        border: Border.all(color:Colors.green,width: 2),
          borderRadius: BorderRadius.circular(5),
      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/"+disease.image)),
                ),
                child: Container( width: _sizeW*.8,color: Colors.white,
                  child: Text(disease.name.toUpperCase(),textAlign: TextAlign.center ,
                  style: TextStyle(fontWeight: FontWeight.bold,),),),alignment: Alignment.bottomCenter,),
          
          ),
    
    );

  }
}
