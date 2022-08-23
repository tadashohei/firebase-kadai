import 'package:flutter/material.dart';
//import 'package:untitled1/main.dart';

class FirstPage extends StatelessWidget {
  //const FirstPage({Key? key}) : super(key: key);

  FirstPage (this.name);

  final String name;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text ('1page'),
        centerTitle: true,
        ) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start ,
          children: [
            SizedBox(height: 10,),

            Text(name,
              style: TextStyle(
              height: 10,
              fontWeight: FontWeight.bold),),
            ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },

        child: const Text('previous page'),
            ),
            SizedBox(height: 30,),
            Icon(
              Icons.star_border_purple500_rounded,
              color: Colors.greenAccent,
              size: 50,
            )
          ],
        ),
      ),
      );
  }
}
