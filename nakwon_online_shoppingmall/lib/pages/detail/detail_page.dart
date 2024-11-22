import 'package:flutter/material.dart';
import 'package:nakwon_online_shoppingmall/pages/cart/shopping_cart.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NakWon'), // Appbar의 제목 설정
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart), // 장바구니 아이콘 설정
            onPressed: () {
              // 장바구니 페이지로 이동하는 코드
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShoppingCart()));
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 요소들을 왼쪽 정렬
        children: [
          Image.network('앨범 커버 이미지 URL'), // 앨범 커버 이미지 표시
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '상품 제목',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold), // 제목 스타일 설정
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '₩30,000',
              style: TextStyle(fontSize: 20, color: Colors.green), // 가격 스타일 설정
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // 장바구니에 담는 기능
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('장바구니에 담겼습니다'),
                  ),
                );
              },
              child: const Text('장바구니에 담기'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '상품 설명 텍스트', // 상품 설명 텍스트 표시
            ),
          ),
        ],
      ),
    );
  }
}
