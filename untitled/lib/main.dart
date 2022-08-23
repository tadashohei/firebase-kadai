import 'package:flutter/material.dart';
import 'package:untitled/widget.dart';
import 'package:untitled/ful_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercise 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _imageUrls = [
    'https://images.unsplash.com/photo-1522926193341-e9ffd686c60f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2670&q=80',
    'https://images.unsplash.com/photo-1452570053594-1b985d6ea890?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2787&q=80',
    'https://images.unsplash.com/photo-1480044965905-02098d419e96?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
    'https://images.unsplash.com/photo-1551085254-e96b210db58a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2780&q=80',
    'https://images.unsplash.com/photo-1552728089-57bdde30beb3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2650&q=80',
    'https://images.unsplash.com/photo-1555169062-013468b47731?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=774&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('タイトル', style: titleStyle(),),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
          scrollDirection: Axis.horizontal,
          itemCount: _imageUrls.length,
          itemBuilder: (context, index) {
            return imageTile(_imageUrls[index]);
          },
          separatorBuilder: (context, index) =>
          const SizedBox(height: 10, width: 10,),
        )
    );
  }

  Widget imageTile(String imageUrl) {
    return GestureDetector(
      onTap: () {//page遷移で値を渡すことを考える
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FullImage(imageUrl: imageUrl, name: "kboy")),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: Image.network(
              imageUrl, scale: 20, width: 120, height: 120, fit: BoxFit.cover,),
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0x44000000),
                borderRadius: BorderRadius.circular(90)
            ),
            height: 120,
            width: 120,
          )
        ],
      ),
    );
  }
}