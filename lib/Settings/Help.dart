import 'package:flutter/material.dart';
import 'package:reserva_flutter/Styles.dart';

class HelpClass extends StatefulWidget {
  @override
  _HelpClassState createState() => _HelpClassState();
}

class _HelpClassState extends State<HelpClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      drawer: DrawerThing(),
      body: Text('Placeholder Text'),
    );
  }
}
