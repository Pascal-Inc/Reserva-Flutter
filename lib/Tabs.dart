import 'package:flutter/material.dart';
import 'package:reserva_flutter/Styles.dart';

class TabBarClass extends StatefulWidget {
  @override
  _TabBarClassState createState() => _TabBarClassState();
}

class _TabBarClassState extends State<TabBarClass> {
  Icon customIcon = Icon(Icons.search);
  Widget customSearchBar = Text("Reserva");

  List<String> randomSnackBarWords = [''];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green, fontFamily: "Futura"),
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.event), text: "Upcoming"),
                    Tab(icon: Icon(Icons.calendar_today), text: "All"),
                    // Tab(icon: Icon(Icons.search)),
                    // Tab(icon: Icon(Icons.account_circle), text: "Account")
                  ],
                ),
                title: customSearchBar,
                actions: <Widget>[
                  IconButton(
                      icon: customIcon,
                      onPressed: () {
                        setState(() {
                          if (this.customIcon.icon == Icons.search) {
                            // showSearch(context: context, delegate: Search());
                            this.customIcon = Icon(Icons.clear);
                            this.customSearchBar = TextField(
                              textInputAction: TextInputAction.go,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: "Search"),
                            );
                          } else {
                            this.customIcon = Icon(Icons.search);
                            this.customSearchBar = Text("Reserva");
                          }
                        });
                      })
                ],
              ),
              drawer: DrawerThing(),
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
                          subtitle: Text('Food\n11/7/20 - 20/7/20 (Annually)'),
                          trailing: Text('4.6'),
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
                          onTap: () {},
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: FlutterLogo(size: 72.0),
                          title: Text('Grand Prix Singapore'),
                          subtitle: Text('Races\n10/7/20 - 26/7/20 (Annually)'),
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
                          onTap: () {},
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: FlutterLogo(size: 72.0),
                          title: Text('Singapore Art Week'),
                          subtitle: Text(
                              'Charity and Causes\n15/9/20 - 22/9/20 (Biannually)'),
                          // trailing: Icon(Icons.more_vert),
                          trailing: Text('4.2'),
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
                          onTap: () {},
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: FlutterLogo(size: 72.0),
                          title: Text('Masks Sewn With Love'),
                          subtitle: Text(
                              'Charity and Causes\nDuring COVID-19 (Weekly)'),
                          // trailing: Icon(Icons.more_vert),
                          trailing: Text('5.0'),
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
                          onTap: () {},
                        ),
                      ),
                      // ),
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
                  ListView(children: <Widget>[
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('Lorem Ipsum'),
                        subtitle: Text('Category\nTime Period (Frequency)'),
                        trailing: Text('0.0'),
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
                        onTap: () {},
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('Lorem Ipsum'),
                        subtitle: Text('Category\nTime Period (Frequency)'),
                        trailing: Text('0.0'),
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
                        onTap: () {},
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('Lorem Ipsum'),
                        subtitle: Text('Category\nTime Period (Frequency)'),
                        trailing: Text('0.0'),
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
                        onTap: () {},
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('Lorem Ipsum'),
                        subtitle: Text('Category\nTime Period (Frequency)'),
                        trailing: Text('0.0'),
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
                        onTap: () {},
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('Lorem Ipsum'),
                        subtitle: Text('Category\nTime Period (Frequency)'),
                        trailing: Text('0.0'),
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
                        onTap: () {},
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('Lorem Ipsum'),
                        subtitle: Text('Category\nTime Period (Frequency)'),
                        trailing: Text('0.0'),
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
                        onTap: () {},
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('Lorem Ipsum'),
                        subtitle: Text('Category\nTime Period (Frequency)'),
                        trailing: Text('0.0'),
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
                        onTap: () {},
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('Lorem Ipsum'),
                        subtitle: Text('Category\nTime Period (Frequency)'),
                        trailing: Text('0.0'),
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
                        onTap: () {},
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('Lorem Ipsum'),
                        subtitle: Text('Category\nTime Period (Frequency)'),
                        trailing: Text('0.0'),
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
                        onTap: () {},
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('Lorem Ipsum'),
                        subtitle: Text('Category\nTime Period (Frequency)'),
                        trailing: Text('0.0'),
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
                        onTap: () {},
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('Lorem Ipsum'),
                        subtitle: Text('Category\nTime Period (Frequency)'),
                        trailing: Text('0.0'),
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
                        onTap: () {},
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('Lorem Ipsum'),
                        subtitle: Text('Category\nTime Period (Frequency)'),
                        trailing: Text('0.0'),
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
                        onTap: () {},
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('Lorem Ipsum'),
                        subtitle: Text('Category\nTime Period (Frequency)'),
                        trailing: Text('0.0'),
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
                        onTap: () {},
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('Lorem Ipsum'),
                        subtitle: Text('Category\nTime Period (Frequency)'),
                        trailing: Text('0.0'),
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
                        onTap: () {},
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('Lorem Ipsum'),
                        subtitle: Text('Category\nTime Period (Frequency)'),
                        trailing: Text('0.0'),
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
                        onTap: () {},
                      ),
                    ),
                  ])
                  // Text("All Events"),
                  // Text("Search"),
                  // Text("Settings")
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

/*
class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    throw UnimplementedError();
  }
}
*/

/*
Swift Code for reference:
Event(eventImage: "placeholder_image", eventName: "Singapore Food Festival", rating: 4.6, userLiked: true, eventDescription: "Fuelled by our national obsession, the Singapore Food Festival boasts tasty dishes, cooking tips and unique dining experiences", eventStartDate: "10/7/20", eventEndDate: "26/7/20", eventCategory: "Food", eventFrequency: "Annually"),
Event(eventImage: "placeholder_image", eventName: "Grand Prix Singapore", rating: 3.9, userLiked: false, eventDescription: "A motor race which forms part of the FIA Formula One World Championship", eventStartDate: "11/7/20", eventEndDate: "20/7/20", eventCategory: "Races", eventCost: "$38", eventCostTimeLengthInDays: 1, eventFrequency: "Annually"),
Event(eventImage: "placeholder_image", eventName: "Singapore Art Week", rating: 4.2, userLiked: false, eventDescription: "15/9/20", eventStartDate: "22/9/20", eventEndDate: "22/9/20", eventCategory: "Art", eventFrequency: "Biannually"),
Event(eventImage: "placeholder_image", eventName: "Masks Sewn With Love", rating: 5.0, userLiked: true, eventDescription: "A community project to sew reusable cloth masks", eventCategory: "Charity and Causes", eventFrequency: "Weekly")
*/
