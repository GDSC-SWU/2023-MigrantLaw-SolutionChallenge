import 'dart:convert';

WageServices wageServicesFromJson(String str) => WageServices.fromJson(json.decode(str));

String wageServicesToJson(WageServices data) => json.encode(data.toJson());

class WageServices {
  WageServices({
    required this.declaration,
    required this.empty,
  });

  Declaration declaration;
  Empty empty;

  factory WageServices.fromJson(Map<String, dynamic> json) => WageServices(
    declaration: Declaration.fromJson(json["_declaration"]),
    empty: Empty.fromJson(json["법령"]),
  );

  Map<String, dynamic> toJson() => {
    "_declaration": declaration.toJson(),
    "법령": empty.toJson(),
  };
}

class Declaration {
  Declaration({
    required this.attributes,
  });

  DeclarationAttributes attributes;

  factory Declaration.fromJson(Map<String, dynamic> json) => Declaration(
    attributes: DeclarationAttributes.fromJson(json["_attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "_attributes": attributes.toJson(),
  };
}

class DeclarationAttributes {
  DeclarationAttributes({
    required this.version,
    required this.encoding,
  });

  String version;
  String encoding;

  factory DeclarationAttributes.fromJson(Map<String, dynamic> json) => DeclarationAttributes(
    version: json["version"],
    encoding: json["encoding"],
  );

  Map<String, dynamic> toJson() => {
    "version": version,
    "encoding": encoding,
  };
}

class Empty {
  Empty({
    required this.attributes,
    required this.purple,
    required this.sticky,
    required this.fluffy,
    required this.empty,
    required this.tentacled,
  });

  Attributes attributes;
  Fluffy purple;
  Magenta sticky;
  Ambitious fluffy;
  Class empty;
  Cunning tentacled;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
    attributes: Attributes.fromJson(json["_attributes"]),
    purple: Fluffy.fromJson(json["기본정보"]),
    sticky: Magenta.fromJson(json["조문"]),
    fluffy: Ambitious.fromJson(json["부칙"]),
    empty: Class.fromJson(json["개정문"]),
    tentacled: Cunning.fromJson(json["제개정이유"]),
  );

  Map<String, dynamic> toJson() => {
    "_attributes": attributes.toJson(),
    "기본정보": purple.toJson(),
    "조문": sticky.toJson(),
    "부칙": fluffy.toJson(),
    "개정문": empty.toJson(),
    "제개정이유": tentacled.toJson(),
  };
}

class Attributes {
  Attributes({
    required this.empty,
  });

  String empty;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    empty: json["법령키"],
  );

