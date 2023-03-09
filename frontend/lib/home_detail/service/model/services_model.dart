import 'package:json_annotation/json_annotation.dart';

// Main Model
class ServicesModel {
  // 법령 - 기본 정보 - 시행일자
  final String enforcement_date;

  // 법령 - 기본 정보 - 법령명_한글
  final String title;

  Provision provision;

  ServicesModel({
    required this.title,
    required this.enforcement_date,
    required this.provision,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
        title : json['법령']['기본정보']['법령명_한글']['_cdata'],
        enforcement_date : json['법령']['기본정보']['시행일자']['_text'],
        provision : Provision.fromJson(json['법령']['조문']['조문단위'])
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "법령명_한글": title,
        '시행일자': enforcement_date,
        '조문': provision,
      };
}

// 조문 클래스
class Provision {
  // 법령 - 조문 - 조문내용
  final String provision_content;

  // 법령 - 조문 - 조문시행일자
  final String provision_date;

  // 법령 - 조문 - 항
  ProvisionSection provisionSection;

  Provision({
    required this.provisionSection,
    required this.provision_content,
    required this.provision_date,
  });

  factory Provision.fromJson(Map<String, dynamic> json) {
    return Provision(
        provision_content: json['조문내용']['_cdata'] as String,
        provision_date: json['조문시행일자']['_text'] as String,
        provisionSection: ProvisionSection.fromJson(json['조문단위']['항'])
    );
  }

  Map<String, dynamic> toJson() =>
      {
        '조문내용': provision_content,
        '조문시행일자': provision_content,
        '항': provisionSection
      };
}

// 조문 - 항 클래스
class ProvisionSection {
  // 조문 내용
  final String section_content;

  // 호
  SectionNo sectionNo;

  ProvisionSection({
    required this.sectionNo,
    required this.section_content,
  });

  factory ProvisionSection.fromJson(Map<String, dynamic> json) {
    return ProvisionSection(
        section_content: json['항내용']['_cdata'],
        sectionNo: SectionNo.fromJson(json['호'])
    );
  }

  Map<String, dynamic> toJson() =>
      {
        '항내용': section_content,
        '호': sectionNo,
      };
}

// 항 - 호 클래스
class SectionNo {
  String no_content;

  SectionNo({required this.no_content});

  factory SectionNo.fromJson(Map<String, dynamic> json) {
    return SectionNo(
        no_content: json['호내용']['_cdata'] as String
    );
  }

  Map<String, dynamic> toJson() =>
      {
        '호내용': no_content,
      };
}
