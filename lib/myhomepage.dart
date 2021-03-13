import 'package:farmtechsoln/aboutpage.dart';
import 'package:farmtechsoln/disease_collection.dart';
import 'package:farmtechsoln/featuredPlant.dart';
import 'package:farmtechsoln/grid_plant.dart';
import 'package:farmtechsoln/recognizenew.dart';
import 'package:farmtechsoln/settings.dart';
import 'package:farmtechsoln/tools/plantClass.dart';
import 'package:farmtechsoln/trivia_collection.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<BottomNavigationBarItem> _navigationBarItems =[
    BottomNavigationBarItem(label:"HOME",icon: Icon(Icons.home)),
    BottomNavigationBarItem(label:"DETECT",icon: Icon(Icons.camera)),
    BottomNavigationBarItem(label:"SETTINGS",icon: Icon(Icons.settings_applications)),
  ];

Widget _currentWidget = MyHomePage();

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
    switch (index) {
      case 0:
        _currentWidget = MyHomePage();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
        break;
      case 1:
        _currentWidget = Recognizenew();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Recognizenew()));
        
        break;
      case 2:
        _currentWidget = Settings();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Settings()));
        
      break;
    }
  });
}


 @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    
    //get the screen height and width
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height; 

    //get PlantClass to be used in the Featured Plant Section

    final List<PlantClass> featuredplant = PlantClass.getPlantClass();
    return Scaffold(
      appBar: 
      AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("FarmTechSoln"),
        actions: [ TextButton(child:Icon(Icons.info,color: Colors.white,),
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> About()));
            },),
                 ],
      ),
      body: Container(
        color: Colors.green[100],
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //SizedBox(height:screenH*0.02),
    /*          Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(padding:EdgeInsets.all(1),width:screenW,height: screenH*0.08,
                   decoration: BoxDecoration(color:Colors.white,borderRadius:BorderRadiusDirectional.circular(screenH*0.04)),
  
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[
                      Container(
                        child: Text("Hello There!",style: TextStyle(fontSize: screenH*0.04),)),
                      CircleAvatar(radius: screenH*0.03,backgroundImage: AssetImage('assets/images/design2.png'),)
                     ],)
                      ,], )),
              ),
*/
         Container(padding:EdgeInsets.fromLTRB(10, 0, 10, 3),height:MediaQuery.of(context).size.height*0.3,
          child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(child:Text("FEATURED PLANTS", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: screenH*0.03),)),
              SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _featuredPlant(
                          image: featuredplant[2].image,
                          title: featuredplant[2].title,
                          route: FeaturedPlant(name:featuredplant[2].title,description:featuredplant[2].description,image:featuredplant[2].image ,),
                        ),
                        _featuredPlant(
                          image: featuredplant[1].image,
                          title: featuredplant[1].title,
                          route: FeaturedPlant(name:featuredplant[1].title,description:featuredplant[1].description,image:featuredplant[1].image ,),
                        ),

                        _featuredPlant(
                          image: featuredplant[0].image,
                          title: featuredplant[0].title,
                          route: FeaturedPlant(name:featuredplant[0].title,description:featuredplant[0].description,image:featuredplant[0].image ,),
                        ),
                      ],
                    ),
                  ),
            ],
          )             
          ),
         Container(
          height: screenH*0.4,color: Colors.white,
           child:Column( mainAxisAlignment: MainAxisAlignment.center,
           children:[ 
            Container(child:Text("TOOLS", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: screenH*0.03),)),
            SizedBox(height:5,),
            Container(height: screenH*0.35,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[_features(image:Icon(Icons.book,size: 40,),title: "Plant Collection",width: screenW*0.4,height: screenH*0.02,pageroute: GridPlant(),)
                   ,_features(image:Icon(Icons.note,size: 40),title: "Plant Diseases",width: screenW*0.4,height: screenH*0.02,pageroute: DiseaseCollection(),)
           ]),
            SizedBox(height:5),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[_features(image:Icon(Icons.lightbulb,size: 40),title: "Plant Trivias",width: screenW*0.4,height: screenH*0.02,pageroute: TriviaCollection(),)
             ,_features(image:Icon(Icons.camera,size: 40),title: "Detect Disease",width: screenW*0.4,height: screenH*0.02,pageroute: Recognizenew()),
           ]
                )

                ],
              ),
            ),   
          ]       ))
           ])                            
      ))  
      ,
    bottomNavigationBar: BottomNavigationBar(elevation: 5,
      backgroundColor:Colors.green[50] ,
      items: _navigationBarItems,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    )
    
    );
   
  }
}


class _featuredPlant extends StatelessWidget {
  _featuredPlant({Key key,this.title,this.image,this.route}):super(key:key);
  final String title;
  final String image;
  Widget route;

  @override
  Widget build(BuildContext context) {

    double _sizeH=MediaQuery.of(context).size.height;
    double _sizeW=MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: ()
  {Navigator.push(context, MaterialPageRoute(builder: (context)=>route));}
      ,child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      //height: _sizeH*0.5,
      padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(1),
              width: _sizeW * 0.3,
              height: _sizeH*0.18,
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/'+image),
                ),
              ),),
             Container(color: Colors.white,
             width: _sizeW * 0.3,
//              height: _sizeH*0.1,
                child: Text(title.toUpperCase()),alignment: Alignment.center,),
          ],
        ),
      ),
    );
  }
}

class _features extends StatelessWidget {
  _features({Key key,this.image,this.title,this.pageroute,this.width,this.height}):super(key: key);
  Icon image;
  final String title;
  Widget pageroute;
 double width;
 double height;

  @override
  Widget build(BuildContext context) {
    return Container(height:MediaQuery.of(context).size.height*.15,
    width:MediaQuery.of(context).size.width*.4,
      child: ElevatedButton(
        onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>pageroute));
         } ,
        child: Container( 
          //color: Colors.green,
       //   width: width,
          padding:EdgeInsets.all(3),
         // child: TextButton.icon(icon:image,label: Text(title,style: TextStyle(fontSize:height*0.95),),
         // onPressed:() {
         //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>pageroute));
         // },),  
  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
        image,
        Text(title)
  ],),
        ),
      ),
    );
  }
}