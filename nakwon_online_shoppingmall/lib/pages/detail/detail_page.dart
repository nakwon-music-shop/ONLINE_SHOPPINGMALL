import 'package:flutter/material.dart';
import 'package:nakwon_online_shoppingmall/pages/cart/shopping_cart_Page.dart';

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
                  MaterialPageRoute(builder: (context) => ShoppingCartPage()));
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 요소들을 왼쪽 정렬
        children: [
          Image.network(
              'data:image/jpeg;base64,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'), // 앨범 커버 이미지 표시
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
