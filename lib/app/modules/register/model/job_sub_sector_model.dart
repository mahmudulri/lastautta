// To parse this JSON data, do
//
//     final jobSubSector = jobSubSectorFromJson(jsonString);

import 'dart:convert';

JobSubSector jobSubSectorFromJson(String str) => JobSubSector.fromJson(json.decode(str));

String jobSubSectorToJson(JobSubSector data) => json.encode(data.toJson());

class JobSubSector {
  JobSubSector({
    this.status,
    required this.jobSubSectors,
  });

  int? status;
  List<JobSubSectorElement> jobSubSectors;

  factory JobSubSector.fromJson(Map<String, dynamic> json) => JobSubSector(
    status: json["status"],
    jobSubSectors: List<JobSubSectorElement>.from(json["job_sub_sectors"].map((x) => JobSubSectorElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "job_sub_sectors": List<dynamic>.from(jobSubSectors.map((x) => x.toJson())),
  };
}

class JobSubSectorElement {
  JobSubSectorElement({
    this.id,
    this.jobSectorId,
    this.jobSubSectorId,
    this.jobSectorName,
    this.jobSubSectorName,
  });

  int? id;
  String? jobSectorId;
  String? jobSubSectorId;
  String? jobSectorName;
  String? jobSubSectorName;

  factory JobSubSectorElement.fromJson(Map<String, dynamic> json) => JobSubSectorElement(
    id: json["id"],
    jobSectorId: json["job_sector_id"],
    jobSubSectorId: json["job_sub_sector_id"],
    jobSectorName: json["job_sector_name"],
    jobSubSectorName: json["job_sub_sector_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "job_sector_id": jobSectorId,
    "job_sub_sector_id": jobSubSectorId,
    "job_sector_name": jobSectorName,
    "job_sub_sector_name": jobSubSectorName,
  };
}
