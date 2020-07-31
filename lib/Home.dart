import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Icon customIcon = Icon(Icons.search);
  Widget customSearchBar = Text("AppBar");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: customSearchBar,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                if (this.customIcon.icon == Icons.search) {
                  this.customIcon = Icon(Icons.clear);
                  this.customSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: "Search"),
                  );
                } else {
                  this.customIcon = Icon(Icons.search);
                  this.customSearchBar = Text("AppBar");
                }
              });
            },
            icon: customIcon,
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
          // GestureDetector(
          //   onTap: () {},
          //   child: Icon(Icons.search),
          // )
        ],
      ),
    );
  }
}
