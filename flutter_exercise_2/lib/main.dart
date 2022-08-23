import 'package:flutter/material.dart';
import 'package:flutter_exercise_2/page1.dart';
import 'package:flutter_exercise_2/page2.dart';
import 'package:flutter_exercise_2/widget.dart';

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
      appBar: AppBar(centerTitle: true, title: Text('タイトル', style: titleStyle(),),),
      body: Container(

        //問１ alignmentはWidgetの場所を指定する。
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 40,),
            ElevatedButton(
              onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return Page1();})),
              child: Text('page1',),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(20)),

                //問６ shapeプロパティはボタンの形を設定する。circular()の中の数字を大きくすると丸みが増す。
                //shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
              ),
            ),
            SizedBox(height: 20,),

            //問３ Page1のボタンと同様。
            ElevatedButton(
              onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return Page2();})),
              child: Text('page2',),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
              ),
            ),
          ],
        ),
      ),
    );
  }
}