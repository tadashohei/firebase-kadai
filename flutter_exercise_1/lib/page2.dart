import 'package:flutter/material.dart';
import 'package:flutter_exercise_1/widget.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(centerTitle: true, title: Text('page2', style: titleStyle(),),),
      body: Container(
        alignment: Alignment.center,
        color: Colors.red,
        child: Column(
          children: [
          SizedBox(height: 20,),
        ElevatedButton(
          onPressed: () {Navigator.pop(context);},
          child: Text('top',),
          style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.all(20)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
          ),
    ),
    ],
    ),
    )
    );
  }
  }

