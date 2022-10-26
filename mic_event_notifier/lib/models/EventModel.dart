// import 'dart:ffi';

// import 'package:flutter/rendering.dart';

/// _id : {"$oid":"6326b921c1d817a37bef0148"}
/// event_id : "1"
/// event_name : "Spin it win it"
/// event_date : {"$date":"1664064000000"}
/// event_venue : "MG auditorium"
/// event_host : ["Microsoft innovations club"]
/// event_coordinators : ["A","B","C"]
/// school_name : "SCOPE"

class EventModel {
  EventModel({
    Id? id,
    String? eventId,
    String? eventName,
    int? eventDate,
    String? eventVenue,
    List<String>? eventHost,
    List<String>? eventCoordinators,
    String? schoolName,
  }) {
    _id = id;
    _eventId = eventId;
    _eventName = eventName;
    _eventDate = eventDate;
    _eventVenue = eventVenue;
    _eventHost = eventHost;
    _eventCoordinators = eventCoordinators;
    _schoolName = schoolName;
  }

  EventModel.fromJson(dynamic json) {
    _id = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    _eventId = json['event_id'];
    _eventName = json['event_name'];
    _eventDate = json["event_date"]["\$date"];
    // _eventDate = json['event_date'] != null
    //     ? EventDate.fromJson(json['event_date'])
    //     : null;
    _eventVenue = json['event_venue'];
    _eventHost =
        json['event_host'] != null ? json['event_host'].cast<String>() : [];
    _eventCoordinators = json['event_coordinators'] != null
        ? json['event_coordinators'].cast<String>()
        : [];
    // print(_eventDate);
    // print(_eventCoordinators);
    _schoolName = json['school_name'];
  }
  Id? _id;
  String? _eventId;
  String? _eventName;
  int? _eventDate;
  String? _eventVenue;
  List<String>? _eventHost;
  List<String>? _eventCoordinators;
  String? _schoolName;
  EventModel copyWith({
    Id? id,
    String? eventId,
    String? eventName,
    int? eventDate,
    String? eventVenue,
    List<String>? eventHost,
    List<String>? eventCoordinators,
    String? schoolName,
  }) =>
      EventModel(
        id: id ?? _id,
        eventId: eventId ?? _eventId,
        eventName: eventName ?? _eventName,
        eventDate: eventDate ?? _eventDate,
        eventVenue: eventVenue ?? _eventVenue,
        eventHost: eventHost ?? _eventHost,
        eventCoordinators: eventCoordinators ?? _eventCoordinators,
        schoolName: schoolName ?? _schoolName,
      );
  Id? get id => _id;
  String? get eventId => _eventId;
  String? get eventName => _eventName;
  int? get eventDate => _eventDate;
  String? get eventVenue => _eventVenue;
  List<String>? get eventHost => _eventHost;
  List<String>? get eventCoordinators => _eventCoordinators;
  String? get schoolName => _schoolName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_id != null) {
      map['_id'] = _id?.toJson();
    }
    map['event_id'] = _eventId;
    map['event_name'] = _eventName;
    if (_eventDate != null) {
      // map['event_date'] = _eventDate?.toJson();
      map['event_date'] = _eventDate;
    }
    map['event_venue'] = _eventVenue;
    map['event_host'] = _eventHost;
    map['event_coordinators'] = _eventCoordinators;
    map['school_name'] = _schoolName;
    return map;
  }
}

/// $date : {"$numberLong":"1664064000000"}

class EventDate {
  EventDate({
    $date? date,
  }) {
    _date = date;
  }

  EventDate.fromJson(dynamic json) {
    _date = json['\$date'] != null ? $date.fromJson(json['$date']) : null;
  }
  $date? _date;
  EventDate copyWith({
    $date? date,
  }) =>
      EventDate(
        date: date ?? _date,
      );
  $date? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_date != null) {
      map['$date'] = _date?.toJson();
    }
    return map;
  }
}

/// $numberLong : "1664064000000"

class $date {
  $date({
    String? numberLong,
  }) {
    _numberLong = numberLong;
  }

  $date.fromJson(dynamic json) {
    _numberLong = json['$numberLong'];
  }
  String? _numberLong;
  $date copyWith({
    String? numberLong,
  }) =>
      $date(
        numberLong: numberLong ?? _numberLong,
      );
  String? get numberLong => _numberLong;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['$numberLong'] = _numberLong;
    return map;
  }
}

/// $oid : "6326b921c1d817a37bef0148"

class Id {
  Id({
    String? oid,
  }) {
    _oid = oid;
  }

  Id.fromJson(dynamic json) {
    _oid = json['$oid'];
  }
  String? _oid;
  Id copyWith({
    String? oid,
  }) =>
      Id(
        oid: oid ?? _oid,
      );
  String? get oid => _oid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['$oid'] = _oid;
    return map;
  }
}
