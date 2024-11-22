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
                  Product_info(),
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

class Product_info extends StatelessWidget {
  const Product_info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: Colors.black, width: 3),
                    ),
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("image"),
                            SizedBox(
                              width: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text("Product", textAlign: TextAlign.start),
                                    Row(
                                      children: [
                                        Text("singer"),
                                        Text("Price",textAlign: TextAlign.start)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Text("1"),
                Text("2"),
                Text("3"),
                Text("4"),
                Text("3"),
                Text("2"),
              ])
        ],
      ),
    );
  }
}
