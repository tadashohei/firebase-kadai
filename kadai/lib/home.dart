import 'package:flutter/material.dart';
import 'package:kadai/chat.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const ChatUi(userId: 'user1');
              },
            ));
          },
          child: const Text('次へ'),
        ),
        Text('$userIdがログインしています'),
      ],
    );
  }
}
