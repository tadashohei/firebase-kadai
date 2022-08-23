import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class page1 extends StatefulWidget {
  //const page1({super.key});

  @override
  State<page1> createState() => _page1State();

  //  const page1({required this.title, //this.text });
  //  final String title;
  // // final String text;
}

class _page1State extends State<page1> {
  void handleSignup() async {
    //usreregister に登録している。

    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: "tada@gmail.com",
      password: "aaaaaa",
    );

    User user = userCredential.user!;
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .set({'id': user.uid, 'email': user.email});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "oraoraora",
          style: const TextStyle(decorationColor: Colors.greenAccent),
        ),
      ),
      body: (Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            // autofocus: true,
            child: const Text(
              "please register",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black12,
              ),
            ),
            onPressed: () {
              handleSignup();
            },
          )
        ]),
      )),
    );
  }
}
