// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsonString);

import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) => UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  UserInfoModel({
    this.status,
    this.payDate,
    this.registrationPayValidity,
    this.userInfo,
  });

  int? status;
  dynamic payDate;
  int? registrationPayValidity;
  UserInfo? userInfo;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
    status: json["status"],
    payDate: json["pay_date"],
    registrationPayValidity: json["registration_pay_validity"],
    userInfo: UserInfo.fromJson(json["user_info"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "pay_date": payDate,
    "registration_pay_validity": registrationPayValidity,
    "user_info": userInfo!.toJson(),
  };
}

class UserInfo {
  UserInfo({
    this.id,
    this.fullName,
    this.nickName,
    this.email,
    this.phoneNo,
    this.batch,
    this.bloodGroup,
    this.stream,
    this.userRole,
    this.jobSector,
    this.jobSubSector,
    this.officeEmail,
    this.officeAddress,
    this.nameOfCompany,
    this.presentAddress,
    this.permanentAddress,
    this.image,
    this.emailVerifiedAt,
    this.otpVerify,
    this.deviceToken,
    this.confirmPassword,
  });

  int? id;
  String? fullName;
  String? nickName;
  String? email;
  String? phoneNo;
  String? batch;
  String? bloodGroup;
  String? stream;
  String? userRole;
  String? jobSector;
  String? jobSubSector;
  String? officeEmail;
  String? officeAddress;
  String? nameOfCompany;
  String? presentAddress;
  String? permanentAddress;
  String? image;
  dynamic emailVerifiedAt;
  dynamic otpVerify;
  String? deviceToken;
  String? confirmPassword;


  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    fullName: json["full_name"],
    nickName: json["nick_name"],
    email: json["email"],
    phoneNo: json["phone_no"],
    batch: json["batch"],
    bloodGroup: json["blood_group"],
    stream: json["stream"],
    userRole: json["user_role"],
    jobSector: json["job_sector"],
    jobSubSector: json["job_sub_sector"],
    officeEmail: json["office_email"],
    officeAddress: json["office_address"],
    nameOfCompany: json["name_of_company"],
    presentAddress: json["present_address"],
    permanentAddress: json["permanent_address"],
    image: json["image"],
    emailVerifiedAt: json["email_verified_at"],
    otpVerify: json["otp_verify"],
    deviceToken: json["device_token"],
    confirmPassword: json["confirm_password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "nick_name": nickName,
    "email": email,
    "phone_no": phoneNo,
    "batch": batch,
    "blood_group": bloodGroup,
    "stream": stream,
    "user_role": userRole,
    "job_sector": jobSector,
    "job_sub_sector": jobSubSector,
    "office_email": officeEmail,
    "office_address": officeAddress,
    "name_of_company": nameOfCompany,
    "present_address": presentAddress,
    "permanent_address": permanentAddress,
    "image": image,
    "email_verified_at": emailVerifiedAt,
    "otp_verify": otpVerify,
    "device_token": deviceToken,
    "confirm_password": confirmPassword,
  };
}
