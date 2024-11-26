import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nakwon_online_shoppingmall/pages/home/home_page.dart';
import 'package:nakwon_online_shoppingmall/theme.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nakwon',
      theme: theme,
      home: HomePage(),
    );
  }
}
