
//
// import 'dart:convert';
//
// BannerModel bannerFromJson(String str) => BannerModel.fromJson(json.decode(str));
//
// String bannerToJson(BannerModel data) => json.encode(data.toJson());
//
// class BannerModel {
//   BannerModel({
//     this.status,
//     this.merged,
//   });
//
//   int? status;
//   List<Merged>? merged;
//
//   factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
//     status: json["status"],
//     merged: List<Merged>.from(json["merged"].map((x) => Merged.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "merged": List<dynamic>.from(merged!.map((x) => x.toJson())),
//   };
// }
//
// class Merged {
//   Merged({
//     this.id,
//     this.eventTypeId,
//     this.eventTitle,
//     this.postedBy,
//     this.updatedBy,
//     this.eventDescription,
//     this.contactPerson,
//     this.image,
//     this.eventTime,
//     this.eventDate,
//     this.eventFee,
//     this.priority,
//     this.paymentType,
//     this.showMobile,
//     this.showDesktop,
//     this.isArchived,
//     this.createdAt,
//     this.advertisementTitle,
//     this.advertisementDescription,
//     this.advertisementFee,
//     this.redirectLink,
//
//   });
//
//   int? id;
//   String? eventTypeId;
//   String? eventTitle;
//   String? postedBy;
//   String? updatedBy;
//   String? eventDescription;
//   String? contactPerson;
//   String? image;
//   String? eventTime;
//   String?  eventDate;
//   String? eventFee;
//   String? priority;
//   dynamic paymentType;
//   int? showMobile;
//   int? showDesktop;
//   int? isArchived;
//   String? createdAt;
//   String? advertisementTitle;
//   String? advertisementDescription;
//   String? advertisementFee;
//   String? redirectLink;
//
//
//   factory Merged.fromJson(Map<String, dynamic> json) => Merged(
//     id: json["id"],
//     eventTypeId: json["event_type_id"] == null ? null : json["event_type_id"],
//     eventTitle: json["event_title"] == null ? null : json["event_title"],
//     postedBy: json["posted_by"],
//     updatedBy: json["updated_by"] == null ? null : json["updated_by"],
//     eventDescription: json["event_description"] == null ? null : json["event_description"],
//     contactPerson: json["contact_person"] == null ? null : json["contact_person"],
//     image: json["image"],
//     eventTime: json["event_time"] == null ? null : json["event_time"],
//     eventDate: json["event_date"] == null ? null : json["event_date"],
//     eventFee: json["event_fee"] == null ? null : json["event_fee"],
//     priority: json["priority"] == null ? null : json["priority"],
//     paymentType: json["payment_type"],
//     showMobile: json["showMobile"],
//     showDesktop: json["showDesktop"],
//     isArchived: json["isArchived"] == null ? null : json["isArchived"],
//     createdAt: json["created_at"],
//     advertisementTitle: json["advertisement_title"] == null ? null : json["advertisement_title"],
//     advertisementDescription: json["advertisement_description"] == null ? null : json["advertisement_description"],
//     advertisementFee: json["advertisement_fee"] == null ? null : json["advertisement_fee"],
//     redirectLink: json["redirect_link"] == null ? null : json["redirect_link"],
//
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "event_type_id": eventTypeId == null ? null : eventTypeId,
//     "event_title": eventTitle == null ? null : eventTitle,
//     "posted_by": postedBy,
//     "updated_by": updatedBy == null ? null : updatedBy,
//     "event_description": eventDescription == null ? null : eventDescription,
//     "contact_person": contactPerson == null ? null : contactPerson,
//     "image": image,
//     "event_time": eventTime == null ? null : eventTime,
//     "event_date": eventDate == null ? null : eventDate,
//     "event_fee": eventFee == null ? null : eventFee,
//     "priority": priority == null ? null : priority,
//     "payment_type": paymentType,
//     "showMobile": showMobile,
//     "showDesktop": showDesktop,
//     "isArchived": isArchived == null ? null : isArchived,
//     "created_at": createdAt,
//     "advertisement_title": advertisementTitle == null ? null : advertisementTitle,
//     "advertisement_description": advertisementDescription == null ? null : advertisementDescription,
//     "advertisement_fee": advertisementFee == null ? null : advertisementFee,
//     "redirect_link": redirectLink == null ? null : redirectLink,
//   };
// }

// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    this.status,
    this.banner,
  });

  int? status;
  List<Banner>? banner;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    status: json["status"],
    banner: List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "banner": List<dynamic>.from(banner!.map((x) => x.toJson())),
  };
}

class Banner {
  Banner({

    this.eventTitle,
    this.eventDescription,
    this.image,
    this.eventTime,
    this.eventDate,
    this.eventFee,
    this.bannerTitle,
    this.bannerDescription,
  });

  String? eventTitle;
  String? eventDescription;
  String? image;
  String? eventTime;
  String? eventDate;
  String? eventFee;
  String? bannerTitle;
  String? bannerDescription;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    eventTitle: json["event_title"] == null ? null : json["event_title"],
    eventDescription: json["event_description"] == null ? null : json["event_description"],
    image: json["image"],
    eventTime: json["event_time"] == null ? null : json["event_time"],
    eventDate: json["event_date"] == null ? null : json["event_date"],
    eventFee: json["event_fee"] == null ? null : json["event_fee"],
    bannerTitle: json["banner_title"] == null ? null : json["banner_title"],
    bannerDescription: json["banner_description"] == null ? null : json["banner_description"],
  );

  Map<String, dynamic> toJson() => {
    "event_title": eventTitle == null ? null : eventTitle,
    "event_description": eventDescription == null ? null : eventDescription,
    "image": image,
    "event_time": eventTime == null ? null : eventTime,
    "event_date": eventDate == null ? null : eventDate,
    "event_fee": eventFee == null ? null : eventFee,
    "banner_title": bannerTitle == null ? null : bannerTitle,
    "banner_description": bannerDescription == null ? null : bannerDescription,
  };
}

