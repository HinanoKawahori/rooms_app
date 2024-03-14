import 'package:flutter/material.dart';

class SearchPart extends StatelessWidget {
  const SearchPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 30),
        //検索テキストフィールド
        const Expanded(
          child: TextField(
            decoration: InputDecoration(hintText: 'Where are you looking?'),
          ),
        ),
        //検索ボタン
        IconButton(
          onPressed: () {
            _searchLocation();
          },
          icon: const Icon(Icons.search_off_outlined),
        ),
        const SizedBox(width: 30),
      ],
    );
  }

  void _searchLocation() {}
}
