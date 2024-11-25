import 'package:flutter/material.dart';
import 'package:nakwon_online_shoppingmall/pages/cart/shopping_cart_Page.dart';
import 'package:nakwon_online_shoppingmall/album.dart';

// DetailPage 클래스 정의, Album 객체와 장바구니 아이템 리스트를 받음
class DetailPage extends StatelessWidget {
  final Album album; // Album 객체를 받기 위한 변수
  final List<Album> cartItems; // 장바구니 아이템 리스트

  // DetailPage 생성자, album과 cartItems를 필수로 받음
  const DetailPage({super.key, required this.album, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NakWon',
          style: TextStyle(color: Colors.white), // AppBar의 글자 색상 설정
        ),
        backgroundColor: Colors.black, // AppBar의 배경 색상 설정
        centerTitle: true, // 제목의 위치를 가운데로 설정
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart,
                color: Colors.white), // 아이콘 색상 수정
            onPressed: () {
              // 장바구니 페이지로 이동하는 코드
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ShoppingCartPage(cartItems: cartItems)),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 요소들을 왼쪽 정렬
        children: [
          Image.network(album.imagePath), // 앨범 커버 이미지 표시
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              album.song,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold), // 제목 스타일 설정
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '₩${album.price}',
              style: const TextStyle(
                  fontSize: 20, color: Colors.green), // 가격 스타일 설정
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                cartItems.add(album); // 장바구니에 아이템 추가
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('장바구니에 담겼습니다'),
                  ),
                ); // 장바구니에 담겼음을 사용자에게 알림
              },
              child: const Text('장바구니에 담기'), // 버튼 텍스트 설정
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              album.artist, // 가수 이름 표시
              style: const TextStyle(fontSize: 18), // 가수 이름 스타일 설정
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              album.description, // 상세 설명 텍스트 표시
              style: const TextStyle(fontSize: 16), // 상세 설명 텍스트 스타일 설정
            ),
          ),
        ],
      ),
    );
  }
}
