import 'package:flutter/material.dart';
import 'package:migrant_law_solutionchallenge/settings/language/start_language_screen.dart';
import 'home/screen/navigation_screen.dart';

void main() {
  runApp(
    const _APP(),
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
      home: const StartLanguageScreen(),
    );
  }
}