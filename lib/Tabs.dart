import 'package:flutter/material.dart';

class TabBarClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.calendar_today)),
                    Tab(icon: Icon(Icons.event)),
                    Tab(icon: Icon(Icons.search)),
                    Tab(
                      icon: Icon(Icons.account_circle),
                    )
                  ],
                ),
                title: Text('Reserva'),
              ),
              body: TabBarView(
                children: [
                  /*
                  DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Category',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Rating',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: const <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Singapore Food Festival')),
                          DataCell(Text('10/7/20-26/7/20')),
                          DataCell(Text('Food')),
                          DataCell(Text("4.6"))
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Grand Prix Singapore')),
                          DataCell(Text('11/7/20-20/7/20')),
                          DataCell(Text('Races, \$38')),
                          DataCell(Text("3.9"))
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Singapore Art Week')),
                          DataCell(Text('15/9/20-22/9/20')),
                          DataCell(Text('Charity and Causes')),
                          DataCell(Text("4.2"))
                        ],
                      ),
                    ],
                  ),*/
                  ListView(
                    children: <Widget>[
                      Card(
                        child: ListTile(
                          leading: FlutterLogo(size: 72.0),
                          title: Text('Singapore Food Festival'),
                          subtitle: Text('Food\n10/7/20 - 26/7/20'),
                          // trailing: Icon(Icons.more_vert),
                          trailing: Text('3.9'),
                          /*
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.yellow[600],
                              ),
                              Text('3.9')
                            ],
                          ),
                          */
                          isThreeLine: true,
                        ),
                      ),
                      /*
                      Card(child: ListTile(title: Text('One-line ListTile'))),
                      Card(
                        child: ListTile(
                          leading: FlutterLogo(),
                          title: Text('One-line with leading widget'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('One-line with trailing widget'),
                          trailing: Icon(Icons.more_vert),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: FlutterLogo(),
                          title: Text('One-line with both widgets'),
                          trailing: Icon(Icons.more_vert),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('One-line dense ListTile'),
                          dense: true,
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: FlutterLogo(size: 56.0),
                          title: Text('Two-line ListTile'),
                          subtitle: Text('Here is a second line'),
                          trailing: Icon(Icons.more_vert),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: FlutterLogo(size: 72.0),
                          title: Text('Three-line ListTile'),
                          subtitle: Text(
                              'A sufficiently long subtitle warrants three lines.'),
                          trailing: Icon(Icons.more_vert),
                          isThreeLine: true,
                        ),
                      ),*/
                    ],
                  ),
                  Text("All Events"),
                  Text("Search"),
                  Text("Settings")
                  /*
                  Icon(Icons.calendar_today),
                  Icon(Icons.event),
                  Icon(Icons.search),
                  Icon(Icons.account_circle)
                  */
                ],
              ),
            )));
  }
}
