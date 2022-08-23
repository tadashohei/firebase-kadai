import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercise 1',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text('タイトル', style: TextStyle(fontSize: 20,
            color: Color(0xff222222),
            fontWeight: FontWeight.bold),),),
        backgroundColor: Colors.teal,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Row(
                children: [
                  Icon(Icons.thumb_up, color: Colors.blue, size: 30,),
                  SizedBox(width: 15,),
                  Icon(Icons.thumb_down, color: Colors.red, size: 30,),
                  SizedBox(width: 30,),
                  Text('タイル１', style: TextStyle(
                    fontSize: 18, color: Color(0xff222222),),)
                ],
              ),
            ),
            Divider(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: Row(
                children: [
                  Icon(Icons.thumb_up, color: Colors.blue, size: 30,),
                  SizedBox(width: 10,),
                  Text('タイル2',
                      style: TextStyle(fontSize: 18, color: Color(0xff222222),))
                ],
              ),
            ),
            Divider(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Row(
                children: [
                  Icon(Icons.thumb_up, color: Colors.blue, size: 30,),
                  SizedBox(width: 10,),
                  Text('タイル３', style: TextStyle(
                    fontSize: 18, color: Color(0xff222222),
                      fontWeight: FontWeight.bold,))
                ],
              ),
            ),
            Divider(height: 20,),
            Container(//タイルの箱に対して働いている
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Row(
                children: [
                  Icon(Icons.thumb_down_alt_sharp, color: Colors.deepPurple, size: 40,),
                  SizedBox(width: 10,),
                  Text('タイル4', style: TextStyle(
                      fontStyle: FontStyle.italic,fontSize: 18, color: Color(0xff222222),))
                ],
              ),
            ),
          ],
        )
    );
  }
}
