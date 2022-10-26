// ignore_for_file: prefer_const_constructors

import 'package:Login_ui/models/EventModel.dart';
import 'package:Login_ui/screens/HomeScreen.dart';
import 'package:Login_ui/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart' as root_bundle;

List<ClassEvents> allEventsList = [];
getEvents() async {
  allEventsList = [];
  var events_url = Uri.parse('http://35.171.162.185:5000/api/events');
  var events_response = await http.get(events_url);
  final List<dynamic> events_data = await json.decode(events_response.body);
  print('Response status: ${events_response.statusCode}');
  print('Response body: ${events_response.body}');

  if (events_response.statusCode == 200) {
    for (int i = 0; i < events_data.length; i++) {
      allEventsList.add(ClassEvents(
          events_data[i]['event_id'],
          events_data[i]['event_name'],
          events_data[i]['event_venue'],
          events_data[i]['school_name']));
    }
  }
  print(
      'eyetttttttttURIEWOTWIOTYGWEOIHGIEOSJGDFNHOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO');
  print(allEventsList.length);
}

class ClassEvents {
  String id, name, venue, schoolname;
  ClassEvents(this.id, this.name, this.venue, this.schoolname);
}

class EventsCard extends StatefulWidget {
  const EventsCard({super.key});

  @override
  State<EventsCard> createState() => _EventsCardState();
}

class _EventsCardState extends State<EventsCard> {
  void initState() {
    getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.width,
          padding: new EdgeInsets.all(10.0),
          child: Cards()),
    );
  }
}

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: allEventsList.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            color: Colors.white,
            elevation: 15,
            child: Column(children: <Widget>[
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    allEventsList[index].name,
                    style: GoogleFonts.workSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    allEventsList[index].venue,
                    style: GoogleFonts.workSans(
                      color: bdiv,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        (notification_bool == false)
                            ? notification_bool = true
                            : notification_bool = false;
                      });
                    },
                    icon: Icon(Icons.check_circle,
                        color: (notification_bool == true)
                            ? Colors.blueAccent
                            : bdiv),
                  ),
                ),
              ),
              Divider(
                color: bdiv,
                height: 10,
                thickness: 0.5,
                indent: 20,
                endIndent: 20,
              ),
            ]),
          );
        });
  }
}
