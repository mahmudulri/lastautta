
import 'dart:convert';

JobDepartment jobDepartmentFromJson(String str) => JobDepartment.fromJson(json.decode(str));

String jobDepartmentToJson(JobDepartment data) => json.encode(data.toJson());

class JobDepartment {
  JobDepartment({
    this.status,
    this.totalDepartments,
    required this.department,
  });

  int? status;
  int? totalDepartments;
  List<Department> department;

  factory JobDepartment.fromJson(Map<String, dynamic> json) => JobDepartment(
    status: json["status"],
    totalDepartments: json["total_departments"],
    department: List<Department>.from(json["department"].map((x) => Department.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total_departments": totalDepartments,
    "department": List<dynamic>.from(department.map((x) => x.toJson())),
  };
}

class Department {
  Department({
    this.id,
    this.departmentName,

  });

  int? id;
  String? departmentName;


  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    departmentName: json["department_name"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "department_name": departmentName,
  };
}

