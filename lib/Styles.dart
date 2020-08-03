import 'package:flutter/material.dart';
import 'package:reserva_flutter/Home.dart';
import 'package:reserva_flutter/Settings/Account.dart';
import 'package:reserva_flutter/Settings/Help.dart';
import 'package:reserva_flutter/Settings/Notifications.dart';
import 'package:reserva_flutter/Settings/Privacy.dart';
import 'package:reserva_flutter/Settings/Security.dart';
import 'package:reserva_flutter/Tabs.dart';

class DrawerThing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: //ListView()
                // Icon(Icons.account_circle),
                Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabBarClass()),
                );
              }),
          ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Account'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountClass()),
                );
              }),
          ListTile(
              leading: Icon(Icons.enhanced_encryption),
              title: Text('Privacy'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyClass()),
                );
              }),
          ListTile(
              leading: Icon(Icons.security),
              title: Text('Security'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecurityClass()),
                );
              }),
          ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsClass()),
                );
              }),
          ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpClass()),
                );
              }),
          ListTile(
              title: Text("Log Out", style: TextStyle(color: Colors.red)),
              onTap: () {})
        ],
      ),
    );
  }
}
