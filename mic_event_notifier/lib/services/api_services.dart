// http://35.171.162.185:5000/api/events

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:Login_ui/models/EventModel.dart';

class APIServices {
  static Future<List<EventModel>> getEvents() async {
    final response = await http.get(Uri.parse('http://35.171.162.185:5000/api/events'));
    if (response.statusCode == 200) {
      List<EventModel> eventList = [];
      List jsonResponse = json.decode(response.body);

      for (Map i in jsonResponse) {
        eventList.add(EventModel.fromJson(i));
      }
      return eventList;
      // print(jsonResponse);
      // return jsonResponse.map((event) => new EventModel.fromJson(event)).toList();
    } else {
      // print("else");
      return [];
    }
  }
}

// void main(List<String> args) {
//   APIServices.getEvents();
// }