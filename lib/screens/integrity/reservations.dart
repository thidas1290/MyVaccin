import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../register.dart';

class Reservation extends StatefulWidget {
  Reservation({Key? key}) : super(key: key);

  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormSubmission()),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 45,
              ),
              height: 50,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text("Register for Vaccination"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
