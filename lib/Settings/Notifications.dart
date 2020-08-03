import 'package:flutter/material.dart';
import 'package:reserva_flutter/Styles.dart';

class NotificationsClass extends StatefulWidget {
  @override
  _NotificationsClassState createState() => _NotificationsClassState();
}

class _NotificationsClassState extends State<NotificationsClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      drawer: DrawerThing(),
      body: Text('Placeholder Text'),
    );
  }
}
