import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class JaketPhotoButton extends StatefulWidget {
  const JaketPhotoButton({
    super.key,
    required this.image,
  });

  final XFile? image;

  @override
  State<JaketPhotoButton> createState() => _JaketPhotoButtonState();
}

class _JaketPhotoButtonState extends State<JaketPhotoButton> {
  Future<void> getImagePickerData(XFile? image) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.image != null
        ? GestureDetector(
            onTap: () {
              getImagePickerData(widget.image);
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
              getImagePickerData(widget.image);
            },
            child: Container(
              width: 220,
              height: 240,
              color: Colors.grey[300],
            ),
          );
  }
}
