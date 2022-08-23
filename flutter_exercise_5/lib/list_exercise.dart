import 'package:flutter/material.dart';
import 'dart:math';

class ListExercise extends StatefulWidget {
  const ListExercise({Key? key}) : super(key: key);

  @override
  _ListExerciseState createState() => _ListExerciseState();


}

class _ListExerciseState extends State<ListExercise> {
  final myController = TextEditingController();

  List<int>? randomNumbers(){
    List<int> numbers = [];
    var rng = Random();
    for(int i=0; i<5; i++){
      numbers.add(rng.nextInt(10));
    }
    if(numbers[0]%2==0){
      return numbers;
    }else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width/2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                //自分が作った　名前のcontorollerを対応させている
                controller: myController,
                decoration: const InputDecoration(labelText: '値を入力してね！', border: OutlineInputBorder()),
              ),

              ElevatedButton(
                onPressed: (){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      content: const Text(
                          ''
                      ),
                      actions: [TextButton(onPressed: ()
                      {Navigator.pop(context);},
                          child: const Text('OK'))],
                    );
                  });
                },
                child: const Text('表示', style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}