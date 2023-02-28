import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:migrant_law_solutionchallenge/home/screen/home_detail_page.dart';
import '../../const/color.dart';
import '../widget/home_searchbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return SafeArea(
      child: Scaffold(
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
          titleTextStyle: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: PRIMARY_COLOR,
          ),
          foregroundColor: PRIMARY_COLOR,
          backgroundColor: BODY_TEXT_COLOR,
          title: const Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              "Law4you",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        backgroundColor: BODY_TEXT_COLOR,
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            const _Head(),
            const SizedBox(height: 20.0),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 23),
                  child: _Body(),
                ),
                const HomeSearchBar(),
              ],
            ),
            const SizedBox(height: 20.0),
            const _Bottom(),
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
    return Padding(
      padding: const EdgeInsets.only(
          right: 27.0, left: 27.0, top: 24.0, bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
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

class BlankContainer extends StatelessWidget {
  const BlankContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _Body extends StatelessWidget {
  _Body({Key? key}) : super(key: key);

  // 텍스트 스타일
  final textStyle = const TextStyle(
    color: Colors.black87,
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
  );

  final cardNameList = <String>[
    '근로기준법',
    '고용보험법',
    '산재보험',
    '퇴직급여법',
    '임금채권\n보장법',
    '남녀고용평등과\n일·가정 양입 지원',
  ];

  final imgList = <String>[
    'labor_standards.png',
    'employment_insurance.png',
    'safety_insurance.png',
    'retirement.png',
    'wage_claim.png',
    'equality.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: const BoxDecoration(
        color: SECONDARY_COLOR4,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 6.0),
        child: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          children: List.generate(
            6,
            (index) {
              return Card(
                color: SECONDARY_COLOR4,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return HomeDetailPage(
                        whatPage: index,
                      );
                    }));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/${imgList[index]}',
                          height: 35.0,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 6.0),
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
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 27.0, top: 7.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: const [
              Text(
                " 자주 찾아 보는 법률 ",
                style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Card(
                  color: Colors.white24,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card1 tapped.');
                    },
                    child: const SizedBox(
                      width: 196,
                      height: 128,
                      child: Text(''),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white24,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card2 tapped.');
                    },
                    child: const SizedBox(
                      width: 196,
                      height: 128,
                      child: Text(""),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
