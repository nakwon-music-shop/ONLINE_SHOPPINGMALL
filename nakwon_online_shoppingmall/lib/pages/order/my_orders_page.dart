import 'package:flutter/material.dart';
import 'package:nakwon_online_shoppingmall/album.dart';

class MyOrdersPage extends StatefulWidget {
  final List<Album> albums;

  MyOrdersPage({required this.albums});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      //구매목록이 비었는지 확인
      body: widget.albums.isEmpty
          ? Center(
              child: const Text('구매목록이 없습니다.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            )
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

  //구매 목록 박스 
  Widget createOrderBox(Album album) {
    try {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              // 이미지 표시할 박스
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: Image.asset(
                    album.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // 구매한 음반 정보 표시
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Row(
                        children: [
                          // 노래명 - 가수
                          Expanded(
                            child: Text(
                              '${album.song} - ${album.artist}',
                              style: const TextStyle(fontSize: 16),
                              softWrap: true, // 줄바꿈 허용
                              overflow: TextOverflow.visible, 
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(),
                      // 가격정보 - 결제완료
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('${album.price}원'),
                          Text('결제완료'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      print('An error occurred: $e');
      return Column(
        children: [const Text('데이터를 불러오는데 실패했습니다.')],
      );
    }
  }
}
