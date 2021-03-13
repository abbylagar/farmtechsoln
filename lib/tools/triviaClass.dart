
class TriviaClass{
 TriviaClass({this.question,this.answer});
final String question;
final String answer;

static List<TriviaClass> getTriviaClass(){
  List<TriviaClass> trivias= <TriviaClass>[];

  trivias.add(TriviaClass(question:"The love apple is the original name for what?",answer: "Tomato"));

  trivias.add(TriviaClass(question:"What is the art of cutting shrubs into ornametal shapes called",answer: "Topiary"));

  trivias.add(TriviaClass(question:"What vitamin is most prevalent in a lime?",answer: "Vitamin C"));

  trivias.add(TriviaClass(question:"Soil can be acidic ,alkaline or what?",answer: "Nuetral"));

  return trivias;
}
}