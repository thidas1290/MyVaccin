import 'package:flutter/material.dart';
import 'constants.dart';
import './screens/authentication/login.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Vaccin",
      theme: ThemeData.light().copyWith(
        // primaryColor: kPrimaryColor,
        backgroundColor: Colors.red,
      ),
      home: Login(),
    );
  }
}
