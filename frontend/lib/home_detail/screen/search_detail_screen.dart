import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:migrant_law_solutionchallenge/const/color.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: '근로기준법'),
  Tab(text: '고용보험법'),
  Tab(text: '산재보험'),
  Tab(text: '퇴직급여법'),
  Tab(text: '임금채권보장법'),
  Tab(text: '남녀고용평등'),
];

class HomeDetailPage extends StatefulWidget {
  final int whatPage;

  const HomeDetailPage({
    Key? key,
    required this.whatPage,
  }) : super(key: key);

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return DefaultTabController(
          length: tabs.length,
          initialIndex: widget.whatPage,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: PRIMARY_COLOR,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                )
              ],
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
            body: TabBarView(
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
                                margin: EdgeInsets.symmetric(vertical: 1.0),
                                elevation: 0,
                                child: Text(
                                  "$position",
                                  style: const TextStyle(
                                      color: BODY_TEXT_COLOR2,
                                      fontFamily: "NotoSans",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ));
              }).toList(),
            ),
          ),
        );
      }),
    );
  }
}
