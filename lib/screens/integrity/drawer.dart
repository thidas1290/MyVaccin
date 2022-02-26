import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

Map<String, String> add = {
  "isVacinated": "false",
  "cordinates": "",
  "vertified": "false",
};

class SideBar extends StatelessWidget {
  const SideBar({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            // accountName: Text('data'),
            accountName: Text(FirebaseAuth.instance.currentUser!.displayName!),
            accountEmail: Text(user!.email!.toString()),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.ctfassets.net/hrltx12pl8hq/8MpEm5OxWXiNqLvWzCYpW/24f02cfe391aa8f25845de858982d449/shutterstock_749707636__1__copy.jpg?fit=fill&w=840&h=350'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            onTap: () async {
              print(user!.email!);
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            leading: const Icon(Icons.logout),
            title: const Text("Log Out"),
          ),
          // ListTile(
          //   onTap: () async {
          //     print(FirebaseAuth.instance.currentUser!);
          //     // await users.add(add);
          //     // await FirebaseAuth.instance.currentUser!.();
          //     await users.doc(FirebaseAuth.instance.currentUser!.uid).update(
          //       {
          //         "isVacinated": true,
          //         "cordinates": "",
          //         "vertified": false,
          //       },
          //     );
          //     // SetOptions(merge: true)
          //   },
          //   leading: const Icon(Icons.ac_unit),
          //   title: Text("Setup"),
          // )
        ],
      ),
    );
  }
}
