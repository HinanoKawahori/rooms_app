import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:roomie_app/datas/room.dart';

class RoomList extends StatefulWidget {
  const RoomList({Key? key}) : super(key: key);

  @override
  _RoomListState createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  @override
  Widget build(BuildContext context) {
    return

        //ルームリストを取得
        FutureBuilder(
      future: returnRoomList(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('エラーが発生しました: ${snapshot.error}');
        } else {
          //(ルームリスト)
          final List<Map<String, dynamic>> roomList = snapshot.data!;

          //一つ一つの物件のユーザーIDを取得する
          return ListView.builder(
            itemCount: roomList.length,
            itemBuilder: (context, index) {
              final String userId = roomList[index]['userId'];

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
                            //TODO ユーザー情報
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

                            //TODO　部屋情報

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
                },
              );
            },
          );
        }
      },
    );

    //   ),
    // );
  }

  Future<List<Map<String, dynamic>>> returnRoomList() async {
    final roomList = await FirebaseFirestore.instance.collection('rooms').get();
    return roomList.docs.map((doc) => doc.data()).toList();
  }

  Future<Map<String, dynamic>?> returnUserOfTheRoom(String userId) async {
    final userInfo =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return userInfo.data() as Map<String, dynamic>;
  }
}

// Autocomplete


  // GoogleMap(
        //   onMapCreated: _onMapCreated,
        //   initialCameraPosition: CameraPosition(
        //     target: _center,
        //     zoom: 11.0,
        //   ),
        // ),
