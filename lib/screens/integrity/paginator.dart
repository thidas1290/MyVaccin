import 'package:flutter/material.dart';
import 'map.dart';
import 'drawer.dart';
import 'home.dart';
import 'profile.dart';
import 'reservations.dart';
import 'package:http/http.dart' as http;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Uri url =
    Uri.parse('https://www.hpb.health.gov.lk/api/get-current-statistical');

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
    @required this.user,
    @required this.data,
  }) : super(key: key);

  final User? user;
  var data;

  @override
  _HomePageState createState() => _HomePageState();
}

var newData;

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    newData = widget.data;
    print(newData);
  }

  List<Widget> screens = [
    MainPage(data: newData),
    const MapView(),
    Reservation(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(user: widget.user),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.red, size: 30),
        elevation: 0,
        title: const Text(
          'My Vaccin',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(
                Icons.notifications,
                color: Colors.red,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (int num) {
          setState(() {
            currentIndex = num;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calender',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
