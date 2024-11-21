import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegistPage extends StatefulWidget {
  RegistPage({super.key});

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  XFile? image;

  Future<void> getImagePickerData() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  Widget backgroundPhoto() {
    return image != null
        ? SizedBox(
            width: double.infinity,
            height: 350,
            child: FittedBox(
                fit: BoxFit.fill,
                child: Image.file(File(image!.path))), //가져온 이미지를 화면에 띄워주는 코드
          )
        : Container(
            width: double.infinity,
            height: 350,
            color: Colors.grey[300],
          );
  }

  Widget backgroundPhotoButton() {
    return image != null
        ? GestureDetector(
            onTap: () {
              getImagePickerData();
            },
            child: SizedBox(
              width: 220,
              height: 240,
              child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.file(File(image!.path))), //가져온 이미지를 화면에 띄워주는 코드
            ),
          )
        : GestureDetector(
            onTap: () {
              getImagePickerData();
            },
            child: Container(
              width: 220,
              height: 240,
              color: Colors.grey[300],
            ),
          );
  }

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
          Stack(
            alignment: Alignment.center,
            children: [
              backgroundPhoto(),
              backgroundPhotoButton(),
            ],
          ),
        ],
      ),
    );
  }
}
