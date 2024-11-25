import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nakwon_online_shoppingmall/pages/home/home_page.dart';
import 'package:nakwon_online_shoppingmall/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: Platform.isAndroid
          ? 'AIzaSyDE_Jjh_oxh3KzvduyJ894l9GDPPTgqbCA'
          : 'AIzaSyBAqbmXP_QfFmKQ9nO8G9uP4PYEaOheY9I',
      appId: Platform.isAndroid
          ? '1:564651819326:android:b2fc8cc422d3650cbfec6f'
          : '1:564651819326:ios:fb5a59ccb1d569bebfec6f',
      messagingSenderId: '564651819326',
      projectId: 'nakwon-music-shop-911b1',
      iosBundleId: 'com.example.nakwonOnlineShoppingmall',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance.collection('albums').get().then((value) {
      print(value.docs.length);
    });
    return MaterialApp(
      title: 'Nakwon',
      theme: theme,
      home: HomePage(),
    );
  }
}
