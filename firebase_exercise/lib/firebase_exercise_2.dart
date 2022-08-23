import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key, required String userId}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  TextEditingController postEditingController = TextEditingController();

  String text = '';

  void addPost() async {
    text = postEditingController.text;

    await FirebaseFirestore.instance.collection('posts').add({
      //追加できるようにする
      'text': text,
      'date': DateTime.now().toString(),
    });

    postEditingController.clear(); //投稿した瞬間に入力欄が消える処理
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          //問２
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('posts')
                  .orderBy('date')
                  .limit(15)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //リストを新しく作って保存する
                  List<DocumentSnapshot> postsData = snapshot.data!.docs;

                  // ListViewは大きさの指定が無いので、Columnなどに入れると、無限に広がってしまいエラーとなる。
                  // このようにExpandedで囲い、自動で大きさを合わせるか、SizedBoxやContainerなどで囲い、大きさを指定するかしなければいけない。
                  return Expanded(
                    child: ListView.builder(
                        itemCount: postsData.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> postData =
                              postsData[index].data() as Map<String, dynamic>;
                          ;
                          return postCard(postData);
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
                      //iconbuttonでonpressedしている
                      onPressed: () {
                        addPost();
                      },
                      icon: const Icon(Icons.send)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget postCard(Map<String, dynamic> postData) {
    return Card(
      child: ListTile(
        title: Text(postData['text']),
        subtitle: Text(postData['date']),
        selectedColor: Colors.greenAccent,
      ),
    );
  }
}
