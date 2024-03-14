import 'package:flutter/material.dart';
import 'package:roomie_app/views/parts/search_part.dart';

class RentersListPage extends StatelessWidget {
  const RentersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SearchPart(),
        Text('renters_list'),
      ],
    );
  }
}
