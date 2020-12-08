import 'package:flutter/material.dart';

class EventDetailPage extends StatefulWidget {
  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Singapore Food Festival'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 0, right: 0, left: 0),
          child: Center(
              child: Image(
                  image: AssetImage('Assets/images-1.jpeg'), fit: BoxFit.fill)),
        ));
  }
}
