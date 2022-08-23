import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class ChatUi extends StatefulWidget {
  // const ChatUi({super.key, required String userId});
  const ChatUi({Key? key, required this.userId}) : super(key: key);
  final String userId; //値を受け取りました

  @override
  State<ChatUi> createState() => _ChatUiState();
}

class _ChatUiState extends State<ChatUi> {
  TextEditingController postEditingController = TextEditingController();
  bool ismyState = false;
  final FirebaseAuth auth = FirebaseAuth.instance;

  //String id = firebase.auth().currentUser;
  //やってほしい関数がここにきている

  void addPost() async {
    // final User? user = auth.currentUser;
    // final uid2= user?.uid;
    final uid = widget.userId;

    await FirebaseFirestore.instance.collection('chat').add({
      'text': postEditingController.text,
      'date': DateTime.now().toString(),
      'id': uid,
      // ignore: avoid_print
    });
    postEditingController.clear(); //入力したときに消えるやつ
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('チャットしましょう',
              style: TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.pinkAccent)),
        ),
        body: Center(
            child: Column(children: [
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('chat')
                  .orderBy('date')
                  .snapshots(), //日付順で並べた10のドキュメント
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DocumentSnapshot> chatsData =
                      snapshot.data!.docs; //nullチェックをして読み込んだデータをリストに保存
                  return Expanded(
                    child: ListView.builder(
                        itemCount: chatsData.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> chatData =
                              chatsData[index].data() as Map<String,
                                  dynamic>; //データをMap<String, dynamic>型に変換
                          return postCard(chatData);
                        }),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: Row(
              children: [
                Flexible(
                    child: TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 5,
                  controller: postEditingController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                )),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: IconButton(
                      onPressed: () {
                        addPost();
                        setState(() {
                          //ismyState = !ismyState;

                          //tileColor = Colors.greenAccent;
                        });
                      },
                      icon: const Icon(Icons.send)),
                )
              ],
            ),
          )
        ])));
  }

  Widget postCard(Map<String, dynamic> chatData) {
    return Card(
      color:
          (chatData['id'] == widget.userId ? Colors.tealAccent : Colors.white),
      child: ListTile(
        //tileColor:tileColor, //( ismyState ? Colors.greenAccent : Colors.white),
        leading: const Icon(Icons.people),
        title: Text(chatData['text']),
        subtitle: Text(chatData['id']),
        // selectedColor: Colors.greenAccent,
      ),
    );
  }
}

//ismaystate を更新するタイミングは　　chatData['id'] == user.uid　この時