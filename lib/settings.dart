import 'package:farmtechsoln/recognizenew.dart';
import 'package:flutter/material.dart';
import 'package:farmtechsoln/myhomepage.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _selectedIndex = 2;

    static const List<BottomNavigationBarItem> _navigationBarItems =[
      BottomNavigationBarItem(label:"HOME",icon: Icon(Icons.home)),
      BottomNavigationBarItem(label:"RECOGNIZE",icon: Icon(Icons.camera)),
      BottomNavigationBarItem(label:"SETTINGS",icon: Icon(Icons.settings_applications)),
    ];

  Widget _currentWidget = Settings();

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
    double _screenH = MediaQuery.of(context).size.height;
    double _screenW = MediaQuery.of(context).size.width;
    
    return Scaffold(
      //appBar:
//      AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
//          title: Text("Plantita"),),

      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.green, Colors.greenAccent]
              )
            ),
            child: Container(
              width: double.infinity,
              height: _screenH*0.6,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
//                     Container(width: _screenW,padding: EdgeInsets.all(10),
//                       child: Text("FarmTechSoln",style: TextStyle(color: Colors.white,fontSize:_screenH*0.05,fontWeight: FontWeight.bold),)),
                    CircleAvatar(
                     backgroundImage: AssetImage('assets/launcher/14.png'),
                      radius: _screenH*0.1,),
                    SizedBox(height: _screenH*0.02,),
                    Text("FarmTechSoln",style: TextStyle(fontSize: _screenH*0.05,color: Colors.white,)),
                    SizedBox(height: _screenH*0.01,),
                    Container(height: _screenH*0.15,
                        child: Card(
                          margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                          clipBehavior: Clip.antiAlias,
                          color: Colors.white,
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Email",style: TextStyle(
                                          color: Colors.redAccent,fontSize: _screenH*0.03,fontWeight: FontWeight.bold,),),
                                      SizedBox(height: _screenH*0.01),
                                      Text("pi.apple07@gmail.com",style: TextStyle(fontSize:  _screenH*0.02,color: Colors.green,),)
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Mobile #",style: TextStyle(
                                          color: Colors.redAccent,fontSize: _screenH*0.03,fontWeight: FontWeight.bold,),),
                                      SizedBox(height: _screenH*0.01),
                                      Text("09XXXXXXXX",style: TextStyle(fontSize:  _screenH*0.02,color: Colors.green,),)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            )
          ),
          
          Container(height: _screenH*0.3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        "Message",
                      style: TextStyle(color: Colors.redAccent,fontStyle: FontStyle.normal,
                        fontSize: _screenH*0.03),),
                    SizedBox(height:  _screenH*0.02),
                    Text('Application is still under development.'
                        'You can reach me using above information.\n'
                        '- FarmTechSoln Team ',
                      style: TextStyle(fontSize: _screenH*0.02,fontStyle: FontStyle.italic,fontWeight: FontWeight.w300,
                        color: Colors.black,letterSpacing: 2.0,),),
                  ],
                ),
              ),
            ),
  
  //       SizedBox(height:  _screenH*0.02),
        ],
      ),

      
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

