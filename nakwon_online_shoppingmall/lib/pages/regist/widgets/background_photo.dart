import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class BackgroundPhoto extends StatelessWidget {
  XFile? image;
  BackgroundPhoto({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return image != null
        // 업로드한 이미지가 존재하면 이미지 출력
        ? Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(image!.path), fit: BoxFit.fill),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
            ),
          )
        // 이미지를 업로드하지 않았으면 회색 박스 출력
        : Container(
            width: double.infinity,
            height: 350,
            color: Colors.grey[300],
          );
  }
}
