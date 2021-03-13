
import 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:image/image.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:farmtechsoln/disease_collection.dart';
import 'package:farmtechsoln/myhomepage.dart';
import 'package:farmtechsoln/tools/classifier.dart';

class Recognize extends StatefulWidget {
  @override
  _RecognizeState createState() => _RecognizeState();
}

class _RecognizeState extends State<Recognize> {
 //final _recognize = RecognizerTool();
 Classifier _classifier;
  File _image;
  double _imageWidth;
  double _imageHeight;
  var _recognitions;

  final picker = ImagePicker();



  @override
    void initState() {
    super.initState();
 //     _initModel();
 // dialog(context);
    _classifier = Classifier();
    }


   void dialog(BuildContext context){
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
              "Confidence: "+(_recognitions[0]['value']*100).toStringAsFixed(2).toString(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          //Got to disease collections for more information
          Container(padding:EdgeInsets.all(2),height: 20,width: 150,color:Colors.green
              ,child:
              FlatButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>DiseaseCollection()));
              },
//               icon: Icon(Icons.my_library_books, color: Colors.white,), label:
child:Text(
                      "Check Disease Details",textAlign: TextAlign.center,style: TextStyle( fontSize: 15,color: Colors.white),
              ))
             )
          ],
        ),
      ),
    );
  }



@override
Widget build(BuildContext context) {

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

    return Scaffold(
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