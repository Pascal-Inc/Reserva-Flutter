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
        body: Center(child: Image(image: AssetImage("images-1.jpeg"))));
  }
}
