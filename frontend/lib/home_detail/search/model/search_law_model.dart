// To parse this JSON data, do
//
//     final searchLaw = searchLawFromJson(jsonString);

import 'dart:convert';

List<SearchLaw> searchLawFromJson(String str) => List<SearchLaw>.from(json.decode(str).map((x) => SearchLaw.fromJson(x)));

String searchLawToJson(List<SearchLaw> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchLaw {
  SearchLaw({
    required this.jomunKey,
    required this.jomunTitle,
    required this.jomunStartDay,
    required this.jomunContent,
    required this.hang,
    this.message,
  });

  final String jomunKey;
  final String jomunTitle;
  final String jomunStartDay;
  final String jomunContent;
  final dynamic hang;
  final String? message;

  factory SearchLaw.fromJson(Map<String, dynamic> json) => SearchLaw(
        jomunKey: json["jomunKey"],
        jomunTitle: json["jomunTitle"],
        jomunStartDay: json["jomunStartDay"],
        jomunContent: json["jomunContent"],
        hang: json["hang"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "jomunKey": jomunKey,
    "jomunTitle": jomunTitle,
    "jomunStartDay": jomunStartDay,
    "jomunContent": jomunContent,
    "hang": hang,
    "message": message,
  };
}

class HangElement {
  HangElement({
    this.tentacled,
    required this.empty,
    required this.hang,
    this.purple,
    this.fluffy,
  });

  final List<Map<String, Value>>? tentacled;
  final Empty empty;
  final Value hang;
  final Class? purple;
  final Class? fluffy;

  factory HangElement.fromJson(Map<String, dynamic> json) => HangElement(
    tentacled: json["호"] == null ? [] : List<Map<String, Value>>.from(json["호"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, Value>(k, Value.fromJson(v))))),
    empty: Empty.fromJson(json["항내용"]),
    hang: Value.fromJson(json["항번호"]),
    purple: json["항제개정유형"] == null ? null : Class.fromJson(json["항제개정유형"]),
    fluffy: json["항제개정일자문자열"] == null ? null : Class.fromJson(json["항제개정일자문자열"]),
  );

  Map<String, dynamic> toJson() => {
    "호": tentacled == null ? [] : List<dynamic>.from(tentacled!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
    "항내용": empty.toJson(),
    "항번호": hang.toJson(),
    "항제개정유형": purple?.toJson(),
    "항제개정일자문자열": fluffy?.toJson(),
  };
}

class Empty {
  Empty({
    required this.cdata,
  });

  final dynamic cdata;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
    cdata: json["_cdata"],
  );

  Map<String, dynamic> toJson() => {
    "_cdata": cdata,
  };
}

class Class {
  Class({
    required this.text,
  });

  final String text;

  factory Class.fromJson(Map<String, dynamic> json) => Class(
    text: json["_text"],
  );

  Map<String, dynamic> toJson() => {
    "_text": text,
  };
}

class Value {
  Value({
    required this.cdata,
  });

  final String cdata;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    cdata: json["_cdata"],
  );

  Map<String, dynamic> toJson() => {
    "_cdata": cdata,
  };
}

class PurpleHang {
  PurpleHang({
    required this.empty,
  });

  final List<Map<String, Value>> empty;

  factory PurpleHang.fromJson(Map<String, dynamic> json) => PurpleHang(
    empty: List<Map<String, Value>>.from(json["호"].map((x) => Map.from(x).map((k, v) => MapEntry<String, Value>(k, Value.fromJson(v))))),
  );

  Map<String, dynamic> toJson() => {
    "호": List<dynamic>.from(empty.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
  };
}
