import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(5),
              child: Text("A message has been send to your device."),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width * 0.2, vertical: 50),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: "OTP code",
                ),
              ),
            ),
            InkWell(
              onTap: () async {},
              child: Container(
                // margin: EdgeInsets.only(top:),
                width: width * 0.6,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                  child: Text(
                    'Sign Up',
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
