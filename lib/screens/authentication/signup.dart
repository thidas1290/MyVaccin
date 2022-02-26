import 'package:flutter/material.dart';
import '../integrity/paginator.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'new_user.dart';

import 'package:http/http.dart' as http;

CollectionReference users = FirebaseFirestore.instance.collection('users');

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

Uri url =
    Uri.parse('https://www.hpb.health.gov.lk/api/get-current-statistical');
var data;

final name = TextEditingController();
final email = TextEditingController();
final password_1 = TextEditingController();
final password_2 = TextEditingController();
final number = TextEditingController();

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
    data = getData();
  }

  dynamic getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      data = response.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Name",
                  ),
                  controller: name,
                ),
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "E mail",
                  ),
                  controller: email,
                ),
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              ),
              Container(
                child: TextField(
                  controller: password_1,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "password",
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Re-Enter password",
                  ),
                  controller: password_2,
                  obscureText: true,
                ),
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                  ),
                  controller: number,
                ),
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an Account "),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                        email: email.text,
                        password: password_1.text,
                      )
                      .then((value) => print(value));

                  await FirebaseAuth.instance.currentUser!
                      .updateDisplayName(name.text);
                  await users.doc(FirebaseAuth.instance.currentUser!.uid).set({
                    "isVacinated": false,
                    "cordinates": "",
                    "vertified": false,
                  });

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                data: data,
                                user: FirebaseAuth.instance.currentUser,
                              )));
                },
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
      ),
    );
  }
}
