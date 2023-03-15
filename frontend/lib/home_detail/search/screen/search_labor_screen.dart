import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:migrant_law_solutionchallenge/const/color.dart';

import '../../const/api.dart';
import '../../service/model/labor_services.dart';
import 'package:http/http.dart' as http;

const List<Tab> tabs = <Tab>[
  Tab(text: '근로기준법'),
  Tab(text: '고용보험법'),
  Tab(text: '산재보험'),
  Tab(text: '퇴직급여법'),
  Tab(text: '임금채권보장법'),
  Tab(text: '남녀고용평등'),
];

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

  static String endPointUrl = API().getLaborUrl();
  static String endPointSearchUrl = "$endPointUrl?q=폭행";

  final Uri url = Uri.parse(endPointSearchUrl);
  late Future<LaborServices> services;

  Future<LaborServices> fetchData() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(url);
      print(response.body);
      return LaborServices.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Services..");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    services = fetchData();
    print("endPointSearchUrl $endPointSearchUrl");
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
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
          }
        });
        return DefaultTabController(
          length: tabs.length,
          initialIndex: 0,
          child: Scaffold(
            appBar: AppBar(
              title: Text("'${widget.searchText}' 검색결과"),
              centerTitle: true,
              backgroundColor: PRIMARY_COLOR,
              bottom: const TabBar(
                indicatorColor: BODY_TEXT_COLOR,
                labelColor: BODY_TEXT_COLOR,
                labelStyle: TextStyle(
                  fontFamily: "NotoSans",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                isScrollable: true,
                tabs: tabs,
              ),
            ),
            body: FutureBuilder<LaborServices>(
              future: services,
              builder: (context, snapshot) {
                // 에러 수신 시 에러 메시지 출력
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
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
                  children: tabs.map((Tab tab) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                      child: ListView.builder(
                        itemCount: tabs.length,
                        itemBuilder: (context, position) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: InkWell(
                              onTap: () {
                                // 어떤 카드인지 식별 인덱스
                                print(position);
                              },
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Card(
                                  margin: const EdgeInsets.symmetric(vertical: 1.0),
                                  elevation: 0,
                                  child: Column(
                                    children: [
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
            ),
          ),
        );
      }),
    );
  }
}
