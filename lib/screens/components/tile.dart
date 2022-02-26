import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  const Tile({Key? key, this.title, this.num}) : super(key: key);
  final String? title;
  final int? num;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.8),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        width: 100,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                title!,
                style: const TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              num.toString(),
              style: const TextStyle(
                fontSize: 45,
              ),
            )
          ],
        ));
  }
}
