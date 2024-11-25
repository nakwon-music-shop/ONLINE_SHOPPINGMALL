import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class JaketPhotoButton extends StatefulWidget {
  JaketPhotoButton({super.key, this.image, required this.getImagePickerData});

  XFile? image;
  void Function() getImagePickerData;
  @override
  State<JaketPhotoButton> createState() => _JaketPhotoButtonState();
}

class _JaketPhotoButtonState extends State<JaketPhotoButton> {
  @override
  Widget build(BuildContext context) {
    return widget.image != null
        // 업로드한 이미지가 존재하면 이미지 출력
        ? GestureDetector(
            onTap: () {
              widget.getImagePickerData();
            },
            child: SizedBox(
              width: 220,
              height: 240,
              child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.file(File(widget.image!.path))),
            ),
          )
        // 이미지를 업로드하지 않았으면 회색 박스 출력
        : GestureDetector(
            onTap: () {
              widget.getImagePickerData();
            },
            child: Container(
              width: 220,
              height: 240,
              color: Colors.grey[300],
              child: Icon(
                Icons.photo_camera,
                size: 50,
                color: Colors.grey[700],
              ),
            ),
          );
  }
}
