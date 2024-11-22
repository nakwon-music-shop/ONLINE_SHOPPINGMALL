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
        : Container(
            width: double.infinity,
            height: 350,
            color: Colors.grey[300],
          );
  }
}
