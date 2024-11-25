import 'package:flutter/material.dart';

class InfoTextfield extends StatefulWidget {
  String data;
  var textFieldResult;
  void Function(TextEditingController tec) onTextChanged;

  InfoTextfield(
      {super.key,
      required this.data,
      required this.textFieldResult,
      required this.onTextChanged});

  @override
  State<InfoTextfield> createState() => _InfoTextfieldState();
}

class _InfoTextfieldState extends State<InfoTextfield> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.data,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: textController,
            onChanged: (value) {
              widget.onTextChanged(textController);
            },
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(width: 1.0, color: Colors.grey[300]!))),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
