import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:migrant_law_solutionchallenge/const/color.dart';
import 'package:http/http.dart' as http;

import '../service/model/services.dart';
import '../service/model/services_model.dart';

class LaborDetailScreen extends StatefulWidget {
  const LaborDetailScreen({Key? key}) : super(key: key);

  @override
  State<LaborDetailScreen> createState() => _LaborDetailScreenState();
}

class _LaborDetailScreenState extends State<LaborDetailScreen> {
  static const String endPointUrl = 'http://34.64.81.164:8080/law/232199';
  final Uri url = Uri.parse(endPointUrl);

  void fetchData() async {
    http.Response response = await http.get(url);
    // if(response.statusCode == 200) {
    //   String jsonData = response.body;
    //   // 법률 제목
    //   var law_title = jsonDecode(jsonData)['법령']['기본정보']['법령명_한글']['_cdata'];
    //   print("law_title : $law_title");
    //
    //   var law_date = jsonDecode(jsonData)['법령']['기본정보']['시행일자']['_text'];
    //   print("law_date : $law_date");
    //
    //   List<dynamic> provision = jsonDecode(jsonData)['법령']['조문']['조문단위']['조문내용']['_cdata'];
    //   print("provision : $provision");
    final decode = jsonDecode(response.body);
    Services services = Services.fromJson(jsonDecode(decode));
    print(services);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BODY_TEXT_COLOR,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: BODY_TEXT_COLOR,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: PRIMARY_COLOR),
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        body: Text(""));
  }
}
