import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_translator/google_translator.dart';
import 'package:migrant_law_solutionchallenge/const/api/translate/translations.dart';
import 'package:migrant_law_solutionchallenge/const/color.dart';

import 'package:migrant_law_solutionchallenge/home_detail/search/model/search_law_model.dart';
import 'package:migrant_law_solutionchallenge/home_detail/search/screen/search_labor_detail_screen.dart';
import 'package:translator/translator.dart';

import '../../const/api.dart';
import 'package:http/http.dart' as http;

const List<Tab> tabs = <Tab>[
  Tab(text: '근로기준법'),
  Tab(text: '고용보험법'),
  Tab(text: '산재보험'),
  Tab(text: '퇴직급여법'),
  Tab(text: '임금채권보장법'),
  Tab(text: '남녀고용평등'),
];

// List<Tab> _translatedTabs = <Tab>[];

class HomeDetailPage extends StatefulWidget {
  final String searchText;

  const HomeDetailPage({
    Key? key,
    required this.searchText,
  }) : super(key: key);

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {

  final subTextStyle = const TextStyle(
      color: SECONDARY_COLOR1, fontSize: 23, fontWeight: FontWeight.w800);

  final mainTextStyle = const TextStyle(
      color: PRIMARY_COLOR, fontSize: 23, fontWeight: FontWeight.w800);

  int tapIndex = 0;
  bool changed = false;

  dynamic callAPI(int tab) {
    switch(tab) {
      case 0 :
        return API().getLaborSearchUrl(widget.searchText);
      case 1:
        return API().getEmploymentSearchUrl(widget.searchText);
      case 2:
        return API().getSafetySearchUrl(widget.searchText);
      case 3:
        return API().getRetirementSearchUrl(widget.searchText);
      case 4:
        return API().getWageSearchUrl(widget.searchText);
      case 5:
        return API().getEqualitySearchUrl(widget.searchText);
      default:
        return API().getEmploymentSearchUrl(widget.searchText);
    }
  }

  late Future<List<SearchLaw>> services;

  static String passURL = "";
  static String errorText = "";
  String toLanguage = chooseLanguage;

  GoogleTranslator translator = GoogleTranslator();

  void translate() {
    String text = 'OOPS! No Result...';
    translator.translate(text, to: toLanguage).then((result) {
      errorText = result.text;
    }).catchError((error) {
      print(error);
    });
  }

  Future<List<SearchLaw>> fetchData() async {

    print("widget.searchText : ${widget.searchText}");
    String endPointUrl = callAPI(tapIndex);
    passURL = endPointUrl;

    final Uri url = Uri.parse(endPointUrl);
    final response = await http.get(url);

    if (response.statusCode == 200 && !response.body.contains("message")) {
      return searchLawFromJson(response.body);
    } else if (response.body.contains("message")) {
      throw errorText;
    } else {
      throw Exception("Failed to load Services..");
    }
  }

  @override
  void initState() {
    super.initState();
    translate();
    callAPI(tapIndex);
    fetchData();
    services = fetchData();
  }

  @override
  void dispose() {// dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: Scaffold (
        backgroundColor: BODY_TEXT_COLOR,
          appBar: AppBar(
            title: Text("'${widget.searchText}' 검색결과").translate(),
            centerTitle: true,
            backgroundColor: PRIMARY_COLOR,
            bottom: buildTabBar(),
          ),
          body: searchFutureBuilder()),
    );
  }

  TabBar buildTabBar() {
    return TabBar(
      indicatorColor: BODY_TEXT_COLOR,
      labelColor: BODY_TEXT_COLOR,
      labelStyle: const TextStyle(
        fontFamily: "NotoSans",
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      isScrollable: true,
      tabs: tabs,
      onTap: (index) {
        tapIndex = index;
        setState(() {
          fetchData();
          services = fetchData();
        });
      },
    );
  }

  FutureBuilder<List<SearchLaw>> searchFutureBuilder() {
    return FutureBuilder<List<SearchLaw>>(
      future: services,
      builder: (context, snapshot) {
        // 에러 수신 시 에러 메시지 출력
        if (snapshot.hasError) {
          print("snapshot : $snapshot");
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/error.png",
                  // 이미지 꽉차게 적용하기
                  fit: BoxFit.cover,
                  height: 200.0,
                ),
                const SizedBox(height: 40.0),
                Text(
                  "${snapshot.error}",
                  style: const TextStyle(
                    fontFamily: "NotoSans",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }
        // 상태처리 인디케이터 표시. 앱 초기에 출력
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                PRIMARY_COLOR,
              ),
            ),
          );
        }
        return TabBarView(
          children: tabs.map(
            (Tab tab) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, position) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 2.0, top: 2.0, left: 2.0, right: 2.0),
                      child: InkWell(
                        onTap: () {
                          // 어떤 카드인지 식별 인덱스
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return SearchLawDetailScreen(
                                title: '${tab.text}',
                                api: passURL,
                                cardPosition: position);
                          }));
                        },
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Card(
                            color: BODY_TEXT_COLOR,
                            margin: const EdgeInsets.symmetric(vertical: 1.0),
                            elevation: 1,
                            child: Column(
                              children: [
                                // const Divider(color: Colors.black),
                                const SizedBox(height: 15.0),
                                Text(
                                  "${snapshot.data![position].jomunTitle}\n${snapshot.data![position].jomunContent}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'NotoSans',
                                    color: Color(0xFF212121),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ).translate(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
