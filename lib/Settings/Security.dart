import 'package:flutter/material.dart';
import 'package:reserva_flutter/Styles.dart';

class SecurityClass extends StatefulWidget {
  @override
  _SecurityClassState createState() => _SecurityClassState();
}

class _SecurityClassState extends State<SecurityClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security'),
      ),
      drawer: DrawerThing(),
      body: Text('Placeholder Text'),
    );
  }
}
