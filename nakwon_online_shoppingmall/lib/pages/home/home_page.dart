// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:nakwon_online_shoppingmall/pages/detail/detail_page.dart';

class Product_Data {
  String product;
  String singer;
  int price;
  String image;
  String pdDetail;

  Product_Data(
      {required this.product,
      required this.singer,
      required this.price,
      required this.image,
      required this.pdDetail});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product_Data> products = [
    Product_Data(
      product: '행운을 빌어요',
      singer: '페퍼톤스',
      price: 30000,
      image: 'Url',
      pdDetail: '인디가수 페퍼톤스의 앨범',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'NakWon',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_bag),
            ),
          ]),
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  search_bar(),
                  Expanded(
                    child: ListView(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              productBox(),
                            ])
                      ],
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                  child: Icon(Icons.add),
                  backgroundColor: Colors.white,
                  ) 
                ],
              ))),
    );
  }

  Padding productBox() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 3),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => DetailPage()));
          },
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("image"),
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text("Product", textAlign: TextAlign.start),
                          Row(
                            children: [
                              Text("singer"),
                              Text("Price", textAlign: TextAlign.start)
                            ],
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
              BorderSide(color: Colors.black, width: 3)),
        ));
  }
}
