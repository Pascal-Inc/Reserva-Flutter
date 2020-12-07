import 'package:flutter/material.dart';
import 'package:reserva_flutter/Event%20Details.dart';
import 'package:reserva_flutter/Styles.dart';
import 'package:english_words/english_words.dart' as english_words;
import 'package:reserva_flutter/Tabs/Stuff.dart';

class AppBarSearchExample extends StatefulWidget {
  const AppBarSearchExample({Key key}) : super(key: key);

  @override
  _AppBarSearchExampleState createState() => _AppBarSearchExampleState();
}

class _AppBarSearchExampleState extends State<AppBarSearchExample> {
  final List<String> kEnglishWords;
  _MySearchDelegate _delegate;

  _AppBarSearchExampleState()
      : kEnglishWords = List.from(Set.from(english_words.all))
          ..sort(
            (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase()),
          ),
        super();

  @override
  void initState() {
    super.initState();
    _delegate = _MySearchDelegate(kEnglishWords);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('English Words'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () async {
              final String selected = await showSearch<String>(
                context: context,
                delegate: _delegate,
              );
              if (selected != null) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You have selected the word: $selected'),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: kEnglishWords.length,
          itemBuilder: (context, idx) => ListTile(
            title: Text(kEnglishWords[idx]),
          ),
        ),
      ),
    );
  }
}

class _MySearchDelegate extends SearchDelegate<String> {
  final List<String> _words;
  final List<String> _history;

  _MySearchDelegate(List<String> words)
      : _words = words,
        _history = <String>[] /*['apple', 'hello', 'world', 'flutter']*/,
        super();

  // Leading icon in search bar.
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // SearchDelegate.close() can return vlaues, similar to Navigator.pop().
        this.close(context, null);
      },
    );
  }

  // Widget of result page.
  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('You have selected the word:'),
            GestureDetector(
              onTap: () {
                // Returns this.query as result to previous screen, c.f.
                // `showSearch()` above.
                this.close(context, this.query);
              },
              child: Text(
                this.query,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Suggestions list while typing (this.query).
  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : _words.where((word) => word.startsWith(query));

    return _SuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion) {
        this.query = suggestion;
        this._history.insert(0, suggestion);
        showResults(context);
      },
    );
  }

  // Action buttons at the right of search bar.
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isEmpty
          ? IconButton(
              tooltip: 'Voice Search',
              icon: const Icon(Icons.mic),
              onPressed: () {
                this.query = '';
              },
            )
          : IconButton(
              tooltip: 'Clear',
              icon: const Icon(Icons.clear),
              onPressed: () {
                query = '';
                showSuggestions(context);
              },
            )
    ];
  }
}

class _SuggestionList extends StatelessWidget {
  const _SuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subtitle1;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? Icon(Icons.history) : Icon(null),
          // Highlight the substring that matched the query.
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: textTheme,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}

class TabBarClass extends StatefulWidget {
  const TabBarClass({Key key}) : super(key: key);
  @override
  _TabBarClassState createState() => _TabBarClassState();
}

class _TabBarClassState extends State<TabBarClass> {
  final List<String> kEnglishWords;
  Icon customIcon = Icon(Icons.search);
  Widget customSearchBar = Text("Reserva");

  _MySearchDelegate _delegate;

  _TabBarClassState()
      : kEnglishWords = List.from(Set.from(english_words.all))
          ..sort(
            (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase()),
          ),
        super();

