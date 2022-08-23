
import 'package:flutter/material.dart';
import 'package:flutter_exercise_2/widget.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('page1', style: titleStyle(),),),
      body: Container(),
    );
  }
}