  Map<String, dynamic> toJson() => {
    "법령키": empty,
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

class Ambitious {
  Ambitious({
    required this.empty,
  });

  List<Element> empty;

  factory Ambitious.fromJson(Map<String, dynamic> json) => Ambitious(
    empty: List<Element>.from(json["부칙단위"].map((x) => Element.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "부칙단위": List<dynamic>.from(empty.map((x) => x.toJson())),
  };
}

class Element {
  Element({
    required this.attributes,
    required this.purple,
    required this.empty,
    required this.fluffy,
  });

  TentacledAttributes attributes;
  IdClass purple;
  IdClass empty;
  Purple fluffy;

  factory Element.fromJson(Map<String, dynamic> json) => Element(
    attributes: TentacledAttributes.fromJson(json["_attributes"]),
    purple: IdClass.fromJson(json["부칙공포일자"]),
    empty: IdClass.fromJson(json["부칙공포번호"]),
    fluffy: Purple.fromJson(json["부칙내용"]),
  );

  Map<String, dynamic> toJson() => {
    "_attributes": attributes.toJson(),
    "부칙공포일자": purple.toJson(),
    "부칙공포번호": empty.toJson(),
    "부칙내용": fluffy.toJson(),
  };
}

class TentacledAttributes {
  TentacledAttributes({
    required this.empty,
  });

  String empty;

  factory TentacledAttributes.fromJson(Map<String, dynamic> json) => TentacledAttributes(
    empty: json["부칙키"],
  );

  Map<String, dynamic> toJson() => {
    "부칙키": empty,
  };
}

class IdClass {
  IdClass({
    this.text,
  });

  String? text;

  factory IdClass.fromJson(Map<String, dynamic> json) => IdClass(
    text: json["_text"],
  );

  Map<String, dynamic> toJson() => {
    "_text": text,
  };
}

class Fluffy {
  Fluffy({
    required this.id,
    required this.fluffy,
    required this.empty,
    required this.magenta,
    required this.indecent,
    required this.tentacled,
    required this.sticky,
    required this.indigo,
    required this.the1,
    required this.the4,
    required this.the3,
    required this.ambitious,
    required this.mischievous,
    required this.cunning,
    required this.braggadocious,
    required this.the2,
    required this.hilarious,
    required this.purple,
    required this.frisky,
  });

  IdClass id;
  IdClass fluffy;
  IdClass empty;
  IdClass magenta;
  Sticky indecent;
  Value tentacled;
  Value sticky;
  Tentacled indigo;
  IdClass the1;
  IdClass the4;
  IdClass the3;
  Indigo ambitious;
  IdClass mischievous;
  IdClass cunning;
  IdClass braggadocious;
  IdClass the2;
  IdClass hilarious;
  IdClass purple;
  Indecent frisky;

  factory Fluffy.fromJson(Map<String, dynamic> json) => Fluffy(
    id: IdClass.fromJson(json["법령ID"]),
    fluffy: IdClass.fromJson(json["공포일자"]),
    empty: IdClass.fromJson(json["공포번호"]),
    magenta: IdClass.fromJson(json["언어"]),
    indecent: Sticky.fromJson(json["법종구분"]),
    tentacled: Value.fromJson(json["법령명_한글"]),
    sticky: Value.fromJson(json["법령명_한자"]),
    indigo: Tentacled.fromJson(json["법령명약칭"]),
    the1: IdClass.fromJson(json["제명변경여부"]),
    the4: IdClass.fromJson(json["한글법령여부"]),
    the3: IdClass.fromJson(json["편장절관"]),
    ambitious: Indigo.fromJson(json["소관부처"]),
    mischievous: IdClass.fromJson(json["전화번호"]),
    cunning: IdClass.fromJson(json["시행일자"]),
    braggadocious: IdClass.fromJson(json["제개정구분"]),
    the2: IdClass.fromJson(json["조문시행일자문자열"]),
    hilarious: IdClass.fromJson(json["별표편집여부"]),
    purple: IdClass.fromJson(json["공포법령여부"]),
    frisky: Indecent.fromJson(json["연락부서"]),
  );

  Map<String, dynamic> toJson() => {
    "법령ID": id.toJson(),
    "공포일자": fluffy.toJson(),
    "공포번호": empty.toJson(),
    "언어": magenta.toJson(),
    "법종구분": indecent.toJson(),
    "법령명_한글": tentacled.toJson(),
    "법령명_한자": sticky.toJson(),
    "법령명약칭": indigo.toJson(),
    "제명변경여부": the1.toJson(),
    "한글법령여부": the4.toJson(),
    "편장절관": the3.toJson(),
    "소관부처": ambitious.toJson(),
    "전화번호": mischievous.toJson(),
    "시행일자": cunning.toJson(),
    "제개정구분": braggadocious.toJson(),
    "조문시행일자문자열": the2.toJson(),
    "별표편집여부": hilarious.toJson(),
    "공포법령여부": purple.toJson(),
    "연락부서": frisky.toJson(),
  };
}

class Indigo {
  Indigo({
    required this.attributes,
    required this.text,
  });

  PurpleAttributes attributes;
  String text;

  factory Indigo.fromJson(Map<String, dynamic> json) => Indigo(
    attributes: PurpleAttributes.fromJson(json["_attributes"]),
    text: json["_text"],
  );

  Map<String, dynamic> toJson() => {
    "_attributes": attributes.toJson(),
    "_text": text,
  };
}

class PurpleAttributes {
  PurpleAttributes({
    required this.empty,
  });

  String empty;

  factory PurpleAttributes.fromJson(Map<String, dynamic> json) => PurpleAttributes(
    empty: json["소관부처코드"],
  );

  Map<String, dynamic> toJson() => {
    "소관부처코드": empty,
  };
}

class Indecent {
  Indecent({
    required this.empty,
  });

  Hilarious empty;

  factory Indecent.fromJson(Map<String, dynamic> json) => Indecent(
    empty: Hilarious.fromJson(json["부서단위"]),
  );

  Map<String, dynamic> toJson() => {
    "부서단위": empty.toJson(),
  };
}

class Hilarious {
  Hilarious({
    required this.attributes,
    required this.fluffy,
    required this.tentacled,
    required this.empty,
    required this.purple,
  });

  FluffyAttributes attributes;
  IdClass fluffy;
  IdClass tentacled;
  IdClass empty;
  IdClass purple;

  factory Hilarious.fromJson(Map<String, dynamic> json) => Hilarious(
    attributes: FluffyAttributes.fromJson(json["_attributes"]),
    fluffy: IdClass.fromJson(json["소관부처명"]),
    tentacled: IdClass.fromJson(json["소관부처코드"]),
    empty: IdClass.fromJson(json["부서명"]),
    purple: IdClass.fromJson(json["부서연락처"]),
  );

  Map<String, dynamic> toJson() => {
    "_attributes": attributes.toJson(),
    "소관부처명": fluffy.toJson(),
    "소관부처코드": tentacled.toJson(),
    "부서명": empty.toJson(),
    "부서연락처": purple.toJson(),
  };
}

class FluffyAttributes {
  FluffyAttributes({
    required this.empty,
  });

  String empty;

  factory FluffyAttributes.fromJson(Map<String, dynamic> json) => FluffyAttributes(
    empty: json["부서키"],
  );

  Map<String, dynamic> toJson() => {
    "부서키": empty,
  };
}

class Sticky {
  Sticky({
    required this.attributes,
    required this.text,
  });

  AttributesClass attributes;
  String text;

  factory Sticky.fromJson(Map<String, dynamic> json) => Sticky(
    attributes: AttributesClass.fromJson(json["_attributes"]),
    text: json["_text"],
  );

  Map<String, dynamic> toJson() => {
    "_attributes": attributes.toJson(),
    "_text": text,
  };
}

class AttributesClass {
  AttributesClass({
    required this.empty,
  });

  String empty;

  factory AttributesClass.fromJson(Map<String, dynamic> json) => AttributesClass(
    empty: json["법종구분코드"],
  );

  Map<String, dynamic> toJson() => {
    "법종구분코드": empty,
  };
}

class Tentacled {
  Tentacled();

  factory Tentacled.fromJson(Map<String, dynamic> json) => Tentacled(
  );

  Map<String, dynamic> toJson() => {
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

class Magenta {
  Magenta({
    required this.empty,
  });

  List<Frisky> empty;

  factory Magenta.fromJson(Map<String, dynamic> json) => Magenta(
    empty: List<Frisky>.from(json["조문단위"].map((x) => Frisky.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "조문단위": List<dynamic>.from(empty.map((x) => x.toJson())),
  };
}

class Frisky {
  Frisky({
    required this.attributes,
    required this.fluffy,
    required this.indigo,
    required this.sticky,
    required this.indecent,
    required this.hilarious,
    required this.tentacled,
    required this.purple,
    this.ambitious,
    this.cunning,
    this.magenta,
    this.empty,
  });

  StickyAttributes attributes;
  IdClass fluffy;
  IdClass indigo;
  IdClass sticky;
  IdClass indecent;
  IdClass hilarious;
  IdClass tentacled;
  Value purple;
  Value? ambitious;
  Mischievous? cunning;
  dynamic magenta;
  IdClass? empty;

  factory Frisky.fromJson(Map<String, dynamic> json) => Frisky(
    attributes: StickyAttributes.fromJson(json["_attributes"]),
    fluffy: IdClass.fromJson(json["조문번호"]),
    indigo: IdClass.fromJson(json["조문여부"]),
    sticky: IdClass.fromJson(json["조문시행일자"]),
    indecent: IdClass.fromJson(json["조문이동이전"]),
    hilarious: IdClass.fromJson(json["조문이동이후"]),
    tentacled: IdClass.fromJson(json["조문변경여부"]),
    purple: Value.fromJson(json["조문내용"]),
    ambitious: json["조문제목"] == null ? null : Value.fromJson(json["조문제목"]),
    cunning: json["조문참고자료"] == null ? null : Mischievous.fromJson(json["조문참고자료"]),
    magenta: json["항"],
    empty: json["조문가지번호"] == null ? null : IdClass.fromJson(json["조문가지번호"]),
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
    "조문참고자료": cunning?.toJson(),
    "항": magenta,
    "조문가지번호": empty?.toJson(),
  };
}

class StickyAttributes {
  StickyAttributes({
    required this.empty,
  });

  String empty;

  factory StickyAttributes.fromJson(Map<String, dynamic> json) => StickyAttributes(
    empty: json["조문키"],
  );

  Map<String, dynamic> toJson() => {
    "조문키": empty,
  };
}

class Mischievous {
  Mischievous({
    required this.cdata,
  });

  dynamic cdata;

  factory Mischievous.fromJson(Map<String, dynamic> json) => Mischievous(
    cdata: json["_cdata"],
  );

  Map<String, dynamic> toJson() => {
    "_cdata": cdata,
  };
}

class Braggadocious {
  Braggadocious({
    required this.purple,
    required this.empty,
    this.fluffy,
    this.tentacled,
    this.sticky,
  });

  Value purple;
  Value empty;
  IdClass? fluffy;
  IdClass? tentacled;
  List<The1>? sticky;

  factory Braggadocious.fromJson(Map<String, dynamic> json) => Braggadocious(
    purple: Value.fromJson(json["항번호"]),
    empty: Value.fromJson(json["항내용"]),
    fluffy: json["항제개정유형"] == null ? null : IdClass.fromJson(json["항제개정유형"]),
    tentacled: json["항제개정일자문자열"] == null ? null : IdClass.fromJson(json["항제개정일자문자열"]),
    sticky: json["호"] == null ? [] : List<The1>.from(json["호"]!.map((x) => The1.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "항번호": purple.toJson(),
    "항내용": empty.toJson(),
    "항제개정유형": fluffy?.toJson(),
    "항제개정일자문자열": tentacled?.toJson(),
    "호": sticky == null ? [] : List<dynamic>.from(sticky!.map((x) => x.toJson())),
  };
}

class The1 {
  The1({
    required this.tentacled,
    required this.fluffy,
    this.empty,
    this.purple,
  });

  Value tentacled;
  Value fluffy;
  List<Map<String, Value>>? empty;
  Value? purple;

  factory The1.fromJson(Map<String, dynamic> json) => The1(
    tentacled: Value.fromJson(json["호번호"]),
    fluffy: Value.fromJson(json["호내용"]),
    empty: json["목"] == null ? [] : List<Map<String, Value>>.from(json["목"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, Value>(k, Value.fromJson(v))))),
    purple: json["호가지번호"] == null ? null : Value.fromJson(json["호가지번호"]),
  );

  Map<String, dynamic> toJson() => {
    "호번호": tentacled.toJson(),
    "호내용": fluffy.toJson(),
    "목": empty == null ? [] : List<dynamic>.from(empty!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
    "호가지번호": purple?.toJson(),
  };
}

class The2 {
  The2({
    required this.empty,
  });

  List<Map<String, Value>> empty;

  factory The2.fromJson(Map<String, dynamic> json) => The2(
    empty: List<Map<String, Value>>.from(json["호"].map((x) => Map.from(x).map((k, v) => MapEntry<String, Value>(k, Value.fromJson(v))))),
  );

  Map<String, dynamic> toJson() => {
    "호": List<dynamic>.from(empty.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
  };
}

class Cunning {
  Cunning({
    required this.empty,
  });

  Purple empty;

  factory Cunning.fromJson(Map<String, dynamic> json) => Cunning(
    empty: Purple.fromJson(json["제개정이유내용"]),
  );

  Map<String, dynamic> toJson() => {
    "제개정이유내용": empty.toJson(),
  };
}