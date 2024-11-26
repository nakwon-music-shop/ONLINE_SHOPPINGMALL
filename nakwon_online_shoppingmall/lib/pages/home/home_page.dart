import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:nakwon_online_shoppingmall/album.dart';
import 'package:nakwon_online_shoppingmall/pages/cart/shopping_cart_Page.dart';
import 'package:nakwon_online_shoppingmall/pages/detail/detail_page.dart';
import 'package:nakwon_online_shoppingmall/pages/home/home_page_List.dart';
import 'package:nakwon_online_shoppingmall/pages/home/widgets/image_box.dart';
import 'package:nakwon_online_shoppingmall/pages/order/my_orders_page.dart';
import 'package:nakwon_online_shoppingmall/pages/regist/regist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var fnumber = NumberFormat('###,###,###,###원');
  final List<Album> cartItems = [];
  String inputText = ""; // 검색 입력을 저장할 변수

  @override
  Widget build(BuildContext context) {
    // 검색 입력에 따라 앨범 필터링
    List<Album> filteredAlbums = album.where((a) {
      return a.song.toLowerCase().contains(inputText.toLowerCase()) ||
          a.artist.toLowerCase().contains(inputText.toLowerCase());
    }).toList();

    print(filteredAlbums.last.artist);
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
                          builder: (context) => ShoppingCartPage(
                                cartItems: cartItems,
                              )));
                },
                icon: Icon(Icons.shopping_cart),
                color: Colors.white),
          ]),
      body: Scrollbar(
        child: Center(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  search_bar(),
                  Expanded(
                    child: filteredAlbums.isEmpty
                        ? Center(
                            child: Text(
                              '데이터가 없음',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          )
                        : ListView(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int i = 0;
                                      i < filteredAlbums.length;
                                      i++)
                                    productBox(filteredAlbums, i),
                                ],
                              )
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
      shape: Border.all(width: 3),
      child: PopupMenuButton(
          shape: Border.all(width: 3),
          color: Colors.white,
          child: Icon(Icons.add),
          itemBuilder: (context) => <PopupMenuEntry>[
                PopupMenuItem(
                  onTap: () async {
                    final returnAlbum = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegistPage()));
                    if (returnAlbum != null) {
                    setState(() {
                      album.add(returnAlbum);
                    });
                  }
                  },
                  child: ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add'),
                  ),
                ),
                PopupMenuItem(
                  onTap: () async {
                    final returnAlbum = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyOrdersPage()));
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

  Padding productBox(List<Album> filteredAlbums, int i) {
    Album currentAlbum = filteredAlbums[i]; // 필터링된 앨범 사용
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
                    builder: (context) => DetailPage(
                          album: album[i],
                          cartItems: cartItems, // cartItems 전달
                        )));
          },
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      width: 60,
                      height: 80,
                      child: ImageBox(currentAlbum.imagePath)),
                  SizedBox(
                    width: 20,
                  ),
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
                                currentAlbum.song,
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
                                      width: 110,
                                      child: Text(
                                        currentAlbum.artist,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      fnumber.format(currentAlbum.price),
                                      style: TextStyle(
                                          fontSize: 13,
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
          onSubmitted: (value) {
            setState(() => inputText = value);
          },
        ));
  }
}
