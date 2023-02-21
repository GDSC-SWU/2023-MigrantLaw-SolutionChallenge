import 'package:flutter/material.dart';
import 'home/screen/navigation_screen.dart';

void main() {
  runApp(
    _APP(),
  );
}

class _APP extends StatelessWidget {
  const _APP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "NotoSans",
      ),
      home: NavigationScreen(),
    );
  }
}