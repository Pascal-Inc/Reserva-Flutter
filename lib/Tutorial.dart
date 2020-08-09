import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reserva_flutter/Tabs.dart';

void main() => runApp(new MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.redAccent, accentColor: Colors.yellowAccent),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    TabBarClass()))); //print("Splash Done"));
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
