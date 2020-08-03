import 'package:flutter/material.dart';
import 'package:reserva_flutter/Styles.dart';

class AccountClass extends StatefulWidget {
  @override
  _AccountClassState createState() => _AccountClassState();
}

class _AccountClassState extends State<AccountClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      drawer: DrawerThing(),
      body: Text('Placeholder Text'),
    );
  }
}
