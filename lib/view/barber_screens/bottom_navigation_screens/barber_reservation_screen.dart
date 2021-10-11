import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:work/shared/constants.dart';

class BarberReservationScreen extends StatelessWidget {
  const BarberReservationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightGreenColor,
        title: Text('الحجوزات',),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            TableCalendar(
                initialSelectedDay: DateTime(2010,1,1),
                startDay:  DateTime(1998,1,1),
                endDay:  DateTime(2030,1,1),
              headerVisible:  false,
            )
          ],
        ),
      ),
    );
  }
}
