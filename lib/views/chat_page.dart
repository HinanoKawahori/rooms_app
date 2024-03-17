import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController searchTextController = TextEditingController();
  TextEditingController locationTextController = TextEditingController();

//土地検索付きのルームリスト取得
  Future<List<Map<String, dynamic>>> returnRoomListWithLocation(
      String location) async {
    final roomList = await FirebaseFirestore.instance
        .collection('rooms')
        .where('location', isEqualTo: location)
        .get();
    print(roomList.docs.map((doc) => doc.data()).toList());

    return roomList.docs.map((doc) => doc.data()).toList();
  }

//その部屋のユーザー情報種等
  Future<Map<String, dynamic>?> returnUserOfTheRoom(String userId) async {
    final userInfo =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return userInfo.data() as Map<String, dynamic>;
  }

  @override
  void dispose() {
    locationTextController.dispose();
    searchTextController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> _roomList = [];

  @override
  Widget build(BuildContext context) {
    //(ルームリスト)

    return Column(
      children: [
        Row(children: [
          const SizedBox(width: 30),
          //検索テキストフィールド
          Expanded(
            child: TextField(
              controller: locationTextController,
              decoration:
                  const InputDecoration(hintText: 'Where are you looking?'),
            ),
          ),
          //検索ボタン(ここでisClickedを変える)
          IconButton(
            onPressed: () async {
              List<Map<String, dynamic>> roomList =
                  await returnRoomListWithLocation(locationTextController.text);
              setState(() {
                _roomList = roomList;
              });
            },
            icon: const Icon(Icons.search_outlined),
          ),
        ]),
        const SizedBox(width: 30),
        Expanded(
          child: //ルームリストを取得
              ListView.builder(
            itemCount: _roomList.length,
            itemBuilder: (context, index) {
              final String userId = _roomList[index]['userId'];

              //部屋に付随するユーザー情報を取得
              return FutureBuilder(
                future: returnUserOfTheRoom(userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('エラーが発生しました: ${snapshot.error}');
                  } else {
                    final Map<String, dynamic> userInfo = snapshot.data!;

                    //⭐️ユーザー情報タイル⭐️
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: const Color.fromARGB(255, 231, 186, 238),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //ユーザー情報
                            Row(
                              children: [
                                const CircleAvatar(),
                                Text(userInfo['userName']),
                              ],
                            ),

                            //TODO 部屋写真
                            const SizedBox(
                              width: 400,
                              height: 250,
                              child: Text('ここに画像が来るよ'),
                            ),
                            //部屋情報
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    _roomList[index]['rent'] + '/mo',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    _roomList[index]['type'],
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    _roomList[index]['timing'],
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    _roomList[index]['location'],
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
