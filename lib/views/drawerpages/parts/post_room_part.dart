import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roomie_app/datas/room.dart';
import 'package:uuid/uuid.dart';

class PostRoomPart extends StatefulWidget {
  const PostRoomPart({super.key});

  @override
  State<PostRoomPart> createState() => _PostRoomPartState();
}

class _PostRoomPartState extends State<PostRoomPart> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  @override
  void dispose() {
    titleController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: const Color.fromARGB(255, 231, 177, 240),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(hintText: 'タイトルを入力してください'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: locationController,
                decoration: const InputDecoration(hintText: '場所をしてください'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  //TODO 部屋の投稿
                  await _postRoom(
                    titleController.text,
                    locationController.text,
                  );
                  titleController.clear();
                  locationController.clear();
                },
                child: const Text('部屋投稿'),
              ),
            ],
          ),
        ),
      ),
    );
  }

//ログイン中のユーザーIDを取得
  Future<String> getCurrentUserId() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      return currentUser.uid;
    } else {
      print('userはログインしていません');
      throw Exception('User not logged in');
    }
  }

//部屋を投稿する
  Future<void> _postRoom(String title, String location) async {
    final roomId = const Uuid().v4();

    final currentUserId = FirebaseAuth.instance.currentUser!.uid;

    //roomドキュメントを作成
    Room newRoom = Room(
      postedAt: Timestamp.now(),
      latestMessageCreatedAt: Timestamp.now(),
      roomId: roomId,
      userId: currentUserId,
      location: location,
      rent: '7万円',
      timing: '2024年7月~',
      type: title,
      layout: '3LDK',
      depoist: '7万円',
    );
    //roomドキュメントをcloudstoreに作成
    await FirebaseFirestore.instance
        .collection('rooms')
        .doc(roomId)
        .set(newRoom.toJson());
  }
}
