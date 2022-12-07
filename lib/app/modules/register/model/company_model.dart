// To parse this JSON data, do
//
//     final company = companyFromJson(jsonString);

import 'dart:convert';

Company companyFromJson(String str) => Company.fromJson(json.decode(str));

String companyToJson(Company data) => json.encode(data.toJson());

class Company {
  Company({
    this.status,
    this.totalCompanyName,
    required this.companyName,
  });

  int? status;
  int? totalCompanyName;
  List<CompanyName> companyName;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    status: json["status"],
    totalCompanyName: json["total_company_name"],
    companyName: List<CompanyName>.from(json["company_name"].map((x) => CompanyName.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total_company_name": totalCompanyName,
    "company_name": List<dynamic>.from(companyName.map((x) => x.toJson())),
  };
}

class CompanyName {
  CompanyName({
    this.id,
    this.companyName,
  });

  int? id;
  String? companyName;

  factory CompanyName.fromJson(Map<String, dynamic> json) => CompanyName(
    id: json["id"],
    companyName: json["company_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_name": companyName,
  };
}
