import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nakwon_online_shoppingmall/album.dart';
import 'dart:io';
import 'package:nakwon_online_shoppingmall/pages/regist/widgets/background_photo.dart';
import 'package:nakwon_online_shoppingmall/pages/regist/widgets/info_textField.dart';
import 'package:nakwon_online_shoppingmall/pages/regist/widgets/jaket_photo_button.dart';

class RegistPage extends StatefulWidget {
  RegistPage({super.key});
  String? song;
  String? artist;
  int? price;
  String? description;

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  XFile? image; // 업로드하는 이미지를 저장하는 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'NakWon',
          style: TextStyle(
              fontFamily: "Inter-Italic",
              fontWeight: FontWeight.w100,
              color: Colors.white),
        ),
      ),
      // 상품 이미지가 들어가는 부분
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            // 이미지 업로드 영역
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
            const SizedBox(
              height: 20,
            ),
            // 상품 정보를 입력하는 scrollView
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  // 가수 입력 영역
                  InfoTextfield(
                    data: '가수',
                    textFieldResult: widget.artist,
                    onTextChanged: onArtistChanged,
                  ),
                  // 상품명 입력 영역
                  InfoTextfield(
                    data: '상품명',
                    textFieldResult: widget.song,
                    onTextChanged: onSongChanged,
                  ),
                  // 상품 가격 입력 영역
                  InfoTextfield(
                    data: '상품 가격',
                    textFieldResult: widget.price,
                    onTextChanged: onPriceChanged,
                  ),
                  // 상품 설명 입력 영역
                  InfoTextfield(
                    data: '상품 설명',
                    textFieldResult: widget.description,
                    onTextChanged: onDescriptionChanged,
                  ),
                ],
              ),
            )),
            // 상품 등록하기 버튼
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (widget.song != null &&
                        widget.artist != null &&
                        widget.price != null &&
                        widget.description != null) {
                      Navigator.pop(
                          context,
                          Album(
                              imagePath: image!.path,
                              song: widget.song!,
                              artist: widget.artist!,
                              price: widget.price!,
                              description: widget.description!));
                    } else {
                      showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                                title: Text('정보를 빠짐없이 입력해주세요.'),
                                actions: <CupertinoDialogAction>[
                                  CupertinoDialogAction(
                                    isDefaultAction: true,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      '확인',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  )
                                ],
                              ));
                    }
                  },
                  child: Text('상품 등록하기')),
            )
          ],
        ),
      ),
    );
  }

  // ImagePicker
  Future<void> getImagePickerData() async {
    ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  // 상품명 setState
  void onSongChanged(TextEditingController tec) {
    setState(() {
      widget.song = tec.text;
    });
  }

  // 가수 setState
  void onArtistChanged(TextEditingController tec) {
    setState(() {
      widget.artist = tec.text;
    });
  }

  // 가격 setState
  void onPriceChanged(TextEditingController tec) {
    setState(() {
      widget.price = int.parse(tec.text);
    });
  }

  // 상품 설명 setState
  void onDescriptionChanged(TextEditingController tec) {
    setState(() {
      widget.description = tec.text;
    });
  }
}
