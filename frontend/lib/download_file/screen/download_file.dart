import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:migrant_law_solutionchallenge/const/color.dart';

class DownloadFileScreen extends StatelessWidget {
  const DownloadFileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
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
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SafeArea(
                child: Text("an unknown\namount of content\n goes here in the header"),
              ),
            ),
            SliverToBoxAdapter(
              child: TabBar(
                tabs: [
                  Tab(child: Text('Days', style: TextStyle(color: Colors.black))),
                  Tab(child: Text('Months', style: TextStyle(color: Colors.black))),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  ListView(
                    children: <Widget>[
                      ListTile(title: Text('Sunday 1')),
                      ListTile(title: Text('Monday 2')),
                      ListTile(title: Text('Tuesday 3')),
                      ListTile(title: Text('Wednesday 4')),
                      ListTile(title: Text('Thursday 5')),
                      ListTile(title: Text('Friday 6')),
                      ListTile(title: Text('Saturday 7')),
                      ListTile(title: Text('Sunday 8')),
                      ListTile(title: Text('Monday 9')),
                      ListTile(title: Text('Tuesday 10')),
                      ListTile(title: Text('Wednesday 11')),
                      ListTile(title: Text('Thursday 12')),
                      ListTile(title: Text('Friday 13')),
                      ListTile(title: Text('Saturday 14')),
                    ],
                  ),
                  ListView(
                    children: <Widget>[
                      ListTile(title: Text('January')),
                      ListTile(title: Text('February')),
                      ListTile(title: Text('March')),
                      ListTile(title: Text('April')),
                      ListTile(title: Text('May')),
                      ListTile(title: Text('June')),
                      ListTile(title: Text('July')),
                      ListTile(title: Text('August')),
                      ListTile(title: Text('September')),
                      ListTile(title: Text('October')),
                      ListTile(title: Text('November')),
                      ListTile(title: Text('December')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}