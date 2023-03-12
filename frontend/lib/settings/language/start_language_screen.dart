import 'package:flutter/material.dart';
import 'package:migrant_law_solutionchallenge/const/color.dart';

const textStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.w700,
  color: PRIMARY_COLOR,
);

class StartLanguageScreen extends StatelessWidget {
  const StartLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 150.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const _header(),
            const SizedBox(height: 20.0),
            _Body(),
            // const SizedBox(height: 40.0),
            //_bottom(),
          ],
        ),
      ),
    );
  }
}

class _header extends StatelessWidget {
  const _header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/google_translate.png',
            width: 100, height: 100, fit: BoxFit.fill),
        const SizedBox(height: 15.0),
        const Text(
          "번역할 언어를 선택해 주세요",
          style: textStyle,
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {
  _Body({Key? key}) : super(key: key);

  final country = <String>["중국어", "베트남", "태국", "우즈베키스탄", "필리핀"];

  final imgList = <String>[
    'china.jpg',
    'philippines.jpeg',
    'thailand.png',
    'uzbekistan.png',
    'vietnam.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LanguageCard(
            country: country[0],
            countryImg: imgList[0],
            page: 0,
          ),
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
  int slectedIndex = 0;

  final textStyle = const TextStyle(
    color: PRIMARY_COLOR,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 45.0),
        child: ListTile(
          leading: Image.asset(
            'assets/images/country/${widget.countryImg}',
            height: 25.0,
            fit: BoxFit.cover,
          ),
          title: Text(
            widget.country,
            style: textStyle,
          ),
          onTap: () {
            setState(() {
              slectedIndex = widget.page;
            });
          },
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
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ElevatedButton(
        onPressed: () {},
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
        ),
      ),
    );
  }
}
