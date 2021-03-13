import 'package:farmtechsoln/disease_grid_box.dart';
import 'package:farmtechsoln/tools/plantClass.dart';
import 'package:flutter/material.dart';


class DiseaseGrid extends StatelessWidget {
  DiseaseGrid({this.plant});
  final PlantClass plant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title:Text("Disease")),
       //gridview
        body:Container(padding:EdgeInsets.fromLTRB(10, 10, 10, 10),child:
        new GridView.builder(itemCount: plant.diseases.length,
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing:15,crossAxisSpacing: 2),
      itemBuilder:(context,index){
      return DiseaseGridBox(disease:plant.diseases[index],reference:plant.reference);
     
      
      })));
  }
}