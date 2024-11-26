import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nakwon_online_shoppingmall/pages/regist/widgets/background_photo.dart';
import 'package:nakwon_online_shoppingmall/pages/regist/widgets/info_textField.dart';
import 'package:nakwon_online_shoppingmall/pages/regist/widgets/jaket_photo_button.dart';
import 'package:nakwon_online_shoppingmall/pages/regist/widgets/regist_button.dart';

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
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: Colors.white), // 뒤로가기 버튼 색상 화이트로 설정
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
      body: Column(
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
          RegistButton(image: image, widget: widget)
        ],
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
