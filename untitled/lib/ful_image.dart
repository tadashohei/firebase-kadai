import 'package:flutter/material.dart';
import 'package:untitled/widget.dart';

//問１： FullImageを作成。
class FullImage extends StatefulWidget {
  const FullImage({Key? key, required this.imageUrl, required this.name}) : super(key: key);
  final String imageUrl;
  final String name;

  @override
  _FullImageState createState() => _FullImageState();
}


class _FullImageState extends State <FullImage>{

  //変数宣言！　
bool _isTapped = false;

  @override
  Widget build ( BuildContext context){
    return Scaffold(
      appBar:  AppBar(title: Text('full-image',style:titleStyle(),),centerTitle: true ,backgroundColor: Colors.lightGreen,),
      body: Container(
          color: Colors.yellowAccent,
          child: GestureDetector(
      onTap: () {
    setState(() {
    // Toggle light when tapped.
    _isTapped = !_isTapped;
    });
    },
          child: Image.network(
            widget.imageUrl,
            width: _isTapped?150:MediaQuery.of(context).size.width,)
         )
        )
    );

  }
}
