// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //getimformationはほしい情報先のゴール
  //future ゴールで builder以下で　必要に応じた処理をかく。

  Future<DocumentSnapshot> getimformation =
      FirebaseFirestore.instance.collection('users').doc('user10').get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          '2page',
          softWrap: true,
        )),
        body: FutureBuilder<DocumentSnapshot>(
            future: getimformation,
            builder: ((context, snapshot) {
              if (snapshot.hasData && snapshot.data!.exists) {
                //新しくマップを作っているという事？？
                Map<String, dynamic> newMap = snapshot.data!.data()
                    as Map<String, dynamic>; //新しいマップとして保存！
                return Center(
                  child: Text('name:${newMap['name']} age: ${newMap['age']}'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })));
  }
}
