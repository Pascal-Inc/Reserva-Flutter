import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:reserva_flutter/Settings/Account.dart';
import 'package:reserva_flutter/Settings/Help.dart';
import 'package:reserva_flutter/Settings/Notifications.dart';
import 'package:reserva_flutter/Settings/Privacy.dart';
import 'package:reserva_flutter/Settings/Security.dart';

class DrawerThing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Name Surname"),
            accountEmail: Text("name_surname@domainName.domainSuffix"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
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
                Navigator.pop(context);
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
              onTap: () {
                showAlertDialog(context);
              })
        ],
      ),
    );
  }
}

// alertDialog(BuildContext context) {
//   // This is the ok button
//   Widget ok = FlatButton(
//     child: Text("OK"),
//     onPressed: () {
//       Navigator.of(context).pop();
//     },
//   );
//   // show the alert dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text("Confirmation"),
//         content: Text("Are you sure you want to Log Out?"),
//         actions: [
//           ok,
//         ],
//         elevation: 5,
//       );
//     },
//     /*barrierDismissible: true*/
//   );
// }

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text(
      "Cancel",
      style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
    ),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );
  Widget continueButton = FlatButton(
    child: Text(
      "OK",
      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
    ),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Log Out"),
    content: Text("Do you really want to Log Out"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6), child: alert);
      },
      barrierDismissible: true);
}
