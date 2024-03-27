import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roomie_app/datas/room.dart';
import 'package:roomie_app/datas/suggestion.dart';
import 'package:uuid/uuid.dart';

class PostSuggestionPart extends StatefulWidget {
  const PostSuggestionPart({super.key});

  @override
  State<PostSuggestionPart> createState() => _PostSuggestionPartState();
}

class _PostSuggestionPartState extends State<PostSuggestionPart> {
  final titleController = TextEditingController();
  final messsageController = TextEditingController();
  bool titleCreated = false;
  String title = '';
  bool messageCreated = false;
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                textAlign: TextAlign.start, // カーソルの位置を左上から開始させる
                maxLength: 100, //最大文字数を決める
                maxLines: null, //文字の折り返しを決める
                keyboardType: TextInputType.multiline, //エンターで改行
                decoration: (titleCreated)
                    ? const InputDecoration(
                        hintText: '見出しを入力してください',
                        border: OutlineInputBorder(),
                      )
                    : InputDecoration(
                        hintText: title,
                        border: const OutlineInputBorder(),
                      ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: messsageController,
                textAlign: TextAlign.start, // カーソルの位置を左上から開始させる
                maxLength: 400, //最大文字数を決める
                maxLines: null, //文字の折り返しを決める
                keyboardType: TextInputType.multiline, //エンターで改行
                decoration: (messageCreated)
                    ? const InputDecoration(
                        hintText: '内容を入力してください',
                        border: OutlineInputBorder(),
                      )
                    : InputDecoration(
                        hintText: message,
                        border: const OutlineInputBorder(),
                      ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  //部屋の投稿
                  _postSuggestion(
                    titleController.text,
                    messsageController.text,
                  );
                  //boolとmessageを変更
                  titleCreated = true;
                  messageCreated = true;
                  title = titleController.text;
                  message = messsageController.text;
                  titleController.clear();
                  messsageController.clear();
                },
                child: const Text('部屋を探す'),
              ),
            ],
          ),
        ),
      ),
    );
  }

//部屋を投稿する
  Future<void> _postSuggestion(String title, String message) async {
    final roomId = const Uuid().v4();

    final currentUserId = FirebaseAuth.instance.currentUser!.uid;

    //roomドキュメントを作成
    Suggestion newSuggestion = Suggestion(
        userId: currentUserId,
        title: title,
        message: message,
        postedAt: Timestamp.now());
    //roomドキュメントをcloudstoreに作成
    await FirebaseFirestore.instance
        .collection('suggestions')
        .doc(roomId)
        .set(newSuggestion.toJson());
  }
}
