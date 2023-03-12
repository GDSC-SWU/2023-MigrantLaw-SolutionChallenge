import 'dart:convert';

EqualityServices equalityServicesFromJson(String str) => EqualityServices.fromJson(json.decode(str));

String equalityServicesToJson(EqualityServices data) => json.encode(data.toJson());

class EqualityServices {
  EqualityServices({
    required this.declaration,
    required this.empty,
  });

  Declaration declaration;
  Empty empty;

  factory EqualityServices.fromJson(Map<String, dynamic> json) => EqualityServices(
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
  Cunning sticky;
  Hilarious fluffy;
  Class empty;
  Ambitious tentacled;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
    attributes: Attributes.fromJson(json["_attributes"]),
    purple: Fluffy.fromJson(json["기본정보"]),
    sticky: Cunning.fromJson(json["조문"]),
    fluffy: Hilarious.fromJson(json["부칙"]),
    empty: Class.fromJson(json["개정문"]),
    tentacled: Ambitious.fromJson(json["제개정이유"]),
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

class Hilarious {
  Hilarious({
    required this.empty,
  });

  List<Element> empty;

  factory Hilarious.fromJson(Map<String, dynamic> json) => Hilarious(
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
    required this.text,
  });

  String text;

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
    required this.the2,
    required this.the5,
    required this.the4,
    required this.ambitious,
    required this.braggadocious,
    required this.cunning,
    required this.the1,
    required this.the3,
    required this.mischievous,
    required this.hilarious,
    required this.purple,
    required this.frisky,
  });

  IdClass id;
  IdClass fluffy;
  IdClass empty;
  IdClass magenta;
  Tentacled indecent;
  Value tentacled;
  Value sticky;
  Value indigo;
  IdClass the2;
  IdClass the5;
  IdClass the4;
  Sticky ambitious;
  IdClass braggadocious;
  IdClass cunning;
  IdClass the1;
  IdClass the3;
  IdClass mischievous;
  IdClass hilarious;
  IdClass purple;
  Indigo frisky;

  factory Fluffy.fromJson(Map<String, dynamic> json) => Fluffy(
    id: IdClass.fromJson(json["법령ID"]),
    fluffy: IdClass.fromJson(json["공포일자"]),
    empty: IdClass.fromJson(json["공포번호"]),
    magenta: IdClass.fromJson(json["언어"]),
    indecent: Tentacled.fromJson(json["법종구분"]),
    tentacled: Value.fromJson(json["법령명_한글"]),
    sticky: Value.fromJson(json["법령명_한자"]),
    indigo: Value.fromJson(json["법령명약칭"]),
    the2: IdClass.fromJson(json["제명변경여부"]),
    the5: IdClass.fromJson(json["한글법령여부"]),
    the4: IdClass.fromJson(json["편장절관"]),
    ambitious: Sticky.fromJson(json["소관부처"]),
    braggadocious: IdClass.fromJson(json["전화번호"]),
    cunning: IdClass.fromJson(json["시행일자"]),
    the1: IdClass.fromJson(json["제개정구분"]),
    the3: IdClass.fromJson(json["제안구분"]),
    mischievous: IdClass.fromJson(json["의결구분"]),
    hilarious: IdClass.fromJson(json["별표편집여부"]),
    purple: IdClass.fromJson(json["공포법령여부"]),
    frisky: Indigo.fromJson(json["연락부서"]),
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
    "제명변경여부": the2.toJson(),
    "한글법령여부": the5.toJson(),
    "편장절관": the4.toJson(),
    "소관부처": ambitious.toJson(),
    "전화번호": braggadocious.toJson(),
    "시행일자": cunning.toJson(),
    "제개정구분": the1.toJson(),
    "제안구분": the3.toJson(),
    "의결구분": mischievous.toJson(),
    "별표편집여부": hilarious.toJson(),
    "공포법령여부": purple.toJson(),
    "연락부서": frisky.toJson(),
  };
}

class Sticky {
  Sticky({
    required this.attributes,
    required this.text,
  });

  PurpleAttributes attributes;
  String text;

