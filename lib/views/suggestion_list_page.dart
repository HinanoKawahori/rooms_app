import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:roomie_app/datas/suggestion.dart';

class SuggestionListPage extends StatefulWidget {
  const SuggestionListPage({super.key});

  @override
  State<SuggestionListPage> createState() => _SuggestionListPageState();
}

class _SuggestionListPageState extends State<SuggestionListPage> {
  //suggestionを取得する
  Future<List<Map<String, dynamic>>> returnSuggestionList() async {
    final suggestionList =
        await FirebaseFirestore.instance.collection('suggestions').get();

    return suggestionList.docs.map((doc) => doc.data()).toList();
  }

  //suggestionに付随するuser情報を取得する
  Future getUserInfoOfTheSuggestion(userId) async {
    final userIdOfTheRoom =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return userIdOfTheRoom.data();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: returnSuggestionList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('エラーが発生しました: ${snapshot.error}');
          } else {
            //サジェスチョンリスト
            final List<Map<String, dynamic>> suggestionList = snapshot.data!;

            return ListView.builder(
              itemCount: suggestionList.length,
              itemBuilder: (context, index) {
                String userIdOfTheSuggestion = suggestionList[index]['userId'];
                //suggestionデータに付随するユーザー情報を取得する
                return FutureBuilder(
                  future: getUserInfoOfTheSuggestion(userIdOfTheSuggestion),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('エラーが発生しました: ${snapshot.error}');
                    } else {
                      Map<String, dynamic> userInfo = snapshot.data!;

                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const CircleAvatar(),
                                  const SizedBox(width: 20),
                                  Text(
                                    userInfo['userName'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text('[' + suggestionList[index]['title'] + ']'),
                            Text(suggestionList[index]['message']),
                            const Divider(),
                          ],
                        ),
                      );
                    }
                  },
                );
              },
            );
          }
        });
  }
}
