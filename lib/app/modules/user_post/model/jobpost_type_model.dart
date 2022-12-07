// To parse this JSON data, do
//
//     final jobPostType = jobPostTypeFromJson(jsonString);

import 'dart:convert';

JobPostType jobPostTypeFromJson(String str) => JobPostType.fromJson(json.decode(str));

String jobPostTypeToJson(JobPostType data) => json.encode(data.toJson());

class JobPostType {
  JobPostType({
    this.status,
    this.count,
    required this.jobType,
  });

  int? status;
  int? count;
  List<JobType> jobType;

  factory JobPostType.fromJson(Map<String, dynamic> json) => JobPostType(
    status: json["status"],
    count: json["count"],
    jobType: List<JobType>.from(json["job_type"].map((x) => JobType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "count": count,
    "job_type": List<dynamic>.from(jobType.map((x) => x.toJson())),
  };
}


class JobType {
  JobType({
    this.id,
    this.typeName,

  });

  int? id;
  String? typeName;


  factory JobType.fromJson(Map<String, dynamic> json) => JobType(
    id: json["id"],
    typeName: json["type_name"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type_name": typeName,
  };
}

