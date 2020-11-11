import 'package:flutter/material.dart';
import 'package:reserva_flutter/About%20Us.dart';
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
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       UserAccountsDrawerHeader(
      //         accountName: Text("Name Surname"),
      //         accountEmail: Text("name_surname@domainName.domainSuffix"),
      //         currentAccountPicture: CircleAvatar(
      //           backgroundColor:
      //               Theme.of(context).platform == TargetPlatform.iOS
      //                   ? Colors.blue
      //                   : Colors.white,
      //           child: Text(
      //             "N",
      //             style: TextStyle(fontSize: 40.0),
      //           ),
      //         ),
      //       ),
      //       /*
      //     DrawerHeader(
      //       decoration: BoxDecoration(
      //         color: Colors.green,
      //       ),
      //       child: //ListView()
      //           // Icon(Icons.account_circle),
      //           Text(
      //         'Settings',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 24,
      //         ),
      //       ),
      //     ),
      //     */
      //       ListTile(
      //           leading: Icon(Icons.home),
      //           title: Text('Home'),
      //           onTap: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => TabBarClass()),
      //             );
      //           }),
      //       ListTile(
      //           leading: Icon(Icons.account_circle),
      //           title: Text('Account'),
      //           onTap: () {
      //             Navigator.pop(context);
      //           }),
      //       ListTile(
      //           leading: Icon(Icons.enhanced_encryption),
      //           title: Text('Privacy'),
      //           onTap: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => PrivacyClass()),
      //             );
      //           }),
      //       ListTile(
      //           leading: Icon(Icons.security),
      //           title: Text('Security'),
      //           onTap: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => SecurityClass()),
      //             );
      //           }),
      //       ListTile(
      //           leading: Icon(Icons.notifications),
      //           title: Text('Notifications'),
      //           onTap: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => NotificationsClass()),
      //             );
      //           }),
      //       ListTile(
      //           leading: Icon(Icons.help),
      //           title: Text('Help'),
      //           onTap: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => AboutUs()),
      //             );
      //           }),
      //       ListTile(
      //           title: Text("Log Out", style: TextStyle(color: Colors.red)),
      //           onTap: () {})
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Icon(
                Icons.face,
                color: Colors.black,
                size: 80.0,
              ),
            ),
            Divider(
              height: 90.0,
              color: Colors.grey[800],
            ),
            Text('NAME',
                style: TextStyle(color: Colors.grey[850], letterSpacing: 2.0)),
            SizedBox(
              height: 10.0,
            ),
            Text('Lorem Ipsum',
                style: TextStyle(
                    color: Colors.green,
                    letterSpacing: 2.0,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30.0,
            ),
            Text('CURRENT NINJA LEVEL',
                style: TextStyle(color: Colors.grey[850], letterSpacing: 2.0)),
            SizedBox(
              height: 10.0,
            ),
            Text('10',
                style: TextStyle(
                    color: Colors.amberAccent[200],
                    letterSpacing: 2.0,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'lorem_ipsum@s2019.ssts.edu.sg',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15.0,
                      letterSpacing: 1.0),
                )
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: RaisedButton(
                onPressed: () {},
                child: Text('Email'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
