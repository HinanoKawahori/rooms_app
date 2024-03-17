import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roomie_app/datas/user_account.dart';

//⭐️新規登録の部分⭐️
class CreateUserPart extends StatefulWidget {
  const CreateUserPart({
    Key? key,
  }) : super(key: key);

  @override
  _CreateUserPartState createState() => _CreateUserPartState();
}

class _CreateUserPartState extends State<CreateUserPart> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: const Color.fromARGB(255, 231, 177, 240),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'emailを入力してください'),
              ),
              TextFormField(
                controller: passwordController,
                decoration:
                    const InputDecoration(hintText: 'passwordを入力してください'),
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(hintText: '名前を入力してください'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await createUserWithEmailAndPassword(
                    emailController.text,
                    passwordController.text,
                    nameController.text,
                  );
                  emailController.clear();
                  passwordController.clear();
                  nameController.clear();
                },
                child: const Text('新規登録'),
              ),
            ],
          ),
        ),
      ),
    );
  }

//ユーザー新規登録
  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final UserCredential result =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final currentUserId = await getCurrentUserId();
      UserAccount userAccount = UserAccount(
        imageUrl: '',
        selfIntro: '',
        updatedAt: Timestamp.now(),
        email: email,
        userId: currentUserId,
        userName: name,
        createdAt: Timestamp.now(),
      );
      FirebaseFirestore
          .instance //TODO⭐️エラー⭐️エラーが起きている場所はここ！次に作業がないから、awaitつけなくていいってこと？？？
          .collection('users')
          .doc(currentUserId)
          .set(userAccount.toJson());
    } catch (e) {
      print('Error creating user: $e');
      throw e;
    }
  }

//
  Future<String> getCurrentUserId() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      return currentUser.uid;
    } else {
      throw Exception('User not logged in');
    }
  }
}

//⭐️ログインの部分⭐️
class loginPart extends StatefulWidget {
  loginPart({super.key});

  @override
  State<loginPart> createState() => _loginPartState();
}

class _loginPartState extends State<loginPart> {
  //ログインコントローラー
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  @override
  void dispose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: const Color.fromARGB(255, 234, 200, 240),
        child: Column(
          children: [
            //TODO ログイン
            TextFormField(
              controller: loginEmailController,
              decoration: const InputDecoration(hintText: 'put your email'),
            ),
            TextFormField(
              controller: loginPasswordController,
              decoration: const InputDecoration(hintText: 'put your password'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _logIn(
                    loginEmailController.text, loginPasswordController.text);
                loginEmailController.clear();
                loginPasswordController.clear();
              },
              child: const Text('ログイン'),
            ),
          ],
        ),
      ),
    );
  }

  //ログイン
  Future<void> _logIn(email, password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<String> getCurrentUserId() async {
    return await FirebaseAuth.instance.currentUser!.uid;
  }
}


//  Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: emailController,
//                     decoration:
//                         const InputDecoration(hintText: 'emailを入力してください'),
//                   ),
//                   TextFormField(
//                     controller: passwordController,
//                     decoration:
//                         const InputDecoration(hintText: 'passwordを入力してください'),
//                   ),
//                   TextFormField(
//                     controller: nameController,
//                     decoration: const InputDecoration(hintText: '名前を入力してください'),
//                   ),
//                   const SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () async {
//                       await createUserWithEmailAndPassword(
//                         emailController.text,
//                         passwordController.text,
//                         nameController.text,
//                       );
//                       emailController.clear();
//                       passwordController.clear();
//                       nameController.clear();
//                     },
//                     child: const Text('新規登録'),
//                   ),
//                 ],
//               ),
//             ),