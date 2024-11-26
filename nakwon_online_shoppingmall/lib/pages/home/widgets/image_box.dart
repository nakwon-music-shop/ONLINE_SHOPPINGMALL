import 'dart:io';
import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  String imagePath;
  ImageBox(this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return imagePath.startsWith('assets')
        ? Image.asset(imagePath)
        : Image.file(File(imagePath));
  }
}
