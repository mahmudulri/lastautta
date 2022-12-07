//
// import 'dart:convert';
//
// EventModel eventFromJson(String str) => EventModel.fromJson(json.decode(str));
//
// String eventToJson(EventModel data) => json.encode(data.toJson());
//
// class EventModel {
//   EventModel({
//     this.status,
//     this.allEvents,
//   });
//
//   int? status;
//   List<AllEvent>? allEvents;
//
//   factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
//     status: json["status"],
//     allEvents: List<AllEvent>.from(json["all_events"].map((x) => AllEvent.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "all_events": List<dynamic>.from(allEvents!.map((x) => x.toJson())),
//   };
// }
//
// class AllEvent {
//   AllEvent({
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
//     this.createdAt,
//     this.eventTypeName,
//     this.createdBy,
//   });
//
//   int? id;
//   String? eventTypeId;
//   String? eventTitle;
//   String? postedBy;
//   dynamic updatedBy;
//   String? eventDescription;
//   String? contactPerson;
//   String? image;
//   String? eventTime;
//   String? eventDate;
//   String? eventFee;
//   String? priority;
//   int? paymentType;
//   int? showMobile;
//   int? showDesktop;
//   String? createdAt;
//   String? eventTypeName;
//   dynamic createdBy;
//
//   factory AllEvent.fromJson(Map<String, dynamic> json) => AllEvent(
//     id: json["id"],
//     eventTypeId: json["event_type_id"],
//     eventTitle: json["event_title"],
//     postedBy: json["posted_by"],
//     updatedBy: json["updated_by"],
//     eventDescription: json["event_description"],
//     contactPerson: json["contact_person"],
//     image: json["image"],
//     eventTime: json["event_time"],
//     eventDate: json["event_date"],
//     eventFee: json["event_fee"] == null ? null : json["event_fee"],
//     priority: json["priority"],
//     paymentType: json["payment_type"],
//     showMobile: json["showMobile"],
//     showDesktop: json["showDesktop"],
//     createdAt: json["created_at"],
//     eventTypeName: json["event_type_name"],
//     createdBy: json["created_by"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "event_type_id": eventTypeId,
//     "event_title": eventTitle,
//     "posted_by": postedBy,
//     "updated_by": updatedBy,
//     "event_description": eventDescription,
//     "contact_person": contactPerson,
//     "image": image,
//     "event_time": eventTime,
//     "event_date": eventDate,
//     "event_fee": eventFee == null ? null : eventFee,
//     "priority": priority,
//     "payment_type": paymentType,
//     "showMobile": showMobile,
//     "showDesktop": showDesktop,
//     "created_at": createdAt,
//     "event_type_name": eventTypeName,
//     "created_by": createdBy,
//   };
// }

// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

EventModel eventModelFromJson(String str) => EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
  EventModel({
    this.status,
    this.allEvents,
    this.totalEvents,
    this.totalArchiveEvents,
  });

  int? status;
  List<AllEvent>? allEvents;
  int? totalEvents;
  int? totalArchiveEvents;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    status: json["status"],
    allEvents: List<AllEvent>.from(json["all_events"].map((x) => AllEvent.fromJson(x))),
    totalEvents: json["total_events"],
    totalArchiveEvents: json["total_archive_events"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "all_events": List<dynamic>.from(allEvents!.map((x) => x.toJson())),
    "total_events": totalEvents,
    "total_archive_events": totalArchiveEvents,
  };
}

// class AllEvent {
//   AllEvent({
//     this.eventTitle,
//     this.eventDescription,
//     this.image,
//     this.eventTime,
//     this.eventDate,
//     this.eventFee,
//     this.priority,
//     this.paymentType,
//     this.isArchived,
//     this.createdAt,
//     this.eventTypeName,
//   });
//
//
//   String? eventTitle;
//   String? eventDescription;
//   String? image;
//   String? eventTime;
//   String? eventDate;
//   String? eventFee;
//   String? priority;
//   String? paymentType;
//   String? isArchived;
//   String? createdAt;
//   String? eventTypeName;
//
//   factory AllEvent.fromJson(Map<String, dynamic> json) => AllEvent(
//     eventTitle: json["event_title"],
//     eventDescription: json["event_description"],
//     image: json["image"],
//     eventTime: json["event_time"],
//     eventDate: json["event_date"],
//     eventFee: json["event_fee"],
//     priority: json["priority"],
//     paymentType: json["payment_type"],
//     isArchived: json["isArchived"],
//     createdAt: json["created_at"],
//     eventTypeName: json["event_type_name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "event_title": eventTitle,
//     "event_description": eventDescription,
//     "image": image,
//     "event_time": eventTime,
//     "event_date": eventDate,
//     "event_fee": eventFee,
//     "priority": priority,
//     "payment_type": paymentType,
//     "isArchived": isArchived,
//     "created_at": createdAt,
//     "event_type_name": eventTypeName,
//   };
// }

AllEvent allEventFromJson(String str) => AllEvent.fromJson(json.decode(str));

String allEventToJson(AllEvent data) => json.encode(data.toJson());

class AllEvent {
  AllEvent({
    this.id,
    this.eventTypeId,
    this.eventTitle,
    this.postedBy,
    this.eventDescription,
    this.contactPerson,
    this.image,
    this.eventTime,
    this.eventDate,
    this.eventFee,
    this.priority,
    this.paymentType,
    this.showMobile,
    this.showBanner,
    this.showDesktop,
    this.isArchived,
    this.createdAt,
    this.eventTypeName,
  });

  int? id;
  String? eventTypeId;
  String? eventTitle;
  String? postedBy;
  String? eventDescription;
  String? contactPerson;
  String? image;
  String? eventTime;
  String? eventDate;
  String? eventFee;
  String? priority;
  int? paymentType;
  int? showMobile;
  String? showBanner;
  int? showDesktop;
  int? isArchived;
  String? createdAt;
  String? eventTypeName;

  factory AllEvent.fromJson(Map<String, dynamic> json) => AllEvent(
    id: json["id"],
    eventTypeId: json["event_type_id"],
    eventTitle: json["event_title"],
    postedBy: json["posted_by"],
    eventDescription: json["event_description"],
    contactPerson: json["contact_person"],
    image: json["image"],
    eventTime: json["event_time"],
    eventDate: json["event_date"],
    eventFee: json["event_fee"],
    priority: json["priority"],
    paymentType: json["payment_type"],
    showMobile: json["showMobile"],
    showBanner: json["showBanner"],
    showDesktop: json["showDesktop"],
    isArchived: json["isArchived"],
    createdAt: json["created_at"],
    eventTypeName: json["event_type_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "event_type_id": eventTypeId,
    "event_title": eventTitle,
    "posted_by": postedBy,
    "event_description": eventDescription,
    "contact_person": contactPerson,
    "image": image,
    "event_time": eventTime,
    "event_date": eventDate,
    "event_fee": eventFee,
    "priority": priority,
    "payment_type": paymentType,
    "showMobile": showMobile,
    "showBanner": showBanner,
    "showDesktop": showDesktop,
    "isArchived": isArchived,
    "created_at": createdAt,
    "event_type_name": eventTypeName,
  };
}


