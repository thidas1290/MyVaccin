import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../integrity/paginator.dart';
import 'signup.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

Uri url =
    Uri.parse('https://www.hpb.health.gov.lk/api/get-current-statistical');
var data;

final email = TextEditingController();
final password = TextEditingController();

class _LoginState extends State<Login> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    getData();
  }

  dynamic getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      data = response.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool obsecure = true;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: "E mail",
                  ),
                  controller: email,
                ),
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              ),
              Container(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: "password",
                  ),
                  controller: password,
                  obscureText: obsecure,
                ),
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  if (user != null) {
                    print(user!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                user: user,
                                data: data,
                              )),
                    );
                  } else {
                    print('null when sigind out');
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email.text,
                      password: password.text,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                user: user,
                                data: data,
                              )),
                    );
                  }
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
                        'Log In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          wordSpacing: 3,
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
