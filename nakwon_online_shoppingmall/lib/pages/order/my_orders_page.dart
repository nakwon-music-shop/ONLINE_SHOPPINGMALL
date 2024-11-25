
import 'package:flutter/material.dart';
import 'package:nakwon_online_shoppingmall/album.dart';
import 'package:nakwon_online_shoppingmall/pages/home/home_page.dart';
import 'package:nakwon_online_shoppingmall/pages/order/widgets/order_box.dart';

//구매목록 페이지
class MyOrdersPage extends StatefulWidget {
  final List<Album> albums;

  MyOrdersPage({this.albums = const []});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Orders',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          //appBar 홈페이지 이동 버튼
          IconButton(
            icon: const Icon(Icons.home), // 홈 아이콘
            onPressed: () {
              // HomePage로 이동
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false, // 이전 페이지 제거
              );
            },
          )
        ],
      ),
      //구매목록이 비었는지 확인
      body: widget.albums.isEmpty
          //비어있을 경우 텍스트 출력
          ? Center(
              child: const Text('구매목록이 없습니다.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            )
          //비어있지 않은 경우 리스트뷰 생성
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: widget.albums.length,
                        itemBuilder: (context, index) {
                          return createOrderBox(widget.albums[index]);
                        }))
              ],
            ),
    );
  }
}