  @override
  void initState() {
    super.initState();
    _delegate = _MySearchDelegate(kEnglishWords);
  }

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
                  //       IconButton(
                  // tooltip: 'Search',
                  // icon: const Icon(Icons.search),
                  // onPressed: () async {
                  //   final String selected = await showSearch<String>(
                  //     context: context,
                  //     delegate: _delegate,
                  //   );
                  //   if (selected != null) {
                  //     Scaffold.of(context).showSnackBar(
                  //       SnackBar(
                  //         content: Text('You have selected the word: $selected'),
                  //       ),
                  //     );
                  //   }
                  // },
                  IconButton(
                      tooltip: 'Search',
                      icon: customIcon,
                      onPressed: () async {
                        final String selected = await showSearch<String>(
                          context: context,
                          delegate: _delegate,
                        );
                        if (selected != null) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('You have selected the word: $selected'),
                            ),
                          );
                        }
                        // setState(() {
                        //   if (this.customIcon.icon == Icons.search) {
                        //     // showSearch(context: context, delegate: Search());
                        //     this.customIcon = Icon(Icons.clear);
                        //     this.customSearchBar = TextField(
                        //       textInputAction: TextInputAction.go,
                        //       style:
                        //           TextStyle(color: Colors.white, fontSize: 18),
                        //       decoration: InputDecoration(
                        //           border: InputBorder.none,
                        //           hintStyle: TextStyle(color: Colors.white),
                        //           hintText: "Search"),
                        //     );
                        //   } else {
                        //     this.customIcon = Icon(Icons.search);
                        //     this.customSearchBar = Text("Reserva");
                        //   }
                        // });
                      })
                ],
              ),
              drawer: DrawerThing(),
              body: TabBarView(children: [
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
                TodosScreen(
                    todos: List.generate(
                  1000,
                  (i) => Todo(
                    'Event ${i + 1}',
                    'Description of Event ${i + 1}',
                  ),
                )),
                // ListView(
                //   children: <Widget>[
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Singapore Food Festival'),
                //         subtitle: Text('Food\n11/7/20 - 20/7/20 (Annually)'),
                //         trailing: Text('4.6'),
                //         /*
                //                                 Row(
                //                                   crossAxisAlignment: CrossAxisAlignment.center,
                //                                   children: <Widget>[
                //                                     Icon(
                //                                       Icons.star,
                //                                       color: Colors.yellow[600],
                //                                     ),
                //                                     Text('3.9')
                //                                   ],
                //                                 ),
                //                                 */
                //         isThreeLine: true,
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => EventDetailPage()));
                //         },
                //       ),
                //     ),
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Grand Prix Singapore'),
                //         subtitle: Text('Races\n10/7/20 - 26/7/20 (Annually)'),
                //         // trailing: Icon(Icons.more_vert),
                //         trailing: Text('3.9'),
                //         /*
                //                                 Row(
                //                                   crossAxisAlignment: CrossAxisAlignment.center,
                //                                   children: <Widget>[
                //                                     Icon(
                //                                       Icons.star,
                //                                       color: Colors.yellow[600],
                //                                     ),
                //                                     Text('3.9')
                //                                   ],
                //                                 ),
                //                                 */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Singapore Art Week'),
                //         subtitle: Text(
                //             'Charity and Causes\n15/9/20 - 22/9/20 (Biannually)'),
                //         // trailing: Icon(Icons.more_vert),
                //         trailing: Text('4.2'),
                //         /*

                //                                 Row(
                //                                   crossAxisAlignment: CrossAxisAlignment.center,
                //                                   children: <Widget>[
                //                                     Icon(
                //                                       Icons.star,
                //                                       color: Colors.yellow[600],
                //                                     ),
                //                                     Text('3.9')
                //                                   ],
                //                                 ),
                //                                 */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Masks Sewn With Love'),
                //         subtitle: Text(
                //             'Charity and Causes\nDuring COVID-19 (Weekly)'),
                //         // trailing: Icon(Icons.more_vert),
                //         trailing: Text('5.0'),
                //         /*
                //                                 Row(
                //                                   crossAxisAlignment: CrossAxisAlignment.center,
                //                                   children: <Widget>[
                //                                     Icon(
                //                                       Icons.star,
                //                                       color: Colors.yellow[600],
                //                                     ),
                //                                     Text('3.9')
                //                                   ],
                //                                 ),
                //                                 */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //     // ),
                //     /*
                //                             Card(child: ListTile(title: Text('One-line ListTile'))),
                //                             Card(
                //                               child: ListTile(
                //                                 leading: FlutterLogo(),
                //                                 title: Text('One-line with leading widget'),
                //                               ),
                //                             ),
                //                             Card(
                //                               child: ListTile(
                //                                 title: Text('One-line with trailing widget'),
                //                                 trailing: Icon(Icons.more_vert),
                //                               ),
                //                             ),
                //                             Card(
                //                               child: ListTile(
                //                                 leading: FlutterLogo(),
                //                                 title: Text('One-line with both widgets'),
                //                                 trailing: Icon(Icons.more_vert),
                //                               ),
                //                             ),
                //                             Card(
                //                               child: ListTile(
                //                                 title: Text('One-line dense ListTile'),
                //                                 dense: true,
                //                               ),
                //                             ),
                //                             Card(
                //                               child: ListTile(
                //                                 leading: FlutterLogo(size: 56.0),
                //                                 title: Text('Two-line ListTile'),
                //                                 subtitle: Text('Here is a second line'),
                //                                 trailing: Icon(Icons.more_vert),
                //                               ),
                //                             ),
                //                             Card(
                //                               child: ListTile(
                //                                 leading: FlutterLogo(size: 72.0),
                //                                 title: Text('Three-line ListTile'),
                //                                 subtitle: Text(
                //                                     'A sufficiently long subtitle warrants three lines.'),
                //                                 trailing: Icon(Icons.more_vert),
                //                                 isThreeLine: true,
                //                               ),
                //                             ),*/
                //   ],
                // ),
                Scrollbar(
                  child: ListView.builder(
                    itemCount: kEnglishWords.length,
                    itemBuilder: (context, idx) => ListTile(
                      title: Text(kEnglishWords[idx]),
                    ),
                  ),
                ),
                //   ListView(children: <Widget>[
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Lorem Ipsum'),
                //         subtitle: Text('Category\nTime Period (Frequency)'),
                //         trailing: Text('0.0'),
                //         /*
                //                                   Row(
                //                                     crossAxisAlignment: CrossAxisAlignment.center,
                //                                     children: <Widget>[
                //                                       Icon(
                //                                         Icons.star,
                //                                         color: Colors.yellow[600],
                //                                       ),
                //                                       Text('3.9')
                //                                     ],
                //                                   ),
                //                                   */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Lorem Ipsum'),
                //         subtitle: Text('Category\nTime Period (Frequency)'),
                //         trailing: Text('0.0'),
                //         /*
                //                                   Row(
                //                                     crossAxisAlignment: CrossAxisAlignment.center,
                //                                     children: <Widget>[
                //                                       Icon(
                //                                         Icons.star,
                //                                         color: Colors.yellow[600],
                //                                       ),
                //                                       Text('3.9')
                //                                     ],
                //                                   ),
                //                                   */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Lorem Ipsum'),
                //         subtitle: Text('Category\nTime Period (Frequency)'),
                //         trailing: Text('0.0'),
                //         /*
                //                                   Row(
                //                                     crossAxisAlignment: CrossAxisAlignment.center,
                //                                     children: <Widget>[
                //                                       Icon(
                //                                         Icons.star,
                //                                         color: Colors.yellow[600],
                //                                       ),
                //                                       Text('3.9')
                //                                     ],
                //                                   ),
                //                                   */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Lorem Ipsum'),
                //         subtitle: Text('Category\nTime Period (Frequency)'),
                //         trailing: Text('0.0'),
                //         /*
                //                                   Row(
                //                                     crossAxisAlignment: CrossAxisAlignment.center,
                //                                     children: <Widget>[
                //                                       Icon(
                //                                         Icons.star,
                //                                         color: Colors.yellow[600],
                //                                       ),
                //                                       Text('3.9')
                //                                     ],
                //                                   ),
                //                                   */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Lorem Ipsum'),
                //         subtitle: Text('Category\nTime Period (Frequency)'),
                //         trailing: Text('0.0'),
                //         /*
                //                                   Row(
                //                                     crossAxisAlignment: CrossAxisAlignment.center,
                //                                     children: <Widget>[
                //                                       Icon(
                //                                         Icons.star,
                //                                         color: Colors.yellow[600],
                //                                       ),
                //                                       Text('3.9')
                //                                     ],
                //                                   ),
                //                                   */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Lorem Ipsum'),
                //         subtitle: Text('Category\nTime Period (Frequency)'),
                //         trailing: Text('0.0'),
                //         /*
                //                                   Row(
                //                                     crossAxisAlignment: CrossAxisAlignment.center,
                //                                     children: <Widget>[
                //                                       Icon(
                //                                         Icons.star,
                //                                         color: Colors.yellow[600],
                //                                       ),
                //                                       Text('3.9')
                //                                     ],
                //                                   ),
                //                                   */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Lorem Ipsum'),
                //         subtitle: Text('Category\nTime Period (Frequency)'),
                //         trailing: Text('0.0'),
                //         /*
                //                                   Row(
                //                                     crossAxisAlignment: CrossAxisAlignment.center,
                //                                     children: <Widget>[
                //                                       Icon(
                //                                         Icons.star,
                //                                         color: Colors.yellow[600],
                //                                       ),
                //                                       Text('3.9')
                //                                     ],
                //                                   ),
                //                                   */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Lorem Ipsum'),
                //         subtitle: Text('Category\nTime Period (Frequency)'),
                //         trailing: Text('0.0'),
                //         /*
                //                                   Row(
                //                                     crossAxisAlignment: CrossAxisAlignment.center,
                //                                     children: <Widget>[
                //                                       Icon(
                //                                         Icons.star,
                //                                         color: Colors.yellow[600],
                //                                       ),
                //                                       Text('3.9')
                //                                     ],
                //                                   ),
                //                                   */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Lorem Ipsum'),
                //         subtitle: Text('Category\nTime Period (Frequency)'),
                //         trailing: Text('0.0'),
                //         /*
                //                                   Row(
                //                                     crossAxisAlignment: CrossAxisAlignment.center,
                //                                     children: <Widget>[
                //                                       Icon(
                //                                         Icons.star,
                //                                         color: Colors.yellow[600],
                //                                       ),
                //                                       Text('3.9')
                //                                     ],
                //                                   ),
                //                                   */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Lorem Ipsum'),
                //         subtitle: Text('Category\nTime Period (Frequency)'),
                //         trailing: Text('0.0'),
                //         /*
                //                                   Row(
                //                                     crossAxisAlignment: CrossAxisAlignment.center,
                //                                     children: <Widget>[
                //                                       Icon(
                //                                         Icons.star,
                //                                         color: Colors.yellow[600],
                //                                       ),
                //                                       Text('3.9')
                //                                     ],
                //                                   ),
                //                                   */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Lorem Ipsum'),
                //         subtitle: Text('Category\nTime Period (Frequency)'),
                //         trailing: Text('0.0'),
                //         /*
                //                                   Row(
                //                                     crossAxisAlignment: CrossAxisAlignment.center,
                //                                     children: <Widget>[
                //                                       Icon(
                //                                         Icons.star,
                //                                         color: Colors.yellow[600],
                //                                       ),
                //                                       Text('3.9')
                //                                     ],
                //                                   ),
                //                                   */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Lorem Ipsum'),
                //         subtitle: Text('Category\nTime Period (Frequency)'),
                //         trailing: Text('0.0'),
                //         /*
                //                                   Row(
                //                                     crossAxisAlignment: CrossAxisAlignment.center,
                //                                     children: <Widget>[
                //                                       Icon(
                //                                         Icons.star,
                //                                         color: Colors.yellow[600],
                //                                       ),
                //                                       Text('3.9')
                //                                     ],
                //                                   ),
                //                                   */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Lorem Ipsum'),
                //         subtitle: Text('Category\nTime Period (Frequency)'),
                //         trailing: Text('0.0'),
                //         /*
                //                                   Row(
                //                                     crossAxisAlignment: CrossAxisAlignment.center,
                //                                     children: <Widget>[
                //                                       Icon(
                //                                         Icons.star,
                //                                         color: Colors.yellow[600],
                //                                       ),
                //                                       Text('3.9')
                //                                     ],
                //                                   ),
                //                                   */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Lorem Ipsum'),
                //         subtitle: Text('Category\nTime Period (Frequency)'),
                //         trailing: Text('0.0'),
                //         /*
                //                                   Row(
                //                                     crossAxisAlignment: CrossAxisAlignment.center,
                //                                     children: <Widget>[
                //                                       Icon(
                //                                         Icons.star,
                //                                         color: Colors.yellow[600],
                //                                       ),
                //                                       Text('3.9')
                //                                     ],
                //                                   ),
                //                                   */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //     Card(
                //       child: ListTile(
                //         leading: FlutterLogo(size: 72.0),
                //         title: Text('Lorem Ipsum'),
                //         subtitle: Text('Category\nTime Period (Frequency)'),
                //         trailing: Text('0.0'),
                //         /*
                //                                   Row(
                //                                     crossAxisAlignment: CrossAxisAlignment.center,
                //                                     children: <Widget>[
                //                                       Icon(
                //                                         Icons.star,
                //                                         color: Colors.yellow[600],
                //                                       ),
                //                                       Text('3.9')
                //                                     ],
                //                                   ),
                //                                   */
                //         isThreeLine: true,
                //         onTap: () {},
                //       ),
                //     ),
                //   ])
                //   // Text("All Events"),
                //   // Text("Search"),
                //   // Text("Settings")
                //   /*
                //                           Icon(Icons.calendar_today),
                //                           Icon(Icons.event),
                //                           Icon(Icons.search),
                //                           Icon(Icons.account_circle)
                //                           */
                // ],
              ]),
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
