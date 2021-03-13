
import 'dart:ui';
import 'package:farmtechsoln/loading.dart';
import 'package:farmtechsoln/tools/diseaseClass.dart';
import 'package:farmtechsoln/tools/plantClass.dart';
import 'package:flutter/material.dart';
//import 'package:image/image.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:farmtechsoln/disease_collection.dart';
import 'package:farmtechsoln/myhomepage.dart';
import 'package:farmtechsoln/tools/classifier.dart';

class Recognizenew extends StatefulWidget {
  @override
  _RecognizenewState createState() => _RecognizenewState();
}

class _RecognizenewState extends State<Recognizenew> {
 //final _recognize = RecognizerTool();
 Classifier _classifier;
  File _image;
  double _imageWidth;
  double _imageHeight;
  var _recognitions;

  final picker = ImagePicker();
  bool loading = true;

 

  @override
    void initState() {
    super.initState();

 //     _initModel();
 // dialog(context);
  
    _classifier = Classifier();
    print("classifier below");
    print(_classifier.toString()); 
 }


dialog(){
showDialog(context:context,
builder: (context)=>AlertDialog(
  title:Text("Reminder")
  ,content:Text("take a photo of the infected leaf"),
actions: [ElevatedButton(onPressed:(){ Navigator.pop(context);},
child: Icon(Icons.close),
)],
)
);



   } 



