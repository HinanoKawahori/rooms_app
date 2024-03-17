import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchPart extends StatefulWidget {
  const SearchPart({Key? key}) : super(key: key);

  @override
  _SearchPartState createState() => _SearchPartState();
}

class _SearchPartState extends State<SearchPart> {
  TextEditingController locationTextController = TextEditingController();

  @override
  void dispose() {
    locationTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 30),
        //検索テキストフィールド
        Expanded(
          child: TextField(
            controller: locationTextController,
            decoration:
                const InputDecoration(hintText: 'Where are you looking?'),
          ),
        ),
        //検索ボタン
        IconButton(
          onPressed: () {
            searchLocation();
          },
          icon: const Icon(Icons.search_outlined),
        ),
        //マップボタン
        IconButton(
          onPressed: () {
            searchLocation();
          },
          icon: const Icon(Icons.map),
        ),
        const SizedBox(width: 30),
      ],
    );
  }

  Future<void> searchLocation() async {
    //whereに大阪が入っているroomドキュメントを取得する
    String searchQuery = locationTextController.text;
    // Do something with the search query
    FirebaseFirestore.instance
        .collection('rooms')
        .where('location' == searchQuery);
  }
}
