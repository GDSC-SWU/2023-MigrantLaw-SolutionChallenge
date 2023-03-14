// To parse this JSON data, do
//
//     final laborSearch = laborSearchFromJson(jsonString);

import 'dart:convert';

List<LaborSearch> laborSearchFromJson(String str) => List<LaborSearch>.from(json.decode(str).map((x) => LaborSearch.fromJson(x)));

String laborSearchToJson(List<LaborSearch> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LaborSearch {
  LaborSearch({
    required this.attributes,
    required this.purple,
    required this.sticky,
    required this.tentacled,
    required this.indigo,
    required this.indecent,
    required this.fluffy,
    required this.laborSearch,
    this.hilarious,
    this.cunning,
    this.ambitious,
    this.empty,
  });

  Attributes attributes;
  Empty purple;
  Empty sticky;
  Empty tentacled;
  Empty indigo;
  Empty indecent;
  Empty fluffy;
  Value laborSearch;
  Value? hilarious;
  dynamic cunning;
  Value? ambitious;
  Empty? empty;

  factory LaborSearch.fromJson(Map<String, dynamic> json) => LaborSearch(
    attributes: Attributes.fromJson(json["_attributes"]),
    purple: Empty.fromJson(json["조문번호"]),
    sticky: Empty.fromJson(json["조문여부"]),
    tentacled: Empty.fromJson(json["조문시행일자"]),
    indigo: Empty.fromJson(json["조문이동이전"]),
    indecent: Empty.fromJson(json["조문이동이후"]),
    fluffy: Empty.fromJson(json["조문변경여부"]),
    laborSearch: Value.fromJson(json["조문내용"]),
    hilarious: json["조문제목"] == null ? null : Value.fromJson(json["조문제목"]),
    cunning: json["항"],
    ambitious: json["조문참고자료"] == null ? null : Value.fromJson(json["조문참고자료"]),
    empty: json["조문가지번호"] == null ? null : Empty.fromJson(json["조문가지번호"]),
  );

  Map<String, dynamic> toJson() => {
    "_attributes": attributes.toJson(),
    "조문번호": purple.toJson(),
    "조문여부": sticky.toJson(),
    "조문시행일자": tentacled.toJson(),
    "조문이동이전": indigo.toJson(),
    "조문이동이후": indecent.toJson(),
    "조문변경여부": fluffy.toJson(),
    "조문내용": laborSearch.toJson(),
    "조문제목": hilarious?.toJson(),
    "항": cunning,
    "조문참고자료": ambitious?.toJson(),
    "조문가지번호": empty?.toJson(),
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

class Attributes {
  Attributes({
    required this.empty,
  });

  String empty;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    empty: json["조문키"],
  );

  Map<String, dynamic> toJson() => {
    "조문키": empty,
  };
}

class Element {
  Element({
    required this.purple,
    required this.empty,
    this.sticky,
    this.fluffy,
    this.tentacled,
  });

  Value purple;
  Class empty;
  List<Map<String, Value>>? sticky;
  Empty? fluffy;
  Empty? tentacled;

  factory Element.fromJson(Map<String, dynamic> json) => Element(
    purple: Value.fromJson(json["항번호"]),
    empty: Class.fromJson(json["항내용"]),
    sticky: json["호"] == null ? [] : List<Map<String, Value>>.from(json["호"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, Value>(k, Value.fromJson(v))))),
    fluffy: json["항제개정유형"] == null ? null : Empty.fromJson(json["항제개정유형"]),
    tentacled: json["항제개정일자문자열"] == null ? null : Empty.fromJson(json["항제개정일자문자열"]),
  );

  Map<String, dynamic> toJson() => {
    "항번호": purple.toJson(),
    "항내용": empty.toJson(),
    "호": sticky == null ? [] : List<dynamic>.from(sticky!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
    "항제개정유형": fluffy?.toJson(),
    "항제개정일자문자열": tentacled?.toJson(),
  };
}

class Class {
  Class({
    required this.cdata,
  });

  dynamic cdata;

  factory Class.fromJson(Map<String, dynamic> json) => Class(
    cdata: json["_cdata"],
  );

  Map<String, dynamic> toJson() => {
    "_cdata": cdata,
  };
}

class Empty {
  Empty({
    this.text,
  });

  String? text;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
    text: json["_text"],
  );

  Map<String, dynamic> toJson() => {
    "_text": text,
  };
}

class Purple {
  Purple({
    required this.empty,
  });

  List<Map<String, Value>> empty;

  factory Purple.fromJson(Map<String, dynamic> json) => Purple(
    empty: List<Map<String, Value>>.from(json["호"].map((x) => Map.from(x).map((k, v) => MapEntry<String, Value>(k, Value.fromJson(v))))),
  );

  Map<String, dynamic> toJson() => {
    "호": List<dynamic>.from(empty.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
  };
}