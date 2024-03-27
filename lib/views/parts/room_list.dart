import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:roomie_app/datas/room.dart';
import 'package:roomie_app/views/parts/room_tile.dart';
import 'package:roomie_app/views/rooms_list_page.dart';

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
                    return RoomTile(
                        userInfo: userInfo, roomList: roomList, index: index);
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
