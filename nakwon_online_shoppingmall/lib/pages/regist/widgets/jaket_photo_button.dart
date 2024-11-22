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
        : GestureDetector(
            onTap: () {
              widget.getImagePickerData();
            },
            child: Container(
              width: 220,
              height: 240,
              color: Colors.grey[300],
            ),
          );
  }
}
