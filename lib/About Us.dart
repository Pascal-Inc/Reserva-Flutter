import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "About Us",
          style: TextStyle(color: Colors.black, fontStyle: FontStyle.normal),
        ),
        RaisedButton(onPressed: () {})
      ],
    );
  }
}
