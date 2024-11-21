import 'package:flutter/material.dart';

class RegistPage extends StatelessWidget {
  RegistPage({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Nakwon'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(color: Colors.grey[300]),
                ),
                Container(
                  width: 220,
                  height: 240,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
