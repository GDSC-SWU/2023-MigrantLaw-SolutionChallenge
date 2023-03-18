// To parse this JSON data, do
//
//     final searchEquality = searchEqualityFromJson(jsonString);

import 'dart:convert';

List<SearchEquality> searchEqualityFromJson(String str) => List<SearchEquality>.from(json.decode(str).map((x) => SearchEquality.fromJson(x)));

String searchEqualityToJson(List<SearchEquality> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchEquality {
  SearchEquality({
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
  JomunReference jomunReference;
  dynamic hang;

  factory SearchEquality.fromJson(Map<String, dynamic> json) => SearchEquality(
    jomunKey: json["jomunKey"],
    jomunTitle: json["jomunTitle"],
    jomunStartDay: json["jomunStartDay"],
    jomunContent: json["jomunContent"],
    jomunReference: jomunReferenceValues.map[json["jomunReference"]]!,
    hang: json["hang"],
  );

  Map<String, dynamic> toJson() => {
    "jomunKey": jomunKey,
    "jomunTitle": jomunTitle,
    "jomunStartDay": jomunStartDay,
    "jomunContent": jomunContent,
    "jomunReference": jomunReferenceValues.reverse[jomunReference],
    "hang": hang,
  };
}

class HangElement {
  HangElement({
    required this.empty,
    required this.hang,
    this.tentacled,
    this.purple,
    this.fluffy,
  });

  Empty empty;
  Empty hang;
  List<Map<String, Empty>>? tentacled;
  Class? purple;
  Class? fluffy;

  factory HangElement.fromJson(Map<String, dynamic> json) => HangElement(
    empty: Empty.fromJson(json["항내용"]),
    hang: Empty.fromJson(json["항번호"]),
    tentacled: json["호"] == null ? [] : List<Map<String, Empty>>.from(json["호"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, Empty>(k, Empty.fromJson(v))))),
    purple: json["항제개정유형"] == null ? null : Class.fromJson(json["항제개정유형"]),
    fluffy: json["항제개정일자문자열"] == null ? null : Class.fromJson(json["항제개정일자문자열"]),
  );

  Map<String, dynamic> toJson() => {
    "항내용": empty.toJson(),
    "항번호": hang.toJson(),
    "호": tentacled == null ? [] : List<dynamic>.from(tentacled!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
    "항제개정유형": purple?.toJson(),
    "항제개정일자문자열": fluffy?.toJson(),
  };
}

class Empty {
  Empty({
    required this.cdata,
  });

  String cdata;

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

  Text text;

  factory Class.fromJson(Map<String, dynamic> json) => Class(
    text: textValues.map[json["_text"]]!,
  );

  Map<String, dynamic> toJson() => {
    "_text": textValues.reverse[text],
  };
}

enum Text { EMPTY, TEXT, THE_20051230, THE_200553120051230 }

final textValues = EnumValues({
  "개정": Text.EMPTY,
  "삭제": Text.TEXT,
  "2005.12.30": Text.THE_20051230,
  "2005.5.31, 2005.12.30": Text.THE_200553120051230
});

class PurpleHang {
  PurpleHang({
    required this.empty,
  });

  List<Element> empty;

  factory PurpleHang.fromJson(Map<String, dynamic> json) => PurpleHang(
    empty: List<Element>.from(json["호"].map((x) => Element.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "호": List<dynamic>.from(empty.map((x) => x.toJson())),
  };
}

class Element {
  Element({
    this.empty,
    required this.purple,
    required this.fluffy,
  });

  List<Map<String, Empty>>? empty;
  Empty purple;
  Empty fluffy;

  factory Element.fromJson(Map<String, dynamic> json) => Element(
    empty: json["목"] == null ? [] : List<Map<String, Empty>>.from(json["목"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, Empty>(k, Empty.fromJson(v))))),
    purple: Empty.fromJson(json["호내용"]),
    fluffy: Empty.fromJson(json["호번호"]),
  );

  Map<String, dynamic> toJson() => {
    "목": empty == null ? [] : List<dynamic>.from(empty!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
    "호내용": purple.toJson(),
    "호번호": fluffy.toJson(),
  };
}

enum JomunReference { EMPTY, THE_20051230, JOMUN_REFERENCE_20051230 }

final jomunReferenceValues = EnumValues({
  "": JomunReference.EMPTY,
  "[본조신설 2005.12.30]": JomunReference.JOMUN_REFERENCE_20051230,
  "[전문개정 2005.12.30]": JomunReference.THE_20051230
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
