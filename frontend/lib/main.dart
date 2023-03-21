import 'package:flutter/material.dart';
import 'package:google_translator/google_translator.dart';
import 'package:migrant_law_solutionchallenge/settings/language/start_language_screen.dart';
import 'const/api/translate/api_key.dart';
import 'const/api/translate/translations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const RestartWidget(child: _APP()),
  );
}

class _APP extends StatelessWidget {
  const _APP({Key? key}) : super(key: key);

  final String apiKey = TRANSLATE_API_KEY;

  @override
  Widget build(BuildContext context) {
    return GoogleTranslatorInit(apiKey,
      translateFrom: const Locale('ko'),
      translateTo: Locale(chooseLanguage),
      automaticDetection: true,
      cacheDuration: const Duration(days: 3),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "NotoSans",
        ),
        home: const StartLanguageScreen(),
      )
    );
  }
}

class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}