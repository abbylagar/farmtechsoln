class DiseaseClass{
  final String title;
  final String description;
  final String image;
  final List<Trivia> trivia;
  DiseaseClass({this.title,this.description,this.image,this.trivia});

  static List<DiseaseClass> getDiseaseClass(){
    List<DiseaseClass> items = <DiseaseClass>[];

    items.add(DiseaseClass(title: "bell pepper",
    description: "Bell peppers, Capsicum annuum are a cultivar group of annual or perennial plants in the family Solanaceae grown for their edible fruits. Bell pepper plants are short bushes with woody stems that grow brightly colored fruits. "
    "The alternating leaves are elliptical, smooth edged, and come to a distinct point. The plant produces white or purple bell-shaped flowers which are 2.5 cm (1 in) in diameter. Red, yellow, purple, or brown fruit are produced"
    "each season about 3-6 weeks after flowering. Pepper plants can grow 1 m (3.3 ft) tall and are usually grown as annuals in temperate regions for only one growing season. Bell pepper may be referred to as red pepper, yellow pepper or green pepper "
    "and is believed to have originated in Central and South America."
    ,image: "tomato.jpg",
    trivia:Trivia.getTrivia()) );
    
    items.add(DiseaseClass(title:"potato",
    description:"Potato, Solanum tuberosum, is an herbaceous perennial plant in the family Solanaceae which is grown for its edible tubers. The potato plant has a branched stem and alternately arranged leaves consisting of leaflets which are both of unequal size and shape."
    " The leaflets can be oval to oblong in shape and the leaves can reach 10–30 cm (4–12 in) in length and 5–15 cm (2–6 in) wide. The potato plant produces white or blue flowers and yellow-green berries. The potato tubers grow underground and generally located in the top 25 cm (10 in) of the soil. "
    "The tubers can range in color from yellow to red or purple depending on the variety. Potato plants can reach in excess of 1 m (3.3 ft) in height and are grown as annual plants, surviving only one growing season. Potato may also be referred to as, spud, Irish potato, "
    "white potato or Spanish potato and originates from South America. "
     ,image: "tomato.jpg"
     ));

    items.add(DiseaseClass(title:"Tomato",
    description:"Tomato, Lycopersicum esculentum (syn. Solanum lycopersicum and Lycopersicon lycopersicum) is an herbaceous annual in the family Solanaceae grown for its edible fruit. The plant can be erect with short stems or vine-like with long, spreading stems. The stems are covered"
    "in coarse hairs and the leaves are arranged spirally. The tomato plant produces yellow flowers, which can develop into a cyme of 3–12, and usually a round fruit (berry) which is fleshy, smoothed skinned and can be red, pink, purple, brown, orange or yellow in color. The tomato plant can grow 0.7–2 m (2.3–6.6 ft) in height "
    "and as an annual, is harvested after only one growing season. Tomato may also be referred to as love apple and originates from South America."
    ,image: "tomato.jpg"
    ));
  
  return items;
  }
}

class Trivia{
 Trivia({this.question,this.answer});
final String question;
final String answer;

static List<Trivia> getTrivia(){
  List<Trivia> trivias= <Trivia>[];

  trivias.add(Trivia(question:"The love appl is the original name for what?",answer: "Tomato"));

  trivias.add(Trivia(question:"What is the art of cutting shrubs into ornametal shapes called",answer: "Topiary"));

  trivias.add(Trivia(question:"What vitamin is most prevalent in a lime?",answer: "Vitamin C"));

  trivias.add(Trivia(question:"Soil can be acidic ,alkaline or what?",answer: "Nuetral"));

  return trivias;
}
}