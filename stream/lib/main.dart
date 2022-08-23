import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "dart:math" as math;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stream/firebase_options.dart';
import 'package:stream/page1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  deleteData() {
    // int age = math.Random().nextInt(99);
    // FirebaseFirestore.instance
    //     .collection('users')
    //     .add({'name': 'okuma', 'id': 'aaududu', 'age': age});
    //FirebaseFirestore.instance.collection('users').doc('tada1').delete();
  }

  final Stream<QuerySnapshot> userStream = FirebaseFirestore.instance
      .collection('users')
      .orderBy('age')
      .startAt([20]).endAt([90]).snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: userStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DocumentSnapshot> usersdata = snapshot.data!.docs;
              return ListView.separated(
                itemCount: usersdata.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> newMap =
                      usersdata[index].data()! as Map<String, dynamic>;
                  return ListTile(
                    title: Text('${newMap['name']}'),
                    subtitle: Text('${newMap['age']}'),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     deleteData();
      //   },
      //   child: const Icon(Icons.delete_forever_outlined),
      // ),

      floatingActionButton: FloatingActionButton(
        child: Text('次へ'),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return page1(
                // title: 'unknown', text: "twice"
                );
          }));
        },
      ),
    );
  }
}
