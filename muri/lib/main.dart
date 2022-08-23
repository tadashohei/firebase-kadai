import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:muri/firebase_options.dart';
import 'package:muri/page_1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  void addUser() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc('user10')
        .set({"id": "user2", "name": "morita", "age": "7777"});
  }

  void update() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc('user10')
        .set({"id": "abcde", "name": "morita", "age": "88888888"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  addUser();
                },
                child: const Text(
                  'addUser',
                  style: TextStyle(backgroundColor: Colors.indigo),
                )),
            ElevatedButton(
                onPressed: () {
                  update();
                },
                child: const Text(
                  'update',
                  style: TextStyle(backgroundColor: Colors.limeAccent),
                )),
            TextButton(
              child: Text("あっち"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondPage()),
                );
              },
            ),
            // TextButton(
            //   child: Text("こっち"),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => const ThirdPage()),
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
