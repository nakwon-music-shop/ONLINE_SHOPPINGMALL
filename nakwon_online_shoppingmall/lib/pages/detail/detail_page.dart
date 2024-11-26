import 'package:flutter/material.dart';
import 'package:nakwon_online_shoppingmall/pages/cart/shopping_cart_Page.dart';
import 'package:nakwon_online_shoppingmall/album.dart';
import 'package:nakwon_online_shoppingmall/pages/detail/widgets/detail_image_box.dart';

class DetailPage extends StatelessWidget {
  final Album album; // Album 객체를 받기 위한 변수
  final List<Album> cartItems; // 장바구니 아이템을 받기 위한 변수 추가

  const DetailPage({super.key, required this.album, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: Colors.white), // 뒤로가기 버튼 색상 화이트로 설정
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'NakWon',
          style: TextStyle(
            fontFamily: "Inter-Italic",
            fontWeight: FontWeight.w100,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black, // AppBar의 배경 색상 설정
        centerTitle: true, // 제목의 위치를 가운데로 설정
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart,
                color: Colors.white), // 장바구니 아이콘 색상 화이트로 설정
            onPressed: () {
              // 장바구니 페이지로 이동하는 코드
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoppingCartPage(
                    cartItems: cartItems,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            SizedBox(
              width: 350,
              height: 350,
              child: DetailImageBox(album.imagePath), // 앨범 커버 이미지 표시
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                album.song,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ), // 제목 스타일 설정
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '₩${album.price}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ), // 가격 스타일 설정
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                album.description, // 상품 설명 표시
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                album.artist,
              ),
            ),
            Spacer(), // 여유 공간 추가
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity, // 버튼을 가능한 최대 너비로 설정
                child: ElevatedButton(
                  onPressed: () {
                    // 장바구니에 동일한 앨범이 있는지 확인
                    bool albumExists = false;
                    for (var i = 0; i < cartItems.length; i++) {
                      if (cartItems[i].song == album.song &&
                          cartItems[i].artist == album.artist) {
                        cartItems[i] = Album(
                          imagePath: cartItems[i].imagePath,
                          song: cartItems[i].song,
                          artist: cartItems[i].artist,
                          price: cartItems[i].price,
                          description: cartItems[i].description,
                          quantity: cartItems[i].quantity + 1, // 수량 증가
                        );
                        albumExists = true;
                        break;
                      }
                    }
                    if (!albumExists) {
                      // 동일한 앨범이 없으면 새로운 앨범 추가
                      cartItems.add(Album(
                        imagePath: album.imagePath,
                        song: album.song,
                        artist: album.artist,
                        price: album.price,
                        description: album.description,
                        quantity: 1,
                      ));
                    }

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
            ),
          ],
        ),
      ),
    );
  }
}
