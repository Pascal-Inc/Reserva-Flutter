import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reserva_flutter/About%20Us.dart';
import 'package:reserva_flutter/Tabs.dart';

void main() => runApp(new MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.redAccent, accentColor: Colors.yellowAccent),
      debugShowCheckedModeBanner: false,
      home: Tutorial(),
    ));

class Tutorial extends StatefulWidget {
  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 20),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => AboutUs() //TabBarClass()
                )));
    // AboutUs()))); //print("Splash Done"));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.lightBlueAccent),
          ),
          Column(
            children: <Widget>[
              RaisedButton(child: Text("Rock & Roll"),
                onPressed: navigation.push,
                color: Colors.red,
                textColor: Colors.yellow,
                padding: EdgeInsets.fromWindowPadding(10, 10),
                splashColor: Colors.grey,
              )
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: FlutterLogo(size: 50.0),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text(
                        "Reserva",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text("Event Scheduling - Improved",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
