import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_translator/google_translator.dart';
import 'package:migrant_law_solutionchallenge/const/color.dart';

import '../../main.dart';
import '../api/pdf_api.dart';
import 'pdfViewerPage_ko.dart';

class DownloadFileScreen extends StatelessWidget {
  const DownloadFileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {
                RestartWidget.restartApp(context);
              },
              icon: const Icon(Icons.language),
            ),
          ],
          foregroundColor: PRIMARY_COLOR,
          backgroundColor: Colors.white12,
          title: const Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              "Lawpedia",
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 45.0),
                  Row(
                    children: [
                      const Text(
                        "  honey tip! ",
                        style: TextStyle(
                          color: PRIMARY_COLOR,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ).translate(),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  // Row(
                  //   children: [
                  //     const Text(
                  //       "      노동자권리수첩 pdf ",
                  //       style: TextStyle(
                  //         color: PRIMARY_COLOR,
                  //         fontSize: 13.0,
                  //         fontWeight: FontWeight.w400,
                  //       ),
                  //     ).translate(),
                  //   ],
                  // ),
                  // const SizedBox(height: 3.0),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 23),
                        child: _Body(),
                      ),
                    ],
                  ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: [
                  //       Card(
                  //         color: Colors.white24,
                  //         clipBehavior: Clip.hardEdge,
                  //         child: InkWell(
                  //           splashColor: Colors.blue.withAlpha(30),
                  //           onTap: () {
                  //             debugPrint('Card1 tapped.');
                  //           },
                  //           child: const SizedBox(
                  //             width: 196,
                  //             height: 128,
                  //             child: Text(''),
                  //           ),
                  //         ),
                  //       ),
                  //       Card(
                  //         color: Colors.white24,
                  //         clipBehavior: Clip.hardEdge,
                  //         child: InkWell(
                  //           splashColor: Colors.blue.withAlpha(30),
                  //           onTap: () {
                  //             debugPrint('Card2 tapped.');
                  //           },
                  //           child: const SizedBox(
                  //             width: 196,
                  //             height: 128,
                  //             child: Text(""),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40.0),
                  Row(
                    children: [
                      const Text(
                        "   자주 물어보는 질문 Q&A ",
                        style: TextStyle(
                          color: PRIMARY_COLOR,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ).translate(),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: TabBar(
                tabs: [
                  Tab(child: const Text('근로', style: TextStyle(color: Colors.black)).translate()),
                  Tab(child: const Text('임금', style: TextStyle(color: Colors.black)).translate()),
                  Tab(child: const Text('퇴직금', style: TextStyle(color: Colors.black)).translate()),
                  Tab(child: const Text('임금체불', style: TextStyle(color: Colors.black)).translate()),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  ListView(
                    children: <Widget>[
                      ExpansionTile(
                        title: const Text('외국인근로자의 근로계약 효력일은 언제인가요?').translate(),
                        children: <Widget>[
                          ListTile(title: const Text('근로계약 효력발생일은 체류자격에 따라 상이합니다.\n'
                              '일반 외국인근로자(E-9) : 입국일(최초입국자의 경우)\n'
                              '외국국적동포(H-2) : 사업장에 취업하여 근로를 개시한 날\n'
                              '사업장변경자 : 근로계약 개시일\n'
                              '재고용자 : 취업활동기간 만료일의 다음날').translate()),
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('근로시간에 포함되는 경우').translate(),
                        children: <Widget>[
                          ListTile(title: const Text('일 시작 전 준비시간\n일 끝난 후에 정리시간\n근무일 및 휴일에 근로를 제공한 시간\n'
                              '손님을 기다리는 대기시간\n업무관련이 있어 의무적으로 참석해하는 교육').translate()),
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('주휴일(유급휴일)').translate(),
                        children: <Widget>[
                          ListTile(title: const Text('4주 동안을 평균하여, 1주일 15시간 이상 일하였으면, 1주일에 1일 이상은 유급휴일(주휴일)을 받아야합니다.').translate()),
                        ],
                      ),
                    ],
                  ),
                  ListView(
                    children: <Widget>[
                      ExpansionTile(
                        title: const Text('사장이 돈이 없다며 월급 대신 공장에서 만든 옷과 물건을 가져가라고 하는데, 어떻게 해야하는지요?').translate(),
                        children: <Widget>[
                          ListTile(title: const Text('근로기준법에 의하면 임금은 통용되는 화폐로 직접, 전액을 매월 1회 이상 기일을 정해 정기적으로 지급해야한다.\n'
                              '일방적인 물건지급은 불법입니다. 따라서 임금을 화폐로 지급해달라 요구할 수 있으며, 고용주가 계속 임금대신 물품 수령을 요구하는 경우 고용노동부에 신고하세요').translate()),
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('한국에는 최저임금 제도가 있다고 하는데, 무엇인가요?').translate(),
                        children: <Widget>[
                          ListTile(title: const Text('최저임금은 근로자에게 주어야 하는 최저기준을 정한것입니다.\n'
                              '한국의 법에는 외국인근로자의 경우에도 최저임금 이상을 주게 되어있으며, 고용허가제로 취업하거나 연수비자를 받았으나 실제로 노동하였음이 인정된다면 모두 똑같습니다.').translate()),
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('회사에서 매울 2시간씩 연장근로를 하는데 수당을 8000씩 줍니다. 이런 수당을 계산할 때 기준이 되는 임금이 무엇인가요?').translate(),
                        children: <Widget>[
                          ListTile(title: const Text('외국인 근로자들의 경우 거의 대부분 기본급 외에는 수당이 없기 때문에, 기본급을 월 소정근로시간(209시간)으로 나누어 나오는 금액이 통상임금이 됩니다.').translate()),
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('회사가 사정이 생겨 10일동안 쉬었습니다. 그래서 10일치 임금을 주지않습니다.').translate(),
                        children: <Widget>[
                          ListTile(title: const Text('사용자의 사정으로 쉬는 경우 근로자는 평균임금 70% 이상을 지급해야 합니다.').translate()),
                        ],
                      ),
                    ],
                  ),
                  ListView(
                    children: <Widget>[
                      ExpansionTile(
                        title: const Text('아르바이트로 1년 넘게 일했습니다. 퇴직금을 받을 수 있나요?').translate(),
                        children: <Widget>[
                          ListTile(title: const Text('주 평균 근로시간이 15시간 이상인 경우, 1년이 넘도록 계속 일했다면 퇴직금을 받을 수 있습니다.').translate()),
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('일하다 다쳐 수술을 받아 2달을 쉬었습니다. 다시 나와 근무를 하였는데, 2달을 뻬면 11개월이되는데 이럴때 퇴직금을 받을 수 없나요?').translate(),
                        children: <Widget>[
                          ListTile(title: const Text('산재로 쉰 기간은 회사를 그만 둔 경우가 아니므로 2달을 포함하여 1년 이상이면 받을 수 있습니다.').translate()),
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('회사가 문을 닫았습니다. 2년 동안 일한만큼 퇴직금을 받아야하는데 어떻게 해야 할까요?').translate(),
                        children: <Widget>[
                          ListTile(title: const Text('국가에서 사업주 대신 밀린 임금을 지급해 주는 대지급금 제도가있습니다. 우선 상담센터를 찾아가 문의하세요').translate()),
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('퇴직금이 없다는 근로계약서를 작성했는데, 퇴직금을 받지 못합니까?').translate(),
                        children: <Widget>[
                          ListTile(title: const Text('퇴직금은 근로기준법에 따라서 퇴직급여보장법에서 정하고있으므로 근로기준법보다 낮은 근로계약은 무효입니다.').translate()),
                        ],
                      ),
                    ],
                  ),
                  ListView(
                    children: <Widget>[
                      ExpansionTile(
                        title: const Text('공장에서 수습기간이 있으며, 그 기간동안은 임금을 주지않겠다고 하는데 어떻게 해야할까요?').translate(),
                        children: <Widget>[
                          ListTile(title: const Text('수습기간이더라도 임긍은 당연히 지급하여야합니다. 임금체불로 신고할 수 있습니다.').translate()),
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('임금이 체불되었는데 체불금액이 다르다고 회사가 주장할 때 어떻게 할까요?').translate(),
                        children: <Widget>[
                          ListTile(title: const Text('이런 경우에 대비하려면 근로시간. 휴일, 임금 등을 잘 기록해야 하며 증빙자료를 수집해 놓으시고, 비슷한 조건에 있는 동료 근로자들과 비교하는것도 좋습니다.').translate()),
                        ],
                      ),
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

class _Body extends StatelessWidget {
  _Body({Key? key}) : super(key: key);

  static final String title = 'PDF Viewer';

  // 텍스트 스타일
  final textStyle = const TextStyle(
    color: Colors.black87,
    fontSize: 12.5,
    fontWeight: FontWeight.w700,
  );

  final cardNameList = <String>[
    '한국어',
    '영어',
    '베트남',
    '중국어',
  ];

  final imgList = <String>[
    'labor_standards.png',
    'employment_insurance.png',
    'safety_insurance.png',
    'retirement.png',
    'wage_claim.png',
    'equality.png',
  ];

  // 네비게이션
  int currentIndex = 0;

  final List<Widget> _navigationList = <Widget> [
    // const PdfViewerPage_ko (),
    // const PdfViewerPage_ko(),
    // const PdfViewerPage_ko(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 27.0, top: 7.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Text(
                " 자주 찾아 보는 법률 ",
                style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
              ).translate(),
            ],
          ),
          const SizedBox(height: 14.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                4,
                    (index) {
                  return Card(
                    color: Colors.white24,
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      onTap: () async {
                        debugPrint('pdf 출ㄹ력.');
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (BuildContext context) {
                        //       return _navigationList[index];
                        //     }));
                        // final url = 'note_ko.pdf';
                        // final file = await PDFApi.loadFirebase(url);
                        // if (file == null) return debugPrint('pnnnnn.');
                        // openPDF(context, file);
                        final path = 'assets/note_ko.pdf';
                        final file = await PDFApi.loadAsset(path);
                        openPDF(context, file);
                      },
                      child: const SizedBox(
                        width: 196,
                        height: 128,
                        child: Text(''),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
  );
}

