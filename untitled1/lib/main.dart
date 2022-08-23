import 'package:flutter/material.dart';
import 'package:untitled1/page_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 //final String nameText = "";
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
  //final String nameText = "";

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
  //同じクラス内に変数設定をしてあげる
   String nameText = "";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
              Padding(
               padding: EdgeInsets.all(20.0),
               child: TextField(
                 onChanged: (name) {
                   nameText =name;
                   //print(name);
                                   },
                obscureText:false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '名前を入れてね！',

                ),
            ),
             ),
          ElevatedButton(
              onPressed: (){
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  FirstPage(nameText),
                //1stpageはnameを渡さないと作れない！！
                fullscreenDialog: true,
                ),
              );},//onPressed
            //ボタンの色を変えてあげる
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),

              child: Text('次のページへ'),),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
