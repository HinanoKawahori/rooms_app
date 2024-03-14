import 'package:flutter/material.dart';
import 'package:roomie_app/views/parts/search_part.dart';

class RoomsListPage extends StatelessWidget {
  const RoomsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchPart(),
        Text('rooms_list'),
      ],
    );
  }
}
