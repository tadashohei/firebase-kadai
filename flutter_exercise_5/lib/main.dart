import 'package:flutter/material.dart';
import 'package:flutter_exercise_5/list_exercise.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//Create a TextEditingController
  final idEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  Map<String, String> users = {'mugi': '1478', 'mogi': '2359', 'magi': '3727'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'タイトル',
          style: TextStyle(
              color: Color(0xffeeeeee),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                //自分が作った　名前のcontorollerを対応させている
                controller: idEditingController, //名前を引き受ける認識する
                decoration: const InputDecoration(
                    labelText: 'ユーザーID', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                controller: passwordEditingController, //password の認識
                decoration: const InputDecoration(
                    labelText: 'パスワード', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  //入力された値が（名前）入力されたpasswordと合うか
                  if (users[idEditingController.text] ==
                      passwordEditingController.text) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListExercise()),
                    );
                  } else {
                    const AlertDialog(
                      title: Text(
                        '違う違う。そうじゃない♪',
                        textAlign: TextAlign.center,
                      ),
                      content: Text("ろぐいんできませんよ！"),
                      actions: <Widget>[],
                    );
                  }
                },
                child: const Text(
                  'ログイン',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
