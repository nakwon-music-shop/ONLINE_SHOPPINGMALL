import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:nakwon_online_shoppingmall/pages/regist/widgets/background_photo.dart';
import 'package:nakwon_online_shoppingmall/pages/regist/widgets/jaket_photo_button.dart';

class RegistPage extends StatefulWidget {
  RegistPage({super.key});

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  XFile? image;

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              BackgroundPhoto(
                image: image,
              ),
              JaketPhotoButton(
                image: image,
                getImagePickerData: getImagePickerData,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> getImagePickerData() async {
    ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }
}
