import 'package:flutter/material.dart';
import '../../const/color.dart';
import '../../contract/screen/contract_screen.dart';
import '../../download_file/screen/download_file.dart';
import 'home_sceen.dart';

// 네비게이션으로 화면 이동
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;

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
      items: const [
        BottomNavigationBarItem(
          label: "홈",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "검색",
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: "계약서",
          icon: Icon(Icons.camera_alt),
        ),
      ],
    );
  }
}
