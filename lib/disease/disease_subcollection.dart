import 'package:flutter/material.dart';
import 'package:farmtechsoln/tools/plantClass.dart';


class DiseaseSubcollection extends StatefulWidget {
  DiseaseSubcollection({Key key, this.plant}):super(key: key);
  final PlantClass plant;
  @override
  _DiseaseSubcollectionState createState() => _DiseaseSubcollectionState(plant: plant);
}

class _DiseaseSubcollectionState extends State<DiseaseSubcollection> {
  _DiseaseSubcollectionState({this.plant});
  final PlantClass plant;
  
  @override
  Widget build(BuildContext context) {

//  final Diseases dis =plant.diseases[0];
//  final Diseases dise = plant.diseases;
//    print(dis.name);
//    print(dis.management);
    return Scaffold(appBar:  AppBar(title:Text("Disease SubCollection")),
    //  actions: <Widget>[
    //       ElevatedButton(child: Icon(Icons.close,color: Colors.white,)
     //     ,onPressed:(){ 
     //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
     //     }
     //     )
     // ],),
      body: 
      Container(padding: EdgeInsets.all(5),
      child:ListView.builder(itemCount: plant.diseases.length,
      itemBuilder: (context,index){
        return(DiseaseSubList(disease:plant.diseases[index],reference:plant.reference));
      },),) ,     
    );
  }
}


class DiseaseSubList extends StatelessWidget {
  DiseaseSubList({Key key,this.disease,this.reference}):super(key:key);
  final Diseases disease;
  final String reference;
  @override
  Widget build(BuildContext context) {
    double _sizeW=MediaQuery.of(context).size.width;
    double _sizeH=MediaQuery.of(context).size.height;
    return Container(width: _sizeW*0.6,height: _sizeH*0.15,
      child: Card(
        child: Center(
          child: ListTile(leading:CircleAvatar(backgroundImage: AssetImage("assets/images/"+disease.image),radius: _sizeH*0.06,)
          ,title: Text(disease.name),
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>DiseaseSublistDetails(disease:disease,reference:reference)));
          },),
        ),
      ),
    );
  }
}


class DiseaseSublistDetails extends StatelessWidget {
  DiseaseSublistDetails({Key key, this.disease,this.reference}):super(key: key);
  final Diseases disease;
  final String reference;
  @override
  Widget build(BuildContext context) {
    double _sizeH = MediaQuery.of(context).size.height;
    return Scaffold(
    appBar: AppBar(title:Text(disease.name.toLowerCase())),
    //  actions: <Widget>[
    //       ElevatedButton(child: Icon(Icons.close,color: Colors.white,)
     //     ,onPressed:(){ 
      //    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
      //    })],),
      body: Container(decoration: BoxDecoration(color:Colors.green[100]),
      //height: _sizeH*0.8,
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                _profileImage(item:disease,size:_sizeH),
              // SizedBox(height: 10,),
                _details(item: disease.symptoms,size: _sizeH,subtitle: "Symptoms",)
                ,_details(item: disease.cause,size: _sizeH,subtitle: "Cause",)
                ,_details(item: disease.comments,size: _sizeH,subtitle: "Comments",)
                ,_details(item: disease.management,size: _sizeH,subtitle: "Management")
                ,_details(item: reference,size: _sizeH,subtitle: "Reference",)              
                ],),
              )),
    );

  }
}


class _profileImage extends StatelessWidget {
  _profileImage({Key key, this.item,this.size}):super(key: key);
  final double size;
  final Diseases item;
  @override
  Widget build(BuildContext context) {
    return  Container(padding: EdgeInsets.all(10),
      child: Card(elevation: 10,child: Column(
        mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
        Container(height: size*0.4,padding: EdgeInsets.all(5),
          decoration:BoxDecoration(image: DecorationImage(image:AssetImage("assets/images/"+item.image),fit: BoxFit.fill)),),
        Container(padding:EdgeInsets.all(5),child: Text(item.name.toUpperCase(),textAlign:TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold,wordSpacing: 2),))    
      ],),),
    );
  }
}




class _details extends StatelessWidget {
  _details({Key key, this.item, this.size,this.subtitle}):super(key: key);

  final String item;
  final String subtitle;
  double size;

  @override
  Widget build(BuildContext context) {
    return Container(padding:EdgeInsets.all(5),width: MediaQuery.of(context).size.width*0.95,
      child: Card(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Container(padding:EdgeInsets.all(5),decoration: BoxDecoration(color:Colors.green[200]),
          width: double.infinity,
          child: Center(child: Text(subtitle,style: TextStyle(fontWeight: FontWeight.bold),))),
          SizedBox(height:8)  
          ,Text(item,textAlign: TextAlign.justify,),
          ],
        ),
      )))
    ;
  }
}