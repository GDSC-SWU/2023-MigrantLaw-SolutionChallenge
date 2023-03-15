import 'dart:convert';

List<SearchLabor> searchLaborFromJson(String str) => List<SearchLabor>.from(json.decode(str).map((x) => SearchLabor.fromJson(x)));

String searchLaborToJson(List<SearchLabor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchLabor {
  SearchLabor({
    required this.jomunKey,
    required this.jomunTitle,
    required this.jomunStartDay,
    required this.jomunContent,
    required this.jomunReference,
    required this.hang,
  });

  String jomunKey;
  String jomunTitle;
  String jomunStartDay;
  String jomunContent;
  String jomunReference;
  dynamic hang;

  factory SearchLabor.fromJson(Map<String, dynamic> json) => SearchLabor(
    jomunKey: json["jomunKey"],
    jomunTitle: json["jomunTitle"],
    jomunStartDay: json["jomunStartDay"],
    jomunContent: json["jomunContent"],
    jomunReference: json["jomunReference"],
    hang: json["hang"],
  );

  Map<String, dynamic> toJson() => {
    "jomunKey": jomunKey,
    "jomunTitle": jomunTitle,
    "jomunStartDay": jomunStartDay,
    "jomunContent": jomunContent,
    "jomunReference": jomunReference,
    "hang": hang,
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

  List<Map<String, Value>>? tentacled;
  Empty empty;
  Value hang;
  Class? purple;
  Class? fluffy;

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

  dynamic cdata;

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

  String text;

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

  String cdata;

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

  List<Map<String, Value>> empty;

  factory PurpleHang.fromJson(Map<String, dynamic> json) => PurpleHang(
    empty: List<Map<String, Value>>.from(json["호"].map((x) => Map.from(x).map((k, v) => MapEntry<String, Value>(k, Value.fromJson(v))))),
  );

  Map<String, dynamic> toJson() => {
    "호": List<dynamic>.from(empty.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
  };
}