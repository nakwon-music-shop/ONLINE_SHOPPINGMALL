// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:nakwon_online_shoppingmall/album.dart';
import 'package:nakwon_online_shoppingmall/pages/cart/shopping_cart_Page.dart';
import 'package:nakwon_online_shoppingmall/pages/detail/detail_page.dart';
import 'package:nakwon_online_shoppingmall/pages/regist/regist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var fnumber = NumberFormat('###,###,###,###');

  List<Album> album = [
    Album(
        imagePath: '',
        song: '행운을 빌어요',
        artist: '페퍼톤스',
        price: 30000,
        description: ''),
    Album(
        imagePath: '',
        song: '오디세이',
        artist: '행로난',
        price: 50000,
        description: ''),
    Album(
        imagePath: '',
        song: 'Lights behind you',
        artist: 'SURL',
        price: 40000,
        description: ''),
    Album(
        imagePath: '',
        song: '좋지 아니한가?',
        artist: '유다빈밴드',
        price: 15000,
        description: ''),
    Album(
        imagePath: '',
        song: '검정치마',
        artist: 'LingLing',
        price: 25000,
        description: ''),
    Album(
        imagePath: '',
        song: '각자의 밤',
        artist: '나상현씨 밴드',
        price: 40000,
        description: ''),
    Album(
        imagePath: '',
        song: 'APT.',
        artist: 'ROSE, Bruno Mars',
        price: 40000,
        description: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'NakWon',
            style: TextStyle(
                fontFamily: "Inter-Italic",
                fontWeight: FontWeight.w100,
                color: Colors.white),
          ),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShoppingCartPage()));
              },
              icon: Icon(Icons.shopping_cart),color: Colors.white
            ),
          ]),
      body: Scrollbar(
        child: Center(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  search_bar(),
                  Expanded(
                    child: ListView(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < album.length; i++)
                                productBox(i),
                            ])
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
      floatingActionButton: floatingbutton(),
    );
  }

  FloatingActionButton floatingbutton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.white,
      child: PopupMenuButton(
          color: Colors.white,
          child: Icon(Icons.add),
          itemBuilder: (context) => <PopupMenuEntry>[
                PopupMenuItem(
                  onTap: () async {
                    final returnAlbum = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegistPage()));
                    album.add(returnAlbum);
                  },
                  child: ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add'),
                  ),
                ),
                PopupMenuItem(
                  onTap: () async {
                    final returnAlbum = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegistPage()));
                    album.add(returnAlbum);
                  },
                  child: ListTile(
                    leading: Icon(Icons.shopping_cart_checkout_outlined),
                    title: Text('구매목록'),
                  ),
                ),
              ]),
    );
  }

  Padding productBox(int i) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 5),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(album: album[i])));
          },
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      width: 80,
                      height: 80,
                      child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.file(File(album[i].imagePath)))),
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 28,
                            child: FittedBox(
                              child: Text(
                                album[i].song,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        album[i].artist,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      fnumber.format(album[i].price),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
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
              BorderSide(color: Colors.black, width: 5)),
        ));
  }
}
