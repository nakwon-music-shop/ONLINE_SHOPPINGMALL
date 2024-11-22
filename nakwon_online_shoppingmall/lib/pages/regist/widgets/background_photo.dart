import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class BackgroundPhoto extends StatelessWidget {
  const BackgroundPhoto({
    super.key,
    required this.image,
  });

  final XFile? image;

  @override
  Widget build(BuildContext context) {
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
}
