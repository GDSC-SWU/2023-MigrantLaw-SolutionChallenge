import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const/color.dart';
import '../const/api.dart';
import '../service/model/employment_services.dart';
import 'package:http/http.dart' as http;

class EmploymentDetailScreen extends StatefulWidget {
  const EmploymentDetailScreen({Key? key}) : super(key: key);

  @override
  State<EmploymentDetailScreen> createState() => _EmploymentDetailScreenState();
}

class _EmploymentDetailScreenState extends State<EmploymentDetailScreen> {
  final subTextStyle = const TextStyle(
      color: SECONDARY_COLOR1, fontSize: 23, fontWeight: FontWeight.w800);

  final mainTextStyle = const TextStyle(
      color: PRIMARY_COLOR, fontSize: 23, fontWeight: FontWeight.w800);

  static String endPointUrl = API().getEmploymentUrl();
  final Uri url = Uri.parse(endPointUrl);

  late Future<EmploymentServices> services;

  bool _showBackToTopButton = false;

  // scroll controller
  late ScrollController _scrollController;

  Future<EmploymentServices> fetchData() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return EmploymentServices.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Services..");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    services = fetchData();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 1000) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  // This function is triggered when the user presses the back-to-top button
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 3), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BODY_TEXT_COLOR,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BODY_TEXT_COLOR,
        iconTheme: const IconThemeData(
            color: PRIMARY_COLOR
        ),
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
            top: 0.0, left: 15.0, right: 15.0, bottom: 0.0),
        child: FutureBuilder<EmploymentServices>(
          future: services,
          builder: (context, snapshot) {
            // ?????? ?????? ??? ?????? ????????? ??????
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // ???????????? ??????????????? ??????. ??? ????????? ??????
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    PRIMARY_COLOR,
                  ),
                ),
              );
            }
            return Scrollbar(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 5.0),
                        Text(
                          snapshot.data!.empty.purple.tentacled.cdata,
                          style: subTextStyle,
                        ),
                        const SizedBox(height: 3.0),
                        Text(
                          "???????????? : ${snapshot.data!.empty.purple.cunning.text}",
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
                                const SizedBox(height: 25.0),
                                // const SizedBox(height: 10.0),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    if (snapshot.data?.empty.indigo.empty[index]
                                            .ambitious?.cdata ==
                                        null) ...[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 50.0),
                                        child: Text(
                                            snapshot.data!.empty.indigo
                                                .empty[index].purple.cdata,
                                            style: mainTextStyle.copyWith(
                                                fontSize: 19.0)),
                                      ),
                                    ] else ...[
                                      Text(
                                        "???${snapshot.data?.empty.indigo.empty[index].fluffy.text}???(${snapshot.data?.empty.indigo.empty[index].ambitious?.cdata})",
                                        style: subTextStyle.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        snapshot.data!.empty.indigo.empty[index]
                                            .purple.cdata,
                                        style: const TextStyle(
                                          color: CupertinoColors
                                              .darkBackgroundGray,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                      if (snapshot.data!.empty.indigo
                                              .empty[index].magenta !=
                                          null) ...[
                                        for (int i = 0;
                                            i <
                                                snapshot
                                                    .data!
                                                    .empty
                                                    .indigo
                                                    .empty[index]
                                                    .magenta
                                                    .length;
                                            i++) ...[
                                          const SizedBox(height: 4.0),
                                          if (snapshot
                                                  .data!
                                                  .empty
                                                  .indigo
                                                  .empty[index]
                                                  .magenta[i]?["?????????"] !=
                                              null) ...[
                                            Text(snapshot
                                                    .data!
                                                    .empty
                                                    .indigo
                                                    .empty[index]
                                                    .magenta[i]?["?????????"]
                                                        ["_cdata"]
                                                    .toString() ??
                                                ""),
                                          ],
                                          const SizedBox(height: 4.0),
                                          if (snapshot
                                                  .data!
                                                  .empty
                                                  .indigo
                                                  .empty[index]
                                                  .magenta[i]?["???"] !=
                                              null) ...[
                                            for (int j = 0;
                                                j <
                                                    snapshot
                                                        .data!
                                                        .empty
                                                        .indigo
                                                        .empty[index]
                                                        .magenta[i]?["???"]
                                                        ?.length;
                                                j++) ...[
                                              Text(snapshot
                                                          .data!
                                                          .empty
                                                          .indigo
                                                          .empty[index]
                                                          .magenta[i]?["???"][j]
                                                      ["?????????"]["_cdata"] ??
                                                  ""),
                                              const SizedBox(height: 4.0),
                                            ]
                                          ],
                                        ],
                                      ] else
                                        ...[],
                                      const SizedBox(height: 2.0),
                                      if (snapshot.data!.empty.indigo
                                              .empty[index].cunning?.cdata !=
                                          null) ...[
                                        Text(
                                          "?????? ?????? ?????? : ${snapshot.data!.empty.indigo.empty[index].cunning?.cdata}",
                                          style: const TextStyle(
                                            color: CupertinoColors
                                                .darkBackgroundGray,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ],
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
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: PRIMARY_COLOR.withOpacity(0.9),
              child: const Icon(Icons.arrow_upward, color: BODY_TEXT_COLOR)),
    );
  }
}
