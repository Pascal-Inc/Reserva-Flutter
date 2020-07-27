import 'package:flutter/material.dart';

class TabBarClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(tabs:
                [
                  Tab(icon: Icon(Icons.calendar_today)),
                  Tab(icon: Icon(Icons.event)),
                  Tab(icon: Icon(Icons.search)),
                  Tab(icon: Icon(Icons.account_circle),)
                ],
              ),
              title: Text('Tabs Demo'),
            ),
            body: TabBarView(
              children: [
                Icon(Icons.calendar_today),
                Icon(Icons.event),
                Icon(Icons.search),
                Icon(Icons.account_circle)
              ],
            ),
          )
      )
    );
  }
}