  factory Sticky.fromJson(Map<String, dynamic> json) => Sticky(
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

class Indigo {
  Indigo({
    required this.empty,
  });

  Indecent empty;

  factory Indigo.fromJson(Map<String, dynamic> json) => Indigo(
    empty: Indecent.fromJson(json["부서단위"]),
  );

  Map<String, dynamic> toJson() => {
    "부서단위": empty.toJson(),
  };
}

class Indecent {
  Indecent({
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

  factory Indecent.fromJson(Map<String, dynamic> json) => Indecent(
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

class Tentacled {
  Tentacled({
    required this.attributes,
    required this.text,
  });

  AttributesClass attributes;
  String text;

  factory Tentacled.fromJson(Map<String, dynamic> json) => Tentacled(
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

class Cunning {
  Cunning({
    required this.empty,
  });

  List<Magenta> empty;

  factory Cunning.fromJson(Map<String, dynamic> json) => Cunning(
    empty: List<Magenta>.from(json["조문단위"].map((x) => Magenta.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "조문단위": List<dynamic>.from(empty.map((x) => x.toJson())),
  };
}

class Magenta {
  Magenta({
    required this.attributes,
    required this.fluffy,
    required this.indigo,
    required this.sticky,
    required this.indecent,
    required this.hilarious,
    required this.tentacled,
    required this.purple,
    this.magenta,
    this.ambitious,
    this.cunning,
    this.mischievous,
    this.frisky,
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
  Value? magenta;
  IdClass? ambitious;
  Value? cunning;
  dynamic mischievous;
  Value? frisky;
  IdClass? empty;

  factory Magenta.fromJson(Map<String, dynamic> json) => Magenta(
    attributes: StickyAttributes.fromJson(json["_attributes"]),
    fluffy: IdClass.fromJson(json["조문번호"]),
    indigo: IdClass.fromJson(json["조문여부"]),
    sticky: IdClass.fromJson(json["조문시행일자"]),
    indecent: IdClass.fromJson(json["조문이동이전"]),
    hilarious: IdClass.fromJson(json["조문이동이후"]),
    tentacled: IdClass.fromJson(json["조문변경여부"]),
    purple: Value.fromJson(json["조문내용"]),
    magenta: json["조문제목"] == null ? null : Value.fromJson(json["조문제목"]),
    ambitious: json["조문제개정유형"] == null ? null : IdClass.fromJson(json["조문제개정유형"]),
    cunning: json["조문제개정일자문자열"] == null ? null : Value.fromJson(json["조문제개정일자문자열"]),
    mischievous: json["항"],
    frisky: json["조문참고자료"] == null ? null : Value.fromJson(json["조문참고자료"]),
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
    "조문제목": magenta?.toJson(),
    "조문제개정유형": ambitious?.toJson(),
    "조문제개정일자문자열": cunning?.toJson(),
    "항": mischievous,
    "조문참고자료": frisky?.toJson(),
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

class Frisky {
  Frisky({
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
  List<Map<String, Value>>? sticky;

  factory Frisky.fromJson(Map<String, dynamic> json) => Frisky(
    purple: Value.fromJson(json["항번호"]),
    empty: Value.fromJson(json["항내용"]),
    fluffy: json["항제개정유형"] == null ? null : IdClass.fromJson(json["항제개정유형"]),
    tentacled: json["항제개정일자문자열"] == null ? null : IdClass.fromJson(json["항제개정일자문자열"]),
    sticky: json["호"] == null ? [] : List<Map<String, Value>>.from(json["호"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, Value>(k, Value.fromJson(v))))),
  );

  Map<String, dynamic> toJson() => {
    "항번호": purple.toJson(),
    "항내용": empty.toJson(),
    "항제개정유형": fluffy?.toJson(),
    "항제개정일자문자열": tentacled?.toJson(),
    "호": sticky == null ? [] : List<dynamic>.from(sticky!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
  };
}

class Mischievous {
  Mischievous({
    required this.empty,
  });

  List<Braggadocious> empty;

  factory Mischievous.fromJson(Map<String, dynamic> json) => Mischievous(
    empty: List<Braggadocious>.from(json["호"].map((x) => Braggadocious.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "호": List<dynamic>.from(empty.map((x) => x.toJson())),
  };
}

class Braggadocious {
  Braggadocious({
    required this.fluffy,
    required this.purple,
    this.empty,
  });

  Value fluffy;
  Value purple;
  List<Map<String, Value>>? empty;

  factory Braggadocious.fromJson(Map<String, dynamic> json) => Braggadocious(
    fluffy: Value.fromJson(json["호번호"]),
    purple: Value.fromJson(json["호내용"]),
    empty: json["목"] == null ? [] : List<Map<String, Value>>.from(json["목"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, Value>(k, Value.fromJson(v))))),
  );

  Map<String, dynamic> toJson() => {
    "호번호": fluffy.toJson(),
    "호내용": purple.toJson(),
    "목": empty == null ? [] : List<dynamic>.from(empty!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
  };
}

class Ambitious {
  Ambitious({
    required this.empty,
  });

  Purple empty;

  factory Ambitious.fromJson(Map<String, dynamic> json) => Ambitious(
    empty: Purple.fromJson(json["제개정이유내용"]),
  );

  Map<String, dynamic> toJson() => {
    "제개정이유내용": empty.toJson(),
  };
}
