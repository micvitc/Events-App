// To parse this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

import 'dart:convert';

List<EventsModel> eventsModelFromJson(String str) => List<EventsModel>.from(
    json.decode(str).map((x) => EventsModel.fromJson(x)));

String eventsModelToJson(List<EventsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventsModel {
  EventsModel({
    required this.id,
    required this.eventId,
    required this.eventName,
    required this.eventDate,
    required this.eventVenue,
    required this.eventHost,
    required this.eventCoordinators,
    required this.schoolName,
  });

  Id id;
  String eventId;
  dynamic eventName;
  EventDate eventDate;
  String eventVenue;
  List<String> eventHost;
  List<EventCoordinator> eventCoordinators;
  String schoolName;

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        id: Id.fromJson(json["_id"]),
        eventId: json["event_id"],
        eventName: json["event_name"],
        eventDate: EventDate.fromJson(json["event_date"]),
        eventVenue: json["event_venue"],
        eventHost: List<String>.from(json["event_host"].map((x) => x)),
        eventCoordinators: List<EventCoordinator>.from(
            json["event_coordinators"]
                .map((x) => eventCoordinatorValues.map[x])),
        schoolName: json["school_name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "event_id": eventId,
        "event_name": eventName,
        "event_date": eventDate.toJson(),
        "event_venue": eventVenue,
        "event_host": List<dynamic>.from(eventHost.map((x) => x)),
        "event_coordinators": List<dynamic>.from(
            eventCoordinators.map((x) => eventCoordinatorValues.reverse[x])),
        "school_name": schoolName,
      };
}

enum EventCoordinator { A, B, C }

final eventCoordinatorValues = EnumValues({
  "A": EventCoordinator.A,
  "B": EventCoordinator.B,
  "C": EventCoordinator.C
});

class EventDate {
  EventDate({
    required this.date,
  });

  Date date;

  factory EventDate.fromJson(Map<String, dynamic> json) => EventDate(
        date: Date.fromJson(json["\u0024date"]),
      );

  Map<String, dynamic> toJson() => {
        "\u0024date": date.toJson(),
      };
}

class Date {
  Date({
    required this.numberLong,
  });

  String numberLong;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        numberLong: json["\u0024numberLong"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024numberLong": numberLong,
      };
}

class Id {
  Id({
    required this.oid,
  });

  String oid;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
