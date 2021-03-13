import 'package:flutter/material.dart';
import 'package:farmtechsoln/trivia_details.dart';
import 'package:farmtechsoln/tools/triviaClass.dart';


class TriviaBox extends StatelessWidget {
TriviaBox({Key key,this.item}):super(key: key);
final TriviaClass item;
  @override
  Widget build(BuildContext context) {
    double _sizeW=MediaQuery.of(context).size.width;
    double _sizeH=MediaQuery.of(context).size.height;
        return Container(width: _sizeW*0.6,
          height: _sizeH*0.15,
          child: Card(child: Center(
            child: ListTile(
              leading:CircleAvatar(
                //backgroundImage: AssetImage("assets/images/"+item.image),radius: _sizeH*0.06,),
              child: Icon(Icons.question_answer_sharp))
              ,title:Text(item.question,),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>TriviaDetails(item:item)) );
              },
              ),
          ),
          ),
    );
  }
}
