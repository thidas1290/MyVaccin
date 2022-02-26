import 'drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/tile.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, @required this.data}) : super(key: key);
  var data;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.2,
              width: double.maxFinite,
              margin: const EdgeInsets.only(right: 10, left: 10, top: 25),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: Colors.red.withOpacity(0.6),
              ),
              child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          textTheme: GoogleFonts.nunitoSansTextTheme(
                              Theme.of(context).textTheme)),
                      child: const Text(
                        'You are not vaccinated yet!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
            ),
            Container(
              height: height * 0.4,
              margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
              decoration: const BoxDecoration(
                // color: Colors.red.withOpacity(0.6),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Tile(
                          title: "New cases",
                          num: 1159,
                        )),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Tile(
                            title: "New Deaths",
                            num: 79,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Tile(
                          title: "Daily PCR Count",
                          num: 7702,
                        )),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Tile(
                          title: "Local Active Cases",
                          num: 46233,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
