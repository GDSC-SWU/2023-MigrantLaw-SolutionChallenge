import 'package:flutter/material.dart';
import 'package:google_translator/google_translator.dart';
import 'package:migrant_law_solutionchallenge/const/api/translate/translations.dart';
import 'package:migrant_law_solutionchallenge/const/color.dart';
import 'package:migrant_law_solutionchallenge/home/screen/home_sceen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

const textStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.w700,
  color: PRIMARY_COLOR,
);

List<String> languageCode = <String>[
  'zh-tw',
  'vi',
  'th',
  'uz',
  'en',
];

@immutable
class StartLanguageScreen extends StatefulWidget {
  const StartLanguageScreen({Key? key}) : super(key: key);

  @override
  State<StartLanguageScreen> createState() => _StartLanguageScreenState();
}

class _StartLanguageScreenState extends State<StartLanguageScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _header(),
              const SizedBox(height: 20.0),
              _Body(),
              const SizedBox(height: 30.0),
              const _bottom(),
            ],
          ),
        ),
      ),
    );
  }
}

class _header extends StatelessWidget {
  _header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/google_translate.png',
          width: 90,
          height: 90,
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 15.0),
        const Text(
          "번역할 언어를 선택해 주세요",
          style: textStyle,
        ).translate(),
        const SizedBox(height: 5.0),
        const Text(
          "＊언어를 선택하지 않을 시 자동으로 한국어가 적용됩니다＊",
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: PRIMARY_COLOR,
          ),
        ).translate(),
      ],
    );
  }
}


class _Body extends StatelessWidget {
  _Body({Key? key}) : super(key: key);

  final country = <String>[
    "中国",
    "Việt Nam",
    "ไทย",
    "O'zbekiston",
    "English",
  ];

  final imgList = <String>[
    'china.jpg',
    'vietnam.jpeg',
    'thailand.png',
    'uzbekistan.png',
    'USA.jpg'
  ];

  List<String> languageCode = <String>[
    'zh-tw',
    'vi',
    'th',
    'uz',
    'en',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LanguageCard(country: country[0], countryImg: imgList[0], page: 0),
          LanguageCard(country: country[1], countryImg: imgList[1], page: 1),
          LanguageCard(country: country[2], countryImg: imgList[2], page: 2),
          LanguageCard(country: country[3], countryImg: imgList[3], page: 3),
          LanguageCard(country: country[4], countryImg: imgList[4], page: 4),
        ],
      ),
    );
  }
}

class LanguageCard extends StatefulWidget {
  const LanguageCard({
    Key? key,
    required this.country,
    required this.countryImg,
    required this.page,
  }) : super(key: key);

  final String country;
  final String countryImg;
  final int page;

  @override
  State<LanguageCard> createState() => _LanguageCardState();
}

class _LanguageCardState extends State<LanguageCard> {
  List<bool> ifChecked = [false, false, false, false, false];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: ifChecked[selectedIndex] ? PRIMARY_COLOR : Colors.white,
      //     width: 1.0,
      //   ),
      //   borderRadius: BorderRadius.circular(5.0),
      // ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: ListTile(
            leading: Image.asset(
              'assets/images/country/${widget.countryImg}',
              height: 25.0,
              fit: BoxFit.cover,
            ),
            title: Text(
              widget.country,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () async {
              //await Translation.loadData();
              setState(() {
                selectedIndex = widget.page;
                chooseLanguage = languageCode[selectedIndex];
              });
              await Translation.saveData(languageCode[selectedIndex]);
              RestartWidget.restartApp(context);
            },
          ),
        ),
      ),
    );
  }
}

class _bottom extends StatelessWidget {
  const _bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          primary: PRIMARY_COLOR,
          textStyle: const TextStyle(
            color: BODY_TEXT_COLOR,
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
          ),
          padding: const EdgeInsets.all(10.0),
        ),
        child: const Text(
          "다음",
        ).translate(),
      ),
    );
  }
}
