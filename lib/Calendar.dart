import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class CalenarThing extends StatefulWidget {
  @override
  _CalenarThingState createState() => _CalenarThingState();
}

class _CalenarThingState extends State<CalenarThing> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    DateTime now = DateTime.now();
    var dateString = DateFormat('dd-MM-yyyy').format(now);
    final String configFileName = 'lastConfig.$dateString.json';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF333A47),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Reserva Calendar',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.green, fontWeight: FontWeight.w500),
              ),
            ),
            CalendarTimeline(
              initialDate:
                  DateTime.now().weekday == 6 || DateTime.now().weekday == 7
                      ? null
                      : DateTime(DateTime.now().year, DateTime.now().month,
                          DateTime.now().day),
              firstDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
              lastDate: DateTime(2100, 1, 1),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              monthColor: Colors.black87,
              dayColor: Colors.orange,
              //dayNameColor: Color(0xFF333A47),
              activeDayColor: Colors.black,
              activeBackgroundDayColor: Colors.redAccent,
              //dotsColor: Color(0xFF333A47),
              dotsColor: Colors.white,
              selectableDayPredicate: (date) =>
                  date.weekday != 6 && date.weekday != 7,
            ),
          ],
        ),
      ),
    );
  }
}
