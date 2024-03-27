import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roomie_app/datas/user_account.dart';
import 'package:roomie_app/views/drawerpages/parts/create_user_part.dart';
import 'package:roomie_app/views/parts/post_room_part.dart';
import 'package:roomie_app/views/parts/post_suggestion_part.dart';

class MyPage extends StatefulWidget {
  const MyPage({
    Key? key,
  }) : super(key: key);
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  //1  ログイン状態か判断 (非同期処理だからfuturebuilderを使う)
  //2　ログイン状態で、画面を変える
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          throw Error();
        } else {
          //ログインしている場合

          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('マイページ'),
                leading: IconButton(
                    onPressed: () async {
                      await _logOut();
                    },
                    icon: const Icon(Icons.logout)),
              ),
              body: const SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    PostSuggestionPart(),
                    PostRoomPart(),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(title: const Text('ようこそ')),
              body: Column(
                children: [
                  //ログイン画面
                  loginPart(),
                  //新規ユーザー登録
                  const CreateUserPart(),
                ],
              ),
            );
          }
        }
      },
    );
  }

//UserIdをとる。
  Future<String?> getCurrentUserId() async {
    try {
      return FirebaseAuth.instance.currentUser!.uid;
    } catch (e) {
      return '';
    }
  }

//新規登録しているかどうかの確認
  Future<String> checkIfLoginOrNot() async {
    String? userId = await getCurrentUserId();
    if (userId != '') {
      return 'Login';
    } else {
      return 'notLogin';
    }
  }

//新規登録
  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    //TODO 事前にこのユーザーが登録されていないか確認し、されていない場合のみ登録する。
    try {
      //authで登録
      final UserCredential result =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //authから、userIdをゲットする。
      final currentUserId = await getCurrentUserId();
      //cloudstoreで登録
      UserAccount userAccount = UserAccount(
        imageUrl: '',
        selfIntro: '',
        updatedAt: Timestamp.now(),
        email: email,
        userId: currentUserId ?? '',
        userName: name,
        createdAt: Timestamp.now(),
      );
      await FirebaseFirestore
          .instance //TODO復習⭐️ awaitをつけないと、処理が完了しないままbuildが終わるので注意！
          .collection('users')
          .doc(currentUserId)
          .set(userAccount.toJson());
    } catch (e) {
      print('Error creating user: $e');
      throw e;
    }
  }

//ログアウト
  Future<void> _logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
