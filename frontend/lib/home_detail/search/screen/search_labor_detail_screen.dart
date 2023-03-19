import 'package:flutter/material.dart';

import '../../../const/color.dart';
import '../model/search_law_model.dart';
import 'package:http/http.dart' as http;

class SearchLawDetailScreen extends StatefulWidget {
  final String title;
  final dynamic api;
  final int cardPosition;

  const SearchLawDetailScreen({
    Key? key,
    required this.title,
    required this.cardPosition,
    this.api,
  }) : super(key: key);

  @override
  State<SearchLawDetailScreen> createState() => _SearchLawDetailScreenState();
}

class _SearchLawDetailScreenState extends State<SearchLawDetailScreen> {
  final subTextStyle = const TextStyle(
      color: PRIMARY_COLOR, fontSize: 16, fontWeight: FontWeight.w700);

  final mainTextStyle = const TextStyle(
      color: SECONDARY_COLOR1, fontSize: 22, fontWeight: FontWeight.w800);

  late Future<List<SearchLaw>> services;
  late String passURL;

  Future<List<SearchLaw>> fetchData() async {
    String endPointUrl = passURL;
    // print("fetchData passURL : $passURL");
    final Uri url = Uri.parse(endPointUrl);

    final response = await http.get(url);
    print("response.body : ${response.body}");

    if (response.statusCode == 200) {
      return searchLawFromJson(response.body);
    } else {
      throw Exception("Failed to load Services..");
    }
  }

  @override
  void initState() {
    super.initState();
    passURL = widget.api;
    fetchData();
    services = fetchData();
  }

  @override
  void dispose() {
    // dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
          title: Text(widget.title),
        ),
        body: FutureBuilder<List<SearchLaw>>(
          future: services,
          builder: (context, snapshot) {
            // 에러 수신 시 에러 메시지 출력
            if (snapshot.hasError) {
              print("snapshot : $snapshot");
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
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, position) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: 4.0, top: 4.0, left: 2.0, right: 2.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // const Divider(color: Colors.black),
                          const SizedBox(height: 6.0),
                          Text(
                            snapshot.data![widget.cardPosition].jomunTitle,
                            style: mainTextStyle,
                          ),
                          const SizedBox(height: 2.0),
                          Text(
                            "시행일자 : ${snapshot.data![widget.cardPosition].jomunStartDay}",
                            style: mainTextStyle.copyWith(fontSize: 14.0),
                          ),
                          const SizedBox(height: 25.0),
                          Text(
                            snapshot.data![widget.cardPosition].jomunContent,
                            style: subTextStyle,
                          ),
                          const SizedBox(height: 15.0),
                          if (snapshot.data![widget.cardPosition].hang.length != 0) ...[
                            for (int i = 0;
                                i < snapshot.data![widget.cardPosition].hang.length;
                                i++) ...[
                              if (snapshot.data![widget.cardPosition]
                                      .hang[i]?["항내용"] !=
                                  null) ...[
                                Text(snapshot.data![widget.cardPosition]
                                        .hang[i]?["항내용"]["_cdata"]
                                        .toString() ?? "")
                              ],
                            ],
                          ],
                          if (snapshot.data![widget.cardPosition].jomunReference != "")...[
                            const SizedBox(height: 2.0),
                            Text(snapshot.data![widget.cardPosition].jomunReference)
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ));
  }
}
