import 'dart:convert';

class Retirement {
  Retirement({
    required this.declaration,
    required this.empty,
  });

  Declaration declaration;
  Empty empty;

  factory Retirement.fromRawJson(String str) => Retirement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Retirement.fromJson(Map<String, dynamic> json) => Retirement(
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

  factory Declaration.fromRawJson(String str) => Declaration.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory DeclarationAttributes.fromRawJson(String str) => DeclarationAttributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory Empty.fromRawJson(String str) => Empty.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory Attributes.fromRawJson(String str) => Attributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory Class.fromRawJson(String str) => Class.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory Purple.fromRawJson(String str) => Purple.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory Hilarious.fromRawJson(String str) => Hilarious.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory Element.fromRawJson(String str) => Element.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory TentacledAttributes.fromRawJson(String str) => TentacledAttributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory IdClass.fromRawJson(String str) => IdClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
    required this.the3,
    required this.the2,
    required this.ambitious,
    required this.mischievous,
    required this.cunning,
    required this.braggadocious,
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
  IdClass the1;
  IdClass the3;
  IdClass the2;
  Sticky ambitious;
  IdClass mischievous;
  IdClass cunning;
  IdClass braggadocious;
  IdClass hilarious;
  IdClass purple;
  Indigo frisky;

  factory Fluffy.fromRawJson(String str) => Fluffy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Fluffy.fromJson(Map<String, dynamic> json) => Fluffy(
    id: IdClass.fromJson(json["법령ID"]),
    fluffy: IdClass.fromJson(json["공포일자"]),
    empty: IdClass.fromJson(json["공포번호"]),
    magenta: IdClass.fromJson(json["언어"]),
    indecent: Tentacled.fromJson(json["법종구분"]),
    tentacled: Value.fromJson(json["법령명_한글"]),
    sticky: Value.fromJson(json["법령명_한자"]),
    indigo: Value.fromJson(json["법령명약칭"]),
    the1: IdClass.fromJson(json["제명변경여부"]),
    the3: IdClass.fromJson(json["한글법령여부"]),
    the2: IdClass.fromJson(json["편장절관"]),
    ambitious: Sticky.fromJson(json["소관부처"]),
    mischievous: IdClass.fromJson(json["전화번호"]),
    cunning: IdClass.fromJson(json["시행일자"]),
    braggadocious: IdClass.fromJson(json["제개정구분"]),
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
    "제명변경여부": the1.toJson(),
    "한글법령여부": the3.toJson(),
    "편장절관": the2.toJson(),
    "소관부처": ambitious.toJson(),
    "전화번호": mischievous.toJson(),
    "시행일자": cunning.toJson(),
    "제개정구분": braggadocious.toJson(),
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

  factory Sticky.fromRawJson(String str) => Sticky.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory PurpleAttributes.fromRawJson(String str) => PurpleAttributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory Indigo.fromRawJson(String str) => Indigo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory Indecent.fromRawJson(String str) => Indecent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory FluffyAttributes.fromRawJson(String str) => FluffyAttributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory Tentacled.fromRawJson(String str) => Tentacled.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory AttributesClass.fromRawJson(String str) => AttributesClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory Value.fromRawJson(String str) => Value.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

  factory Cunning.fromRawJson(String str) => Cunning.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
    this.ambitious,
    this.magenta,
    this.cunning,
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
  dynamic magenta;
  Value? cunning;
  IdClass? empty;

  factory Magenta.fromRawJson(String str) => Magenta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Magenta.fromJson(Map<String, dynamic> json) => Magenta(
    attributes: StickyAttributes.fromJson(json["_attributes"]),
    fluffy: IdClass.fromJson(json["조문번호"]),
    indigo: IdClass.fromJson(json["조문여부"]),
    sticky: IdClass.fromJson(json["조문시행일자"]),
    indecent: IdClass.fromJson(json["조문이동이전"]),
    hilarious: IdClass.fromJson(json["조문이동이후"]),
    tentacled: IdClass.fromJson(json["조문변경여부"]),
    purple: Value.fromJson(json["조문내용"]),
    ambitious: json["조문제목"] == null ? null : Value.fromJson(json["조문제목"]),
    magenta: json["항"],
    cunning: json["조문참고자료"] == null ? null : Value.fromJson(json["조문참고자료"]),
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
    "항": magenta,
    "조문참고자료": cunning?.toJson(),
    "조문가지번호": empty?.toJson(),
  };
}

class StickyAttributes {
  StickyAttributes({
    required this.empty,
  });

  String empty;

  factory StickyAttributes.fromRawJson(String str) => StickyAttributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
    this.sticky,
    this.fluffy,
    this.tentacled,
  });

  Value purple;
  Value empty;
  List<Mischievous>? sticky;
  IdClass? fluffy;
  IdClass? tentacled;

  factory Frisky.fromRawJson(String str) => Frisky.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Frisky.fromJson(Map<String, dynamic> json) => Frisky(
    purple: Value.fromJson(json["항번호"]),
    empty: Value.fromJson(json["항내용"]),
    sticky: json["호"] == null ? [] : List<Mischievous>.from(json["호"]!.map((x) => Mischievous.fromJson(x))),
    fluffy: json["항제개정유형"] == null ? null : IdClass.fromJson(json["항제개정유형"]),
    tentacled: json["항제개정일자문자열"] == null ? null : IdClass.fromJson(json["항제개정일자문자열"]),
  );

  Map<String, dynamic> toJson() => {
    "항번호": purple.toJson(),
    "항내용": empty.toJson(),
    "호": sticky == null ? [] : List<dynamic>.from(sticky!.map((x) => x.toJson())),
    "항제개정유형": fluffy?.toJson(),
    "항제개정일자문자열": tentacled?.toJson(),
  };
}

class Mischievous {
  Mischievous({
    required this.tentacled,
    required this.fluffy,
    this.purple,
    this.empty,
  });

  Value tentacled;
  Value fluffy;
  Value? purple;
  List<Map<String, Value>>? empty;

  factory Mischievous.fromRawJson(String str) => Mischievous.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mischievous.fromJson(Map<String, dynamic> json) => Mischievous(
    tentacled: Value.fromJson(json["호번호"]),
    fluffy: Value.fromJson(json["호내용"]),
    purple: json["호가지번호"] == null ? null : Value.fromJson(json["호가지번호"]),
    empty: json["목"] == null ? [] : List<Map<String, Value>>.from(json["목"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, Value>(k, Value.fromJson(v))))),
  );

  Map<String, dynamic> toJson() => {
    "호번호": tentacled.toJson(),
    "호내용": fluffy.toJson(),
    "호가지번호": purple?.toJson(),
    "목": empty == null ? [] : List<dynamic>.from(empty!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
  };
}

class Braggadocious {
  Braggadocious({
    required this.empty,
  });

  List<Mischievous> empty;

  factory Braggadocious.fromRawJson(String str) => Braggadocious.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Braggadocious.fromJson(Map<String, dynamic> json) => Braggadocious(
    empty: List<Mischievous>.from(json["호"].map((x) => Mischievous.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "호": List<dynamic>.from(empty.map((x) => x.toJson())),
  };
}

class Ambitious {
  Ambitious({
    required this.empty,
  });

  Purple empty;

  factory Ambitious.fromRawJson(String str) => Ambitious.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ambitious.fromJson(Map<String, dynamic> json) => Ambitious(
    empty: Purple.fromJson(json["제개정이유내용"]),
  );

  Map<String, dynamic> toJson() => {
    "제개정이유내용": empty.toJson(),
  };
}
