import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nakwon_online_shoppingmall/album.dart';
//AppBar, Column(CartList), ElevatedButton으로 구성
//기본 폰트 : 16 + grey[700], padding 좌우로 20
//AppBar (폰트 : Blackitalic + black)
//TODO 담은 상품 사진 가져오기
//TODO 담은 상품 제품명 가져오기
//TODO 담은 상품 수량 가져오기

class ShoppingCartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems; // 인자로 받는 cartItems 정의

  const ShoppingCartPage({super.key, required this.cartItems}); // 생성자에서 인자 받기

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  late List<Album> cartItems; // 장바구니 아이템 상태 변수

  @override
  void initState() {
    super.initState();

    cartItems = widget.cartItems; // 생성자로 받은 cartItems를 상태 변수로 설정
  }

  void increaseQuantity(int index) {
    setState(() {
      cartItems[index] = Album(
        imagePath: cartItems[index].imagePath,
        song: cartItems[index].song,
        artist: cartItems[index].artist,
        price: cartItems[index].price,
        description: cartItems[index].description,
      );
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      // 현재 수량을 확인하고, 1 이상이면 수량을 줄이고 아니면 리스트에서 제거합니다.
      if (cartItems[index].quantity > 1) {
        cartItems[index] = Album(
          imagePath: cartItems[index].imagePath,
          song: cartItems[index].song,
          artist: cartItems[index].artist,
          price: cartItems[index].price,
          description: cartItems[index].description,
          quantity: cartItems[index].quantity - 1, // 수량 감소
        );
      } else {
        cartItems.removeAt(index); // 수량이 1 이하일 경우 아이템 제거
      }
    });
  }

  void removeCartItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void showPurchaseDialog() {
    int total = 0;
    for (var item in cartItems) {
      total += item.price;
    }

    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Text('총 ${total}원을 결제하시겠습니까?'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context); //다이얼로그 닫기
              },
              child: const Text(
                '취소',
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context); // 다이얼로그 닫기
                Navigator.pop(context); // 쇼핑 카트 페이지 닫기
              },
              child: const Text(
                '구매하기',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //앱바
        iconTheme: IconThemeData(color: Colors.white), // 뒤로가기 버튼 색상 변경
        title: Text(
          'Cart',
          style: TextStyle(
              fontFamily: "Inter-Italic",
              fontWeight: FontWeight.w100,
              color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              child: cartItems.isEmpty // 장바구니가 비어 있을 때 문구 추가
                  ? const Center(
                      child: Text(
                        '장바구니가 비어있습니다',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: cartItems.length, // 리스트에 담겨 있는 아이템 갯수만큼 생성해주기
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.black38, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20), // 카드 여백
                          child: ListTile(
                            leading: item.imagePath.isNotEmpty // 왼쪽 이미지
                                ? Image.file(
                                    File(item
                                        .imagePath), // 링크를 사용할 경우 network로 바꿔서 사용
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover)
                                : const Icon(
                                    // 이미지 파일이 없을 경우
                                    Icons.photo,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                            title: Text(item.song),
                            subtitle: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () => decreaseQuantity(index),
                                  icon: const Icon(Icons.remove),
                                ),
                                Text('${1}'), // 수량
                                IconButton(
                                  onPressed: () => increaseQuantity(index),
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                            trailing: SizedBox(
                              width: 90,
                              height: 80,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: () => removeCartItem(index),
                                      child: Icon(Icons.close, size: 24),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text('${item.price}원'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            if (cartItems.isNotEmpty) // 장바구니가 비어 있지 않을 때 활성화되도록 조건문 추가
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: showPurchaseDialog,
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text(
                    '구매하기',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
