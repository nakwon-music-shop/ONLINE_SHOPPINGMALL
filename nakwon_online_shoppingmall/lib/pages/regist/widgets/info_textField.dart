import 'package:flutter/material.dart';

class InfoTextfield extends StatelessWidget {
  String data;

  InfoTextfield({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              data,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(width: 1.0, color: Colors.grey[300]!))),
          ),
          // Container(
          //   decoration: BoxDecoration(
          //       border: Border.all(color: Colors.grey[300]!),
          //       borderRadius: BorderRadius.circular(10)),
          //   child: TextField(),
          // ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
