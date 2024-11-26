import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nakwon_online_shoppingmall/album.dart';
import 'package:nakwon_online_shoppingmall/pages/regist/regist_page.dart';

class RegistButton extends StatelessWidget {
  const RegistButton({
    super.key,
    required this.image,
    required this.widget,
  });

  final XFile? image;
  final RegistPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            // 데이터를 모두 입력한 경우
            if (image != null &&
                widget.song != null &&
                widget.artist != null &&
                widget.price != null &&
                widget.description != null) {
              // 등록 여부 확인 alert
              showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                        title: Text('상품을 등록하시겠습니까?'),
                        actions: <CupertinoDialogAction>[
                          // 취소 버튼
                          CupertinoDialogAction(
                            isDestructiveAction: true,
                            textStyle: TextStyle(color: Colors.redAccent),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('취소'),
                          ),
                          // 확인 버튼
                          CupertinoDialogAction(
                              isDefaultAction: true,
                              textStyle: TextStyle(color: Colors.black),
                              onPressed: () {
                                Navigator.pop(context);
                                // Album 객체 생성해서 pop
                                Navigator.pop(
                                    context,
                                    Album(
                                        imagePath: image!.path,
                                        song: widget.song!,
                                        artist: widget.artist!,
                                        price: widget.price!,
                                        description: widget.description!));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('상품을 등록하였습니다'),
                                  ),
                                );
                              },
                              child: Text('확인'))
                        ],
                      ));

              // 데이터를 모두 입력하지 않은 경우 경고문 출력
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
    );
  }
}
