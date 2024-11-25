// ignore_for_file: prefer_const_constructors
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
  ];

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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShoppingCartPage()));
              },
              icon: Icon(Icons.shopping_bag),
            ),
          ]),
      body: Center(
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
                            productBox(2),
                          ])
                    ],
                  ),
                ),
              ],
            )),
      ),
      // 상품 등록 페이지 연결 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final returnAlbum = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegistPage()));
          album.add(returnAlbum);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
      ),
    );
  }

  Padding productBox(int i) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 3),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => DetailPage()));
          },
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      width: 80,
                      height: 80,
                      child: Text("image")),
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              album[i].song,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
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
                                    Text(
                                      album[i].artist,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      album[i].price.toString(),
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
              BorderSide(color: Colors.black, width: 3)),
        ));
  }
}
