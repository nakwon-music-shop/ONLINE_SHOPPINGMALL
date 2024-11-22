import 'package:flutter/material.dart';
//AppBar, Column(CartList), ElevatedButton으로 구성
//기본 폰트 : 16 + grey[700], padding 좌우로 20
//AppBar (폰트 : Blackitalic + black)
//TODO 담은 상품 사진 가져오기
//TODO 담은 상품 제품명 가져오기
//TODO 담은 상품 수량 가져오기
//TODO 담은 상품 X버튼을 눌러 카트에서 빼기
//TODO 상품 추가하고 빼기 버튼 구현
//TODO 구매하기 버튼 구현
//TODO 아무것도 담지 않았을 때 '장바구니가 비었습니다.' 나오게 하기

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => ShoppingCartState();
}

class ShoppingCartState extends State<ShoppingCartPage> {
  final List<Map<String, dynamic>> cartItems = [
    //상품을 담을 리스트
    {
      'image': null, //이미지가 있는 경우 링크
      'title': '페퍼톤스 - 행운을 빌어요',
      'price': 30000,
      'quantity': 1,
    },
  ];

  void increaseQuantity(int index) {
    //수량 증가
    setState(() {});
  }

  void decreaseQuantity(int index) {
    //수량 감소
    setState(() {});
  }

  void removeCartList(int index) {
    //장바군 제거
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Cart'),
        bottom: PreferredSize(
            //선 그어주기
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: Colors.black,
              height: 1,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length, //리스트에 담겨 있는 아이템 갯수만큼 생성해주기
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    //테두리를 사용하고 기본 레이아웃을 사용해 UI 구성
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black38, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20), //카드 여백
                    child: ListTile(
                      leading: item['image'] != null //왼쪽 이미지
                          ? Image.file(
                              item['image']!, //링크를 사용 할 경우 network로 바꿔서 사용
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover)
                          : const Icon(
                              //이미지 파일이 없을경우
                              Icons.photo,
                              size: 50,
                              color: Colors.grey,
                            ),
                      title: Text(item['title']),
                      subtitle: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => decreaseQuantity(index),
                            icon: const Icon(Icons.remove),
                          ),
                          //감소 버튼
                          Text('${item['quantity']}'), //수량
                          IconButton(
                            onPressed: () => increaseQuantity(index),
                            icon: const Icon(Icons.add),
                          ),
                          //증가 버튼
                        ],
                      ), //제목 중앙
                      trailing: SizedBox(
                        width: 90,
                        height: 80,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  removeCartList(index);
                                },
                                child: Icon(
                                  Icons.close,
                                  size: 24,
                                ),
                              ),
                            ), //제거버튼
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                '${item['price']}원',
                              ),
                            ), //가격표시
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {}, //TODO 장바구니 구매 기능 구현
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text(
                    '구매하기',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
