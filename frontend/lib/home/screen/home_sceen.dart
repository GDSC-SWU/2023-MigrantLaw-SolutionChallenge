import 'package:flutter/material.dart';
import 'package:migrant_law_solutionchallenge/home/screen/home_detail_page.dart';
import '../../const/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              print("language icon clicked");
            },
            icon: const Icon(Icons.language),
          ),
        ],
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: PRIMARY_COLOR,
        ),
        foregroundColor: PRIMARY_COLOR,
        backgroundColor: BODY_TEXT_COLOR,
        title: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: const Text(
            "Law4You",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      backgroundColor: BODY_TEXT_COLOR,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 60.0),
        child: Column(
          children: [
            _Head(),
            SizedBox(height: 20.0),
            _Body(),
            SizedBox(height: 20.0),
            _Bottom(),
          ],
        ),
      ),
    );
  }
}

class _Head extends StatelessWidget {
  const _Head({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Hello\nmy neighbor",
            style: TextStyle(
              color: PRIMARY_COLOR,
              fontSize: 40.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  _Body({Key? key}) : super(key: key);

  @override
  // 텍스트 스타일
  final textStyle = TextStyle(
    color: PRIMARY_COLOR,
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
  );

  final cardNameList = <String>[
    '근로기준법',
    '고용보험법',
    '산재보험',
    '퇴직급여법',
    '남고용평등법',
    '임금채권보장법',
  ];

  final imgList = <String> [
    'labor_standards.png',
    'employment_insurance.png',
    'safety_insurance.png',
    'retirement.png',
    'equality.png',
    'wage_claim.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BODY_TEXT_COLOR,
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        children: List.generate(
          6,
          (index) {
            return Card(
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return HomeDetailPage(
                      whatPage: index,
                    );
                  }));
                },
                child: Container(
                  alignment: Alignment.center,
                  //width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(5.0),
                  width: 100.00,
                  height: 100.00,
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/${imgList[index]}',
                          height: 35.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        cardNameList[index],
                        textAlign: TextAlign.center,
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              " 자주 찾아보는 법률 ",
              style: TextStyle(
                color: PRIMARY_COLOR,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    );
  }
}
