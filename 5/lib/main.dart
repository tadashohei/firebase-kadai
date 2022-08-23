import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children :<Widget> [
            TextFormField(
              decoration:InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter the number',
               // icon: Icon(Icons.dangerous_outlined),
              ),
            ),
            SizedBox(width: 30,),
            TextFormField(
              autofocus: true,
              decoration:  InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter the numbers!?'
                    '',
              ),
            ),

          ],

        ),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(

    );
    }
}

