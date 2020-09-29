import 'package:flutter/material.dart';
import 'package:reserva_flutter/Settings/Help.dart';
import 'package:reserva_flutter/Settings/Notifications.dart';
import 'package:reserva_flutter/Settings/Privacy.dart';
import 'package:reserva_flutter/Settings/Security.dart';
import 'package:reserva_flutter/Tabs.dart';
import 'package:url_launcher/url_launcher.dart';

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Name Surname"),
              accountEmail: Text("name_surname@domainName.domainSuffix"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "N",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            /*
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
          */
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
                  Navigator.pop(context);
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
                    MaterialPageRoute(
                        builder: (context) => NotificationsClass()),
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
      ),
      body: RaisedButton(
        child: Text('Home'),
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => TabBarClass()),
          // );
          _launchURL();
        },
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://sstinc.org';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
