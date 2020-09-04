import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Row(
          children: [
            Text(
              "About Us",
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal
                
              ),
            ),
            RaisedButton(onPressed: () {})
          ],
        ),
      ),
    );
  }
}
