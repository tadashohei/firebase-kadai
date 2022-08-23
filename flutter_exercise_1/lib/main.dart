import 'package:flutter/material.dart';
import 'package:flutter_exercise_1/page1.dart';
import 'package:flutter_exercise_1/page2.dart';
import 'package:flutter_exercise_1/widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercise 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('page2', style: titleStyle(),),),
        //(centerTitle: true, title: Text('タイトル', style: titleStyle(),),),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 200,),
            ElevatedButton(
              onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return Page1();})),
              child: Text('page1',),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)))
              ),
            ),
          SizedBox(height: 40,width: 40,child: Text('オタマジャクシ'),),
          TextButton(
              onPressed:  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page2()),
                );
              },
              child: Text('ページ２へ',),
          )

          ],
        ),
      ),
    );
  }
}