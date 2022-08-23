import 'package:flutter/material.dart';
import 'package:list/pag_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const MyHomePage({Key? key, required this.title}) : super(key: key);

   final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:Container(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),

            ),
            SizedBox(height: 40,),//空白
            SizedBox( //ボタンの大きさsixedboxで変える
              width: 30, height: 30,
              child: ElevatedButton(
              // Within the `FirstRoute` widget
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Page1()),
                );
              },
                child: Text("1page"),
                style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                  enableFeedback: true,
                ),
              ),
            ),
          ],
        ),
      )  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
