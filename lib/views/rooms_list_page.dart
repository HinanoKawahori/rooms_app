import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:roomie_app/views/room_detail_screen.dart';

class RoomListPage extends StatefulWidget {
  @override
  _RoomListPageState createState() => _RoomListPageState();
}

class _RoomListPageState extends State<RoomListPage> {
  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  TextEditingController searchTextController = TextEditingController();
  TextEditingController locationTextController = TextEditingController();
  bool isClicked = false;
  List roomList = [];

  @override
  void initState() {
    googlePlace = GooglePlace("AIzaSyC7A4kujcthzUKfcIiCNdoiNCFX63GEy2k");
    super.initState();
  }

  @override
  void dispose() {
    locationTextController.dispose();
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width, //TODO暗記　幅の調整方法
          child: Column(
            children: [
              //⭐️検索パート⭐️
              Row(
                children: [
                  const SizedBox(width: 30),
                  //検索テキストフィールド
                  Expanded(
                    child: TextField(
                      controller: locationTextController,
                      decoration: const InputDecoration(
                          hintText: 'Where are you looking?'),
                    ),
                  ),
                  //検索ボタン(ここでisClickedを変える)
                  IconButton(
                    onPressed: () async {
                      final returnedRoomList = await returnRoomListWithLocation(
                          locationTextController.text);

                      setState(() {
                        isClicked = true;
                        roomList = returnedRoomList;
                      });
                    },
                    icon: const Icon(Icons.search_outlined),
                  ),
                  IconButton(
                    onPressed: () async {
                      await returnRoomListWithLocation(
                          locationTextController.text);
                    },
                    icon: const Icon(Icons.map),
                  ),
                  const SizedBox(width: 30),
                ],
              ),

              //⭐️ルームリスト⭐️
              //ルームリストを取得
              Expanded(
                  child: //ルームリストを取得

                      (isClicked)
                          //⭐️検索結果
                          ? (roomList.isEmpty)
                              ? const Center(child: Text('検索結果がありません'))
                              : ListView.builder(
                                  itemCount: roomList.length,
                                  itemBuilder: (context, index) {
                                    final String userId =
                                        roomList[index]['userId'];

                                    //部屋に付随するユーザー情報を取得
                                    return FutureBuilder(
                                      future: returnUserOfTheRoom(userId),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const CircularProgressIndicator();
                                        } else if (snapshot.hasError) {
                                          return Text(
                                              'エラーが発生しました: ${snapshot.error}');
                                        } else {
                                          final Map<String, dynamic> userInfo =
                                              snapshot.data!;

                                          //⭐️部屋情報タイル⭐️
                                          return GestureDetector(
                                            onTap: () {
                                              // 画面遷移の処理を実行する
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RoomDetailScreen(), // 遷移先の画面を指定
                                                ),
                                              );
                                            },
                                            child: RoomTile(
                                                userInfo: userInfo,
                                                roomList: roomList,
                                                index: index),
                                          );
                                        }
                                      },
                                    );
                                  },
                                )

                          ///初めの画面
                          : FutureBuilder(
                              future: returnRoomList(),
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('エラーが発生しました: ${snapshot.error}');
                                } else {
                                  //(ルームリスト)
                                  List<Map<String, dynamic>> roomList =
                                      snapshot.data!;

                                  //一つ一つの物件のユーザーIDを取得する
                                  return ListView.builder(
                                    itemCount: roomList.length,
                                    itemBuilder: (context, index) {
                                      final String userId =
                                          roomList[index]['userId'];

                                      //部屋に付随するユーザー情報を取得
                                      return FutureBuilder(
                                        future: returnUserOfTheRoom(userId),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const CircularProgressIndicator();
                                          } else if (snapshot.hasError) {
                                            return Text(
                                                'エラーが発生しました: ${snapshot.error}');
                                          } else {
                                            final Map<String, dynamic>
                                                userInfo = snapshot.data!;

                                            //⭐️部屋情報タイル⭐️
                                            return GestureDetector(
                                              onTap: () {
                                                // 画面遷移の処理を実行する
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const RoomDetailScreen(), // 遷移先の画面を指定
                                                  ),
                                                );
                                              },
                                              child: RoomTile(
                                                userInfo: userInfo,
                                                roomList: roomList,
                                                index: index,
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    },
                                  );
                                }
                              },
                            )),
            ],
          ),
        ),
      ),
    );
  }

//検索処理（テキストフィールド）
  Future<void> searchLocation() async {
    //whereに大阪が入っているroomドキュメントを取得する
    String searchQuery = locationTextController.text;
    // Do something with the search query
    FirebaseFirestore.instance
        .collection('rooms')
        .where('location' == searchQuery);
  }

  //場所検索付き部屋リスト取得
  Future<List<Map<String, dynamic>>> returnRoomListWithLocation(
      String location) async {
    final roomList = await FirebaseFirestore.instance
        .collection('rooms')
        .where('location', isEqualTo: location)
        .get();

    return roomList.docs.map((doc) => doc.data()).toList();
  }

  //全ての部屋リスト取得
  Future<List<Map<String, dynamic>>> returnRoomList() async {
    final roomList = await FirebaseFirestore.instance.collection('rooms').get();
    return roomList.docs.map((doc) => doc.data()).toList();
  }

  //部屋のユーザー情報取得
  Future<Map<String, dynamic>?> returnUserOfTheRoom(String userId) async {
    final userInfo =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return userInfo.data() as Map<String, dynamic>;
  }
}

//ルームタイル
class RoomTile extends StatelessWidget {
  const RoomTile({
    required this.userInfo,
    required this.roomList,
    required this.index,
  });

  final userInfo;
  final roomList;
  final index;

  @override
  Widget build(BuildContext context) {
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
                    roomList[index]['rent'] + '/mo',
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    roomList[index]['type'],
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    roomList[index]['timing'],
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    roomList[index]['location'],
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
}
