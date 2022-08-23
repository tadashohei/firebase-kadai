import 'package:flutter/material.dart' show AppBar, BuildContext, Colors, Column, Container, InputDecoration, Key, MaterialApp, OutlineInputBorder, Scaffold, SizedBox, State, StatefulWidget, StatelessWidget, Text, TextField, ThemeData, Widget, runApp;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercise 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("aaaa"),
      ),
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        TextField(
          autofocus: true,
        decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter a search term',
      ),
    ),
         SizedBox(
           height: 30,
         ),
         TextField(
              autofocus: true,
           decoration: InputDecoration(
             border: OutlineInputBorder(),
             hintText: 'Enter a search term',
           ),
         ),
          ],
        ),
      ),
    );
  }


    }
