import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceTextfield extends StatefulWidget {
  String data;
  var textFieldResult;
  void Function(TextEditingController tec) onTextChanged;

  PriceTextfield(
      {super.key,
      required this.data,
      required this.textFieldResult,
      required this.onTextChanged});

  @override
  State<PriceTextfield> createState() => _PriceTextfieldState();
}

class _PriceTextfieldState extends State<PriceTextfield> {
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
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
            ],
            controller: textController,
            onChanged: (value) {
              widget.onTextChanged(textController);
            },
            decoration: InputDecoration(
                labelText: widget.data,
                labelStyle: TextStyle(color: Colors.grey[500]),
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
