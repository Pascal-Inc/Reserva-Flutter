import 'package:flutter/material.dart';
import 'package:reserva_flutter/Styles.dart';

class PrivacyClass extends StatefulWidget {
  @override
  _PrivacyClassState createState() => _PrivacyClassState();
}

class _PrivacyClassState extends State<PrivacyClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy'),
      ),
      drawer: DrawerThing(),
      body: Text('Placeholder Text'),
    );
  }
}
