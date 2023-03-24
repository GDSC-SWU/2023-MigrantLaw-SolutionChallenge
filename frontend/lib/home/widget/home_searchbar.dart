import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:migrant_law_solutionchallenge/const/color.dart';
import 'package:translator/translator.dart';

import '../../home_detail/search/screen/search_labor_screen.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {

  final translator = GoogleTranslator();
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27.0),
      child: CupertinoPageScaffold(
        child: Center(
          child: Container(
            color: SECONDARY_COLOR4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 서치바에 어떤 글자를 검색하는지 알 수 있음
                // Text(text),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 0, bottom: 8.0),
                  child: SearchTextField(
                    fieldValue: (String value) {
                      setState(() {
                        text = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.fieldValue,
  });

  final ValueChanged<String> fieldValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: CupertinoSearchTextField(
        placeholder: "Search...",
        keyboardType: TextInputType.text,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: PRIMARY_COLOR,
            ),
            borderRadius: BorderRadius.circular(4),
            color: BODY_TEXT_COLOR
        ),
        onChanged: (String value) {
          fieldValue('The text has changed to: $value');
        },
        onSubmitted: (String value) {
          fieldValue('Submitted Translator text: $value');
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return HomeDetailPage(
              searchText: value,
            );
          }));
        },
      ),
    );
  }
}

