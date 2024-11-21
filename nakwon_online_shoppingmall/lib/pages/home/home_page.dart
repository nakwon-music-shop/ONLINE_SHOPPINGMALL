// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'NakWon',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_bag),
            ),
          ]),
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  search_bar(),
                  ListView(
                    children: [
                      Text("1"),
                      Text("2"),
                      Text("3"),
                      Text("4"),
                      Text("3"),
                      Text("2"),
                    ],
                  ),

                ],
              ))),
    );
  }

  Padding search_bar() {
    return Padding(
                  padding: EdgeInsets.all(20),
                    child: SearchBar(
                      hintText: "검색어를 입력하세요",
                      trailing: [Icon(Icons.search)],
                      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      side: WidgetStateProperty.all(
                          BorderSide(color: Colors.black, width: 3)),
                    ));
  }
}
