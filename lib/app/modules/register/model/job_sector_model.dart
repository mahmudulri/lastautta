// To parse this JSON data, do
//
//     final jobSector = jobSectorFromJson(jsonString);

import 'dart:convert';

JobSector jobSectorFromJson(String str) => JobSector.fromJson(json.decode(str));

String jobSectorToJson(JobSector data) => json.encode(data.toJson());

class JobSector {
  JobSector({
    this.status,
    this.totalJobSector,
    required this.jobSector,
  });

  int? status;
  int? totalJobSector;
  List<JobSectorElement> jobSector;

  factory JobSector.fromJson(Map<String, dynamic> json) => JobSector(
    status: json["status"],
    totalJobSector: json["total_job_sector"],
    jobSector: List<JobSectorElement>.from(json["job_sector"].map((x) => JobSectorElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total_job_sector": totalJobSector,
    "job_sector": List<dynamic>.from(jobSector.map((x) => x.toJson())),
  };
}

class JobSectorElement {
  JobSectorElement({
    this.id,
    this.jobSectorName,
  });

  int? id;
  String? jobSectorName;

  factory JobSectorElement.fromJson(Map<String, dynamic> json) => JobSectorElement(
    id: json["id"],
    jobSectorName: json["job_sector_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "job_sector_name": jobSectorName,
  };
}
