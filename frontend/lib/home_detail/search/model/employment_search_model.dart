import 'dart:convert';

List<SearchEmployment> searchEmploymentFromJson(String str) => List<SearchEmployment>.from(json.decode(str).map((x) => SearchEmployment.fromJson(x)));

String searchEmploymentToJson(List<SearchEmployment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchEmployment {
  SearchEmployment({
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
  dynamic jomunReference;
  dynamic hang;

  factory SearchEmployment.fromJson(Map<String, dynamic> json) => SearchEmployment(
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
    required this.empty,
    required this.hang,
    this.tentacled,
    this.purple,
    this.fluffy,
  });

  Empty empty;
  Empty hang;
  List<Element>? tentacled;
  Class? purple;
  Class? fluffy;

  factory HangElement.fromJson(Map<String, dynamic> json) => HangElement(
    empty: Empty.fromJson(json["항내용"]),
    hang: Empty.fromJson(json["항번호"]),
    tentacled: json["호"] == null ? [] : List<Element>.from(json["호"]!.map((x) => Element.fromJson(x))),
    purple: json["항제개정유형"] == null ? null : Class.fromJson(json["항제개정유형"]),
    fluffy: json["항제개정일자문자열"] == null ? null : Class.fromJson(json["항제개정일자문자열"]),
  );

  Map<String, dynamic> toJson() => {
    "항내용": empty.toJson(),
    "항번호": hang.toJson(),
    "호": tentacled == null ? [] : List<dynamic>.from(tentacled!.map((x) => x.toJson())),
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

  String text;

  factory Class.fromJson(Map<String, dynamic> json) => Class(
    text: json["_text"],
  );

  Map<String, dynamic> toJson() => {
    "_text": text,
  };
}

class Element {
  Element({
    required this.fluffy,
    required this.tentacled,
    this.empty,
    this.purple,
  });

  Empty fluffy;
  Empty tentacled;
  List<Map<String, Empty>>? empty;
  Empty? purple;

  factory Element.fromJson(Map<String, dynamic> json) => Element(
    fluffy: Empty.fromJson(json["호내용"]),
    tentacled: Empty.fromJson(json["호번호"]),
    empty: json["목"] == null ? [] : List<Map<String, Empty>>.from(json["목"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, Empty>(k, Empty.fromJson(v))))),
    purple: json["호가지번호"] == null ? null : Empty.fromJson(json["호가지번호"]),
  );

  Map<String, dynamic> toJson() => {
    "호내용": fluffy.toJson(),
    "호번호": tentacled.toJson(),
    "목": empty == null ? [] : List<dynamic>.from(empty!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
    "호가지번호": purple?.toJson(),
  };
}

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
