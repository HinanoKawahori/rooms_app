//ルームタイル
import 'package:flutter/material.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //ユーザー情報
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CircleAvatar(),
                  const SizedBox(width: 20),
                  Text(
                    userInfo['userName'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),

            //TODO 部屋写真
            const SizedBox(
              width: 400,
              height: 250,
              child: Text('ここに画像が来るよ'),
            ),
            //部屋情報
            const SizedBox(width: 10),
            Column(
              children: [
                Text(
                  roomList[index]['rent'] + '/mo',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
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
            const Divider(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
