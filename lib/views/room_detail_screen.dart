import 'package:flutter/material.dart';

class RoomDetailScreen extends StatelessWidget {
  const RoomDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('部屋の詳細ページ')),
      body: Column(
        children: [Text('部屋の詳細ページ')],
      ),
    );
  }
}
