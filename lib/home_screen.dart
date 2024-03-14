import 'package:flutter/material.dart';
import 'package:roomie_app/views/renters_list_page.dart';
import 'package:roomie_app/views/rooms_list_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  //ページのリスト
  final List pages = const [
    RoomsListPage(),
    RentersListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.house_outlined), label: 'rooms'),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_alt_outlined), label: 'renters'),
          ]),
    );
  }
}
