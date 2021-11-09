import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:work/shared/constants.dart';

class BarberReservationScreen extends StatefulWidget {
  const BarberReservationScreen({Key key}) : super(key: key);

  @override
  State<BarberReservationScreen> createState() => _BarberReservationScreenState();
}

class _BarberReservationScreenState extends State<BarberReservationScreen> {

  CalendarController _calenderController;
  @override
  void initState() {
    _calenderController = CalendarController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final calenderController = CalendarController();
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
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TableCalendar(
                  calendarStyle:
                  CalendarStyle(
                      highlightToday: true,
                      selectedColor: kPrimaryColor,
                      todayColor: kLightGreenColor
                  ),
                  initialCalendarFormat: CalendarFormat.week,
                  startDay: DateTime.utc(2010, 10, 16),
                  endDay: DateTime.utc(2030, 3, 14),
                  onDaySelected: (value, lis, list) {
                    setState(() {
                      var dateTime =
                          "${value.year}-${value.month}-${value.day}";
                    });
                  },
                  calendarController:_calenderController ,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
