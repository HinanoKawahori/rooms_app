import 'package:flutter/material.dart';
import 'package:roomie_app/views/chat_page.dart';
import 'package:roomie_app/views/my_page.dart';
import 'package:roomie_app/views/parts/room_list.dart';
import 'package:roomie_app/views/rooms_list_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  //ページのリスト
  final List pages = [
    RoomListPage(),
    ChatPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            //マイページ登録
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyPage(),
                  ),
                );
              },
              child: const Text('マイページ'),
            )
          ],
        ),
      ),
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
              icon: Icon(Icons.house_outlined),
              label: 'rooms',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined),
              label: 'renters',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'mypage',
            ),
          ]),
    );
  }
}
