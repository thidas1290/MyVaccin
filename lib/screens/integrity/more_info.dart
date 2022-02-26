import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_custom/screens/authentication/login.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

const kRadius = BorderRadius.all(Radius.circular(5));

class MoreInfo extends StatefulWidget {
  MoreInfo({Key? key}) : super(key: key);

  @override
  _MoreInfoState createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  bool? state = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    users.doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
      print(value.data());
      // state = value.data()["isVaccinated"];
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.6;

    return Container(
        height: height * 0.72,
        // width: double,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Text(
                  'Name : ' + FirebaseAuth.instance.currentUser!.displayName!),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text('Vaccinated : ' + state.toString()),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              borderRadius: kRadius,
              child: Container(
                width: height * 0.55,
                height: 50,
                // ignore: prefer_const_constructors
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: kRadius,
                ),
                child: const Center(
                  child: Text(
                    'Close',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ));
  }
}
