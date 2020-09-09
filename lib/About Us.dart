import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("About Our Company")),
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Pascal Inc.",
                  style: TextStyle(
                      color: Colors.black, fontStyle: FontStyle.normal)),
              SizedBox(height: 20, width: 20),
              Text(
                  " Lorem Ipson, Lorem Ipson, Lorem Ipson, Lorem Ipson, Lorem Ipson, Lorem Ipson,",
                  overflow: TextOverflow.clip)
            ],
          )
        ])); //granwyn is secretly a girl
  }
}
