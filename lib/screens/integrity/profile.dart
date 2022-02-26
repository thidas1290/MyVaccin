import 'package:covid_custom/screens/integrity/more_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

String name = "";

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    void _MoreInfo() {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return MoreInfo();
          });
    }

    double width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "SCAN QR",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            QrImage(
              data: "Tetfyu",
              size: 270,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Hello " + FirebaseAuth.instance.currentUser!.displayName!,
                style: const TextStyle(
                  fontSize: 26,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _MoreInfo();
              },
              child: Container(
                // margin: EdgeInsets.only(top:),
                width: width * 0.3,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                  child: Text(
                    'Report',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      wordSpacing: 3,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
