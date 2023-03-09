import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:migrant_law_solutionchallenge/const/color.dart';
import 'package:http/http.dart' as http;

import '../const/api.dart';
import '../service/model/services.dart';

class LaborDetailScreen extends StatefulWidget {
  const LaborDetailScreen({Key? key}) : super(key: key);

  @override
  State<LaborDetailScreen> createState() => _LaborDetailScreenState();
}

class _LaborDetailScreenState extends State<LaborDetailScreen> {
  final subTextStyle = TextStyle(
      color: SECONDARY_COLOR1, fontSize: 23, fontWeight: FontWeight.w800);

  final mainTextStyle = TextStyle(
      color: PRIMARY_COLOR, fontSize: 23, fontWeight: FontWeight.w800);

  static String endPointUrl = API().getLaborUrl();
  final Uri url = Uri.parse(endPointUrl);
  late Future<Services> services;

  Future<Services> fetchData() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Services.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Services..");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    services = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BODY_TEXT_COLOR,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BODY_TEXT_COLOR,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: PRIMARY_COLOR),
              hintText: 'Search...',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 10.0, left: 15.0, right: 15.0, bottom: 0),
        child: FutureBuilder<Services>(
          future: services,
          builder: (context, snapshot) {
            // 에러 수신 시 에러 메시지 출력
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // 상태처리 인디케이터 표시. 앱 초기에 출력
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Scrollbar(
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Text(
                        snapshot.data!.empty.purple.purple.cdata,
                        style: subTextStyle,
                      ),
                      const SizedBox(height: 3.0),
                      Text(
                        "시행일자 : ${snapshot.data!.empty.purple.tentacled.text.toString()}",
                        style: subTextStyle.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.empty.indigo.empty.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              const SizedBox(height: 35.0),
                              Text(
                                  "제 2장 최저임금",
                                  style: mainTextStyle.copyWith(fontSize: 19.0)),
                              // if(snapshot.data?.empty.indigo.empty[index].fluffy.text == null ) {
                              //
                              // },
                              const SizedBox(height: 25.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "제${snapshot.data?.empty.indigo.empty[index].fluffy.text}장(${snapshot.data?.empty.indigo.empty[index].ambitious?.cdata ?? ""})",
                                    style: subTextStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(height: 2.0),
                                  Text(
                                    "${snapshot.data!.empty.indigo.empty[index].purple.cdata}",
                                    style: TextStyle(
                                      color: CupertinoColors.darkBackgroundGray,
                                      fontSize: 14.0,
                                    ),
                                  ),

                                ],
                              )
                            ],
                          );
                        },
                        shrinkWrap: true,
                      )
                    ],
                  ),
                ],
              )),
            );
          },
        ),
      ),
    );
  }
}
