import 'package:flutter/material.dart';
import 'package:list/main.dart';

class Page1 extends StatelessWidget {
   Page1({Key? key}) : super(key: key);
  final List<String> entries = <String>['A', 'B', 'C','kboy',"222"];
  //final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
       // toolbarOpacity: 20,
        title: Text('list 1page'),
        centerTitle: true,),

      body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              //,width: 40,
              height: 40,
             //color: Colors.amber[colorCodes[index]],
              child: Center(
                  // child: Padding(
                  //   padding: const EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.blueAccent,
                      child: Text('unko ${entries[index]}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              ),
                    ),
                  )
              );

          },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.black87,
        ),
      ),
      );


  }
}
