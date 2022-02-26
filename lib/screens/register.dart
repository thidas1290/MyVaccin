import 'package:flutter/material.dart';

class FormSubmission extends StatefulWidget {
  FormSubmission({Key? key}) : super(key: key);

  @override
  _FormSubmissionState createState() => _FormSubmissionState();
}

final name = TextEditingController();
final NIC = TextEditingController();
final people = TextEditingController();
final password_2 = TextEditingController();
final number = TextEditingController();

List<String> items = ["AstraZenneca", "Moderna", "Pfizer", "Sputnik"];

String? initialVal = items[0];

class _FormSubmissionState extends State<FormSubmission> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 150,
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
                    labelText: "NIC",
                  ),
                  controller: NIC,
                ),
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              ),
              Container(
                child: TextField(
                  controller: people,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "No. of People",
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                child: DropdownButton<String>(
                  value: initialVal,
                  onChanged: (String? item) {
                    setState(() {
                      initialVal = item!;
                    });
                  },
                  items: items.map((String item) {
                    return (DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ));
                  }).toList(),
                ),
              ),
              Container(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: " Additional Mobile Number",
                  ),
                  controller: number,
                ),
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
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
                      'Register',
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
