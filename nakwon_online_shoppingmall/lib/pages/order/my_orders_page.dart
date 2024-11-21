import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  List<Widget> orderWidgets = [];

  @override
  Widget build(BuildContext context) {

    orderWidgets.add(createOrderBox());
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          createOrderList(),
        ],
      ),
    );
  }

  Widget createOrderList() {
    try {
      return Expanded(
        child: ListView.builder(
          //widgetList의 length로 바꾸면 될 듯
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 4, left: 2, right: 2),
              child: Column(children: orderWidgets),
            );
          },
        ),
      );
    } catch (e) {
      print('An error occurred: $e');
      return Column(
        children: [const Text('데이터를 불러오는데 실패했습니다.')],
      );
    }
  }

  //곡명, 가수, 가격 받아오면 될 듯
  Widget createOrderBox() {
    try {
      return Column(
        children: [
          // 구매목록 박스
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
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
                        "assets/bag.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // 구매한 음반 정보 표시
                  const Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          // 노래명 - 가수
                          Row(
                            children: [
                              Text(
                                '노래명',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                ' - ',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                '가수',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(),
                          // 가격정보 - 결제완료
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('00000원'),
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
          ),
        ],
      );
    } catch (e) {
      print('An error occurred: $e');
      return Column(
        children: [const Text('데이터를 불러오는데 실패했습니다.')],
      );
    }
  }
}
