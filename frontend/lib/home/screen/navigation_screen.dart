import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import '../../const/color.dart';
import '../../contract/screen/contract_screen.dart';
import '../../download_file/screen/download_file.dart';
import 'home_sceen.dart';

String getNavLanguage = "ko";

// 네비게이션으로 화면 이동
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;
  GoogleTranslator translator = GoogleTranslator();

  List<String> translatedNav = <String>[
    "홈",
    "검색",
    "계약서"
  ];

  // 네비게이션 변역하기
  void _translateNav() async {

    final List<Translation> translations = await Future.wait(
        translatedNav.map((String tab) => translator.translate(tab, to: getNavLanguage))
    );

    setState(() {
      translatedNav = translations.map((Translation translation) {
        return translation.text;
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _translateNav();
  }

  // 네비게이션 탭 화면
  final List<Widget> _widgetOptions = <Widget>[
    const DownloadFileScreen(),
    const HomeScreen(),
    const ContractSceen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BODY_TEXT_COLOR,
      body: SafeArea(
        child: _widgetOptions.elementAt(currentIndex),
      ),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  Widget _bottomNavigation() {
    return BottomNavigationBar(
      backgroundColor: PRIMARY_COLOR,
      unselectedItemColor: Colors.white60,
      selectedItemColor: BODY_TEXT_COLOR,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: translatedNav[0],
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.search),
          label: translatedNav[1],
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.camera_alt),
          label: translatedNav[2],
        ),
      ],
    );
  }
}
