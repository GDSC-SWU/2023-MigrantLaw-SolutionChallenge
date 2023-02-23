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
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.language)),
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
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      backgroundColor: BODY_TEXT_COLOR,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 70.0),
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  _Body({Key? key}) : super(key: key);

  @override
  // 텍스트 스타일
  final textStyle = TextStyle(
    color: BODY_TEXT_COLOR,
    fontSize: 18.0,
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

  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      children: List.generate(
        6,
            (index) {
          return Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                  return HomeDetailPage(whatPage: index,);
                }));
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: PRIMARY_COLOR,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.all(5.0),
                child: Text(
                  cardNameList[index],
                  textAlign: TextAlign.center,
                  style: textStyle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
