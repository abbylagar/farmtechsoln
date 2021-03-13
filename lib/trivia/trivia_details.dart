import 'package:flutter/material.dart';
import 'package:farmtechsoln/tools/triviaClass.dart';
import 'package:path/path.dart';

class TriviaDetails extends StatelessWidget {
  TriviaDetails({Key key,this.item}):super(key: key);
  final TriviaClass item;


@override
  Widget build(BuildContext context) {
     double _sizeH = MediaQuery.of(context).size.height;
     double _sizeW = MediaQuery.of(context).size.width;
    return Scaffold(appBar:  AppBar(title:Text("TRIVIA")),  
    body:
     Container(decoration: BoxDecoration(color: Colors.green[100]),
     width: double.infinity,
     child: Column(children: <Widget>[
      _question(size: _sizeH,width: _sizeW,question: item.question,),
   //   _answer(size: _sizeH,width: _sizeW,answer: item.answer,),
      Container(height: _sizeH*0.2,width: _sizeW*0.5,
        child: ElevatedButton(child: Text("Show Answer",style: TextStyle(fontSize: _sizeH*0.03),),onPressed:(){dialog(context, item.answer);}))

     ],),),
    );
  }
}



  dialog(BuildContext context,String answer){ 
     showDialog(context:context,
    builder: (BuildContext context){
    return AlertDialog(
      title:Text("ANSWER")
      ,content:Container(height: MediaQuery.of(context).size.height*0.3,width: MediaQuery.of(context).size.width*0.3,
        child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[ Text(answer,style: TextStyle(fontWeight: FontWeight.bold,fontSize:MediaQuery.of(context).size.height*0.08 ),)
        ,SizedBox(height:10)
        ,Text("Source:",style: TextStyle(fontWeight: FontWeight.bold),)
        ,Text("https://www.cambridge-news.co.uk/whats-on/30-plants-gardening-pub-quiz-18268858",style: TextStyle(fontStyle: FontStyle.italic),)
        ]))),
    actions: [ElevatedButton(onPressed:(){ Navigator.pop(context);},
    child: Icon(Icons.close),
    )],
    );}
    );
    }



class _question extends StatelessWidget {
  _question({Key key, this.question,this.size,this.width}):super(key: key);
  final String question;
  final double size;
  final double width;
  @override
  Widget build(BuildContext context) {
    return  Container(padding: EdgeInsets.all(10),width: width*0.9,
      child: Card(elevation: 10,child:
        Container(height: size*0.4,padding: EdgeInsets.all(5),
        child: Center(
          child: Text(question,textAlign:TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold,wordSpacing: 2,fontSize: size*0.04),),
        ))    
      ,),
    );
  }
}


class _answer extends StatelessWidget {
   _answer({Key key, this.answer,this.size,this.width}):super(key: key);
  final String answer;
  final double size;
  final double width;
  @override
  Widget build(BuildContext context) {
    return  Container(padding: EdgeInsets.all(10),width: width*0.9,
     
      child: Card(elevation: 10,child:
        Container(height: size*0.2,padding: EdgeInsets.all(5),
       decoration: BoxDecoration(color: Colors.green),
        child: Center(
          child: Text(answer,textAlign:TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold,wordSpacing: 2,fontSize: size*0.08,color: Colors.white,),
        ))    
      ,)),
    );
  }
}
