import 'dart:convert';

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Services {
  Services({
    required this.empty,
  });

  Empty empty;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
    empty: Empty.fromJson(json["법령"]),
  );

  Map<String, dynamic> toJson() => {
    "법령": empty.toJson(),
  };
}

class Empty {
  Empty({
    required this.purple,
    required this.indigo,
  });

  Fluffy purple;
  Ambitious indigo;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
    purple: Fluffy.fromJson(json["기본정보"]),
    indigo: Ambitious.fromJson(json["조문"]),
  );

  Map<String, dynamic> toJson() => {
    "기본정보": purple.toJson(),
    "조문": indigo.toJson(),
  };
}

class Class {
  Class({
    required this.empty,
  });

  Purple empty;

  factory Class.fromJson(Map<String, dynamic> json) => Class(
    empty: Purple.fromJson(json["개정문내용"]),
  );

  Map<String, dynamic> toJson() => {
    "개정문내용": empty.toJson(),
  };
}

class Purple {
  Purple({
    required this.cdata,
  });

  List<String> cdata;

  factory Purple.fromJson(Map<String, dynamic> json) => Purple(
    cdata: List<String>.from(json["_cdata"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_cdata": List<dynamic>.from(cdata.map((x) => x)),
  };
}

class PdFClass {
  PdFClass({
    this.text,
  });

  String? text;

  factory PdFClass.fromJson(Map<String, dynamic> json) => PdFClass(
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

class Ambitious {
  Ambitious({
    required this.empty,
  });

  List<Cunning> empty;

  factory Ambitious.fromJson(Map<String, dynamic> json) => Ambitious(
    empty: List<Cunning>.from(json["조문단위"].map((x) => Cunning.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "조문단위": List<dynamic>.from(empty.map((x) => x.toJson())),
  };
}

class Cunning {
  Cunning({
    required this.attributes,
    required this.fluffy,
    required this.indigo,
    required this.sticky,
    required this.indecent,
    required this.hilarious,
    required this.tentacled,
    required this.purple,
    this.ambitious,
    this.magenta,
    this.cunning,
    this.empty,
  });

  PurpleAttributes attributes;
  PdFClass fluffy;
  PdFClass indigo;
  PdFClass sticky;
  PdFClass indecent;
  PdFClass hilarious;
  PdFClass tentacled;
  Value purple;
  Value? ambitious;
  dynamic magenta;
  Value? cunning;
  PdFClass? empty;

  factory Cunning.fromJson(Map<String, dynamic> json) => Cunning(
    attributes: PurpleAttributes.fromJson(json["_attributes"]),
    fluffy: PdFClass.fromJson(json["조문번호"]),
    indigo: PdFClass.fromJson(json["조문여부"]),
    sticky: PdFClass.fromJson(json["조문시행일자"]),
    indecent: PdFClass.fromJson(json["조문이동이전"]),
    hilarious: PdFClass.fromJson(json["조문이동이후"]),
    tentacled: PdFClass.fromJson(json["조문변경여부"]),
    purple: Value.fromJson(json["조문내용"]),
    ambitious: json["조문제목"] == null ? null : Value.fromJson(json["조문제목"]),
    magenta: json["항"],
    cunning: json["조문참고자료"] == null ? null : Value.fromJson(json["조문참고자료"]),
    empty: json["조문가지번호"] == null ? null : PdFClass.fromJson(json["조문가지번호"]),
  );

  Map<String, dynamic> toJson() => {
    "_attributes": attributes.toJson(),
    "조문번호": fluffy.toJson(),
    "조문여부": indigo.toJson(),
    "조문시행일자": sticky.toJson(),
    "조문이동이전": indecent.toJson(),
    "조문이동이후": hilarious.toJson(),
    "조문변경여부": tentacled.toJson(),
    "조문내용": purple.toJson(),
    "조문제목": ambitious?.toJson(),
    "항": magenta,
    "조문참고자료": cunning?.toJson(),
    "조문가지번호": empty?.toJson(),
  };
}

class PurpleAttributes {
  PurpleAttributes({
    required this.empty,
  });

  String empty;

  factory PurpleAttributes.fromJson(Map<String, dynamic> json) => PurpleAttributes(
    empty: json["조문키"],
  );

  Map<String, dynamic> toJson() => {
    "조문키": empty,
  };
}

class Magenta {
  Magenta({
    required this.purple,
    required this.empty,
    this.sticky,
    this.fluffy,
    this.tentacled,
  });

  Value purple;
  Frisky empty;
  List<Map<String, Value>>? sticky;
  PdFClass? fluffy;
  PdFClass? tentacled;

  factory Magenta.fromJson(Map<String, dynamic> json) => Magenta(
    purple: Value.fromJson(json["항번호"]),
    empty: Frisky.fromJson(json["항내용"]),
    sticky: json["호"] == null ? [] : List<Map<String, Value>>.from(json["호"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, Value>(k, Value.fromJson(v))))),
    fluffy: json["항제개정유형"] == null ? null : PdFClass.fromJson(json["항제개정유형"]),
    tentacled: json["항제개정일자문자열"] == null ? null : PdFClass.fromJson(json["항제개정일자문자열"]),
  );

  Map<String, dynamic> toJson() => {
    "항번호": purple.toJson(),
    "항내용": empty.toJson(),
    "호": sticky == null ? [] : List<dynamic>.from(sticky!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
    "항제개정유형": fluffy?.toJson(),
    "항제개정일자문자열": tentacled?.toJson(),
  };
}

class Frisky {
  Frisky({
    required this.cdata,
  });

  dynamic cdata;

  factory Frisky.fromJson(Map<String, dynamic> json) => Frisky(
    cdata: json["_cdata"],
  );

  Map<String, dynamic> toJson() => {
    "_cdata": cdata,
  };
}

class Mischievous {
  Mischievous({
    required this.empty,
  });

  List<Map<String, Value>> empty;

  factory Mischievous.fromJson(Map<String, dynamic> json) => Mischievous(
    empty: List<Map<String, Value>>.from(json["호"].map((x) => Map.from(x).map((k, v) => MapEntry<String, Value>(k, Value.fromJson(v))))),
  );

  Map<String, dynamic> toJson() => {
    "호": List<dynamic>.from(empty.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
  };
}

class Fluffy {
  Fluffy({
    required this.sticky,
    required this.purple,
    required this.tentacled,
    required this.indecent,
    required this.fluffy,
    required this.empty,
    required this.indigo,
  });

  PdFClass sticky;
  Value purple;
  PdFClass tentacled;
  PdFClass indecent;
  PdFClass fluffy;
  PdFClass empty;
  Tentacled indigo;

  factory Fluffy.fromJson(Map<String, dynamic> json) => Fluffy(
    sticky: PdFClass.fromJson(json["언어"]),
    purple: Value.fromJson(json["법령명_한글"]),
    tentacled: PdFClass.fromJson(json["시행일자"]),
    indecent: PdFClass.fromJson(json["제개정구분"]),
    fluffy: PdFClass.fromJson(json["별표편집여부"]),
    empty: PdFClass.fromJson(json["공포법령여부"]),
    indigo: Tentacled.fromJson(json["연락부서"]),
  );

  Map<String, dynamic> toJson() => {
    "언어": sticky.toJson(),
    "법령명_한글": purple.toJson(),
    "시행일자": tentacled.toJson(),
    "제개정구분": indecent.toJson(),
    "별표편집여부": fluffy.toJson(),
    "공포법령여부": empty.toJson(),
    "연락부서": indigo.toJson(),
  };
}

class Tentacled {
  Tentacled();

  factory Tentacled.fromJson(Map<String, dynamic> json) => Tentacled(
  );

  Map<String, dynamic> toJson() => {
  };
}