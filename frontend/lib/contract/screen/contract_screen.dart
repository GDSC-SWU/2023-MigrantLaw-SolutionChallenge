import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../const/color.dart';
import '../Utils/image_cropper_page.dart';
import '../Utils/image_picker_class.dart';
import '../screen/recognization_page.dart';


class ContractSceen extends StatelessWidget {
  const ContractSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BODY_TEXT_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: 80.0,
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Top(),
                const SizedBox(height: 50.0),
                _Body(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "계약서 알아보기",
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          "어떤걸 원하나요?",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Card(
          color: Color(0x82043F99),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            splashColor: SECONDARY_COLOR1.withAlpha(30),
            onTap: () {
              log("Gallery");
              pickImage(source: ImageSource.gallery).then((value) {
                if (value != '') {
                  imageCropperView(value, context).then((value) {
                    if (value != '') {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => RecognizePage(
                            path: value,
                          ),
                        ),
                      );
                    }
                  });
                }
              });
            },
            child: const SizedBox(
              width: 230,
              height: 150,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 60.0,
                ),
                child: Text(
                  "계약서 사진 업로드",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: BODY_TEXT_COLOR,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Card(
          color: Color(0x82043F99),
          clipBehavior: Clip.antiAlias,
          child: ElevatedButton(
            onPressed: () async {
              log("Camera");
              pickImage(source: ImageSource.camera).then((value) {
                if (value != '') {
                  imageCropperView(value, context).then((value) {
                    if (value != '') {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => RecognizePage(
                            path: value,
                          ),
                        ),
                      );
                    }
                  });
                }
              });
              // await availableCameras().then((value) => Navigator.push(context,
              //     MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
            },
            // InkWell(
            //   splashColor: SECONDARY_COLOR1.withAlpha(30),
            //   onTap: () {
            //     debugPrint('촬영 tapped.');
            //   },
            child: const SizedBox(
              width: 230,
              height: 150,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 35.0,
                ),

                child: Text(
                  "계약서 촬영해서 알아보기",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: BODY_TEXT_COLOR,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            ),
          ),
        ),
      ],
    );
  }
}