  sendImage(File file) async{
  if(file == null)return;
  final File image =File(file.path);
 // var recognitions = await _recognize.recognize(file);  
  
      var loadImage = await _classifier.loadImage(image.path);
      var loadResult = await _classifier.runModel(loadImage);
   
print("debugging");


  print("loadresult");
  print( loadResult.toString());
  print("final");
  print(loadResult[0]['label']);
  print(loadResult[0]['value']);
 setState(() {
      _recognitions = loadResult;
    });

  //get image width and height
  FileImage(image).resolve(ImageConfiguration()).addListener((ImageStreamListener((ImageInfo info, bool _){
        setState(() {
          _imageWidth = info.image.width.toDouble();
          _imageHeight = info.image.height.toDouble();
          _image = image;
        });
      })));
    }



//get image from camera
  selectFromCamera()
  async {
  PickedFile imageVar = await picker.getImage(source: ImageSource.camera);
  final File image = File(imageVar.path);
    
  if(image == null) return;
  
  setState(() {
  });
  sendImage(image);

  }


//get image from gallery
  selectFromGallery()
  async {
  PickedFile imageVar = await picker.getImage(source: ImageSource.gallery);
  final File image = File(imageVar.path);
   if(image == null) return;
  
  setState(() {
  });

  sendImage(image);
  }


Widget printValue(rcg) {
    if (rcg == null) {
      return Text('', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700));
    }else if(rcg.isEmpty){
      return Center(
        child: Text("Could not recognize", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
      );
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(0,0,0,0),
      child: Center(
        child: Column(
          children: [
            Text(
              "Prediction: "+_recognitions[0]['label'].toString().toUpperCase(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          Text(
              "Confidence: "+(_recognitions[0]['value']*100).toStringAsFixed(2).toString()+"%",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          //Got to disease collections for more information
          /*Container(padding:EdgeInsets.all(2),height: 20,width: 150,color:Colors.green
              ,child:
              FlatButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>DiseaseCollection()));
              },
//               icon: Icon(Icons.my_library_books, color: Colors.white,), label:
            child:Text(
                      "Check Disease Details",textAlign: TextAlign.center,style: TextStyle( fontSize: 15,color: Colors.white),
              ))
             )*/
             ElevatedButton(child: Text("check disease"),onPressed: (){checkdisease(context, _recognitions);},)
          ],
        ),
      ),
    );
  }



@override

Widget build(BuildContext context) {
setState(() {
  loading=false;
});
    // get the width and height of current screen the app is running on
    Size size = MediaQuery.of(context).size;

    // initialize two variables that will represent final width and height of the segmentation
    // and image preview on screen
    double finalW;
    double finalH;

    // when the app is first launch usually image width and height will be null
    // therefore for default value screen width and height is given
    if(_imageWidth == null && _imageHeight == null) {
      finalW = size.width;
      finalH = size.height;
    }else {

      // ratio width and ratio height will given ratio to
//      // scale up or down the preview image
      double ratioW = size.width / _imageWidth;
      double ratioH = size.height / _imageHeight;

      // final width and height after the ratio scaling is applied
      finalW = _imageWidth * ratioW*.85;
      finalH = _imageHeight * ratioH*.50;
    }

//send image

return loading ? Loading(): Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text("FarmTechSoln", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.green,
          centerTitle: true,
          actions: <Widget>[
           ElevatedButton(child: Icon(Icons.close,color: Colors.white,)
          ,onPressed:(){ 
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
          })]),
        body: ListView(
          children: <Widget>[
            Container(height: MediaQuery.of(context).size.height*0.15,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(1,1,1,1),
                  child: printValue(_recognitions),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(1,1,1,1),
              child: _image == null ? Center(child:Text("Select image of the infected leaf ",style:TextStyle(color:Colors.red),),)
              : Center(child:Image.file(_image, fit: BoxFit.fill, width: finalW, height: finalH))
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                  child: Container(
                    height: 50,
                    width: 150,
                    color: Colors.redAccent,
                    child: FlatButton.icon(
                      onPressed: selectFromCamera,
                      icon: Icon(Icons.camera_alt, color: Colors.white, size: 30,),
                      color: Colors.blueAccent,
                      label: Text(
                        "Camera",style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  color: Colors.tealAccent,
                  child: FlatButton.icon(
                    onPressed: selectFromGallery,
                 //     onPressed: dialog,
                    
                    icon: Icon(Icons.file_upload, color: Colors.white, size: 30,),
                    color: Colors.green,
                    label: Text(
                      "Gallery",style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Container(padding:EdgeInsets.all(10),height: 50,width: 150,color:Colors.deepOrangeAccent
              ,child:
              FlatButton.icon(onPressed: (){
                setState(() {
                  _image=null;
                  _recognitions = null;
                });
              }, icon: Icon(Icons.refresh, color: Colors.white,), label:Text(
                      "Reset",style: TextStyle( fontSize: 20,color: Colors.white),
                    ))
             )],)
          ],
        )
    );


}


/*
  void _initModel() async {
    var res = await _recognize.loadModel();
    print(res);
  }

*/

}


/**** this is dialog box for cheking diseases******/

checkdisease(BuildContext context,var _recognition){ 
    
  
    Diseases disease;
    PlantClass plant;

    final items= PlantClass.getPlantClass();
    final it = items[1].diseases.toString();
    print(it);
    List pla=items[2].diseases.toList();
    print(pla.toString());
    String _name = "";
    String _cause = "";
    String _symptoms = "";
    String _image = "";


  if (_recognition[0]['label'].toString() == "Pepper bell Bacterial spot")
  {
  print("correct");
  print(items[0].diseases[0].name);
  _name = items[0].diseases[0].name;
  _cause= items[0].diseases[0].cause;
  _symptoms = items[0].diseases[0].symptoms;
  _image = items[0].diseases[0].image;
  
  }

  else if (_recognition[0]['label'].toString() == "Potato Early blight"){
 print("correct");
  print(items[1].diseases[0].name);
  _name = items[1].diseases[0].name;
  _cause= items[1].diseases[0].cause;
  _symptoms = items[1].diseases[0].symptoms;
 _image = items[1].diseases[0].image;
  }

else if (_recognition[0]['label'].toString() == "Potato Late blight"){
    print("correct");
  print(items[1].diseases[1].name);
  
  print(items[1].diseases[1].name);
  _name = items[1].diseases[1].name;
  _cause= items[1].diseases[1].cause;
  _symptoms = items[1].diseases[1].symptoms;
  _image = items[1].diseases[1].image;

  }


else if (_recognition[0]['label'].toString() == "Tomato Bacterial spot"){
    print("correct");
  print(items[2].diseases[0].name);
  
  print(items[2].diseases[0].name);
  _name = items[2].diseases[0].name;
  _cause= items[2].diseases[0].cause;
  _symptoms = items[2].diseases[0].symptoms;
  _image = items[2].diseases[0].image;
 
  }

else if (_recognition[0]['label'].toString() == "Tomato Early blight"){
    print("correct");
  print(items[2].diseases[1].name);
  _name = items[2].diseases[1].name;
  _cause= items[2].diseases[1].cause;
  _symptoms = items[2].diseases[1].symptoms;
  _image = items[2].diseases[1].image;
 
  }
else if (_recognition[0]['label'].toString() == "Tomato Late blight"){
    print("correct");
  print(items[2].diseases[2].name);
  _name = items[2].diseases[2].name;
  _cause= items[2].diseases[2].cause;
  _symptoms = items[2].diseases[2].symptoms;
 
  _image = items[2].diseases[2].image;
  }


else if (_recognition[0]['label'].toString() == "Tomato Leaf Mold"){
    print("correct");
  print(items[2].diseases[3].name);
  _name = items[2].diseases[3].name;
  _cause= items[2].diseases[3].cause;
  _symptoms = items[2].diseases[3].symptoms;
 _image = items[2].diseases[3].image;
  
  }

else if (_recognition[0]['label'].toString() == "Tomato Septoria leaf spot"){
    print("correct");
  print(items[2].diseases[4].name);
  _name = items[2].diseases[4].name;
  _cause= items[2].diseases[4].cause;
  _symptoms = items[2].diseases[4].symptoms;
  _image = items[2].diseases[4].image;
  }

else if (_recognition[0]['label'].toString() == "Tomato Spider mites/Two spotted spider mite"){
    print("correct");
  print(items[2].diseases[5].name);
  _name = items[2].diseases[5].name;
  _cause= items[2].diseases[5].cause;
  _symptoms = items[2].diseases[5].symptoms;   
  _image = items[2].diseases[5].image;
  }

else if (_recognition[0]['label'].toString() == "Tomato Target Spot"){
    print("correct");
  print(items[2].diseases[6].name);
  _name = items[2].diseases[6].name;
  _cause= items[2].diseases[6].cause;
  _symptoms = items[2].diseases[6].symptoms;
  _image = items[2].diseases[5].image;   
  }

else if (_recognition[0]['label'].toString() == "Tomato Tomato YellowLeaf Curl Virus"){
    print("correct");
  print(items[2].diseases[7].name);  
  _name = items[2].diseases[7].name;
  _cause= items[2].diseases[7].cause;
  _symptoms = items[2].diseases[7].symptoms;
  _image = items[2].diseases[7].image;
 
  }

else if (_recognition[0]['label'].toString() == "Tomato Tomato mosaic virus"){
    print("correct");
  print(items[2].diseases[8].name);
  _name = items[2].diseases[8].name;
  _cause= items[2].diseases[8].cause;
  _symptoms = items[2].diseases[8].symptoms;
  _image = items[2].diseases[8].image;
  }






/** return the showdialog**/
    showDialog(context:context,
    builder: (BuildContext context){
    return AlertDialog(
      title:Text(_name.toUpperCase())
      ,content:Container(height: MediaQuery.of(context).size.height*0.6,width: MediaQuery.of(context).size.width*0.8,
        child: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
          Container(height: MediaQuery.of(context).size.height*0.3,padding: EdgeInsets.all(5),
            decoration:BoxDecoration(image: DecorationImage(image:AssetImage("assets/images/"+_image),fit: BoxFit.fill)),)
//            Text(_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height*0.1 ),),
              ,SizedBox(height:5)
              ,Container(child: Row(children:[Text("CAUSE:",style: TextStyle(fontWeight: FontWeight.bold)),Text(_cause)])),
              SizedBox(height:5)
              ,Container(alignment: Alignment.topLeft,
                child: Column(
                children: [Text("SYMPTOMS:",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                  Text(_symptoms,textAlign:TextAlign.justify),
                ],
              ))
            ],
          ),
        ))),
    actions: [ElevatedButton(onPressed:(){ Navigator.pop(context);},
    child: Icon(Icons.close),
    )],
    );}
    );
    }

