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
                  height: 250,
                  decoration: BoxDecoration(color: Colors.grey[300]),
                ),
                Container(
                  width: 200,
                  height: 200,
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
