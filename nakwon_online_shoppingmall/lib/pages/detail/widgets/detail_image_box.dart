import 'dart:io';
import 'package:flutter/material.dart';

class DetailImageBox extends StatelessWidget {
  String imagePath;
  DetailImageBox(this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return imagePath.startsWith('assets')
        ? FittedBox(
            fit: BoxFit.cover,
            clipBehavior: Clip.hardEdge,
            child: Image.asset(imagePath))
        : FittedBox(
            fit: BoxFit.cover,
            clipBehavior: Clip.hardEdge,
            child: Image.file(File(imagePath)));
  }
}
