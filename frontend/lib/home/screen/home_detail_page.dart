import 'package:flutter/material.dart';
import 'package:migrant_law_solutionchallenge/const/color.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: '근로'),
  Tab(text: '고용 보험'),
  Tab(text: '산재'),
  Tab(text: '퇴직금'),
  Tab(text: '폭력'),
  Tab(text: '임금 채권'),
];

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({Key? key}) : super(key: key);

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  @override
  Widget build(BuildContext context) {
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
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: PRIMARY_COLOR,
            actions: [
              IconButton(
                onPressed: () {

                },
                icon: Icon(Icons.search),
              )
            ],
            bottom: const TabBar(
              indicatorColor: BODY_TEXT_COLOR,
              isScrollable: true,
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            children: tabs.map((Tab tab) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.builder(
                    itemCount: tabs.length,
                    itemBuilder: (context, position) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: InkWell(
                          onTap: () {
                            print(position);
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Card(
                              margin: EdgeInsets.all(1),
                              elevation: 0.5,
                              child: Text(
                                "$position",
                                style: TextStyle(
                                    fontFamily: "NotoSans",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ));
            }).toList(),
          ),
        );
      }),
    );
  }
}
