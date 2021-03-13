import 'package:flutter/material.dart';
import 'package:farmtechsoln/tools/plantClass.dart';

class DiseaseList extends StatefulWidget {
 DiseaseList({Key key, this.disease}):super(key:key);
final PlantClass disease;
  @override
  _DiseaseListState createState() => _DiseaseListState();
}

class _DiseaseListState extends State<DiseaseList> {
  _DiseaseListState({this.disease});
  final PlantClass disease;
  
  @override
  Widget build(BuildContext context) {
  //  final disease = PlantClass.getPlantClass().
    return Container(child:Text("hello")
    
    );
  }
}