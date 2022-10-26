// ignore_for_file: prefer_const_constructors

import 'package:Login_ui/models/EventModel.dart';
import 'package:Login_ui/screens/HomeScreen.dart';
import 'package:Login_ui/main.dart';
import 'package:Login_ui/services/notif_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:Login_ui/services/dater.dart';

import 'package:flutter/services.dart' as root_bundle;

List<EventModel> eventList = [];
int count = 0;
// Fetching Json file.
Future<List<EventModel>> ReadJsonData() async {
  eventList = [];
  final jsonresponse =
      await root_bundle.rootBundle.loadString('jsonfile/testing-api.json');
  final data = await json.decode(jsonresponse);
  for (Map i in data) {
    count += 1;
    eventList.add(EventModel.fromJson(i));
  }
  return eventList;
}

List<bool> notif = List<bool>.filled(count, false);

class EventsCard extends StatefulWidget {
  const EventsCard({super.key});

  @override
  State<EventsCard> createState() => _EventsCardState();
}

class _EventsCardState extends State<EventsCard> {
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

  void setNotif(EventModel event, int index) {
    setState(() {
      if (notif[index] == false) {
        Dater dater = Dater(millis: int.parse(event.eventDate.toString()));
        int diff = dater.difference;
        NotificationService().showNotification(
          int.parse(event.eventId.toString()),
          event.eventName.toString(),
          'The event will start by ${dater.dayTime}', // body,
          (diff > 0) ? diff : 120,
        );
      }
      else {
        NotificationService().cancelNotification(int.parse(event.eventId.toString()));
      }
      notif[index] = !notif[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ReadJsonData(),
        builder: (context, AsyncSnapshot<List<EventModel>> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
                itemCount: eventList.length,
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
                            snapshot.data![index].eventName.toString(),
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
                            snapshot.data![index].eventHost.toString(),
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
                              setNotif(snapshot.data![index], index);
                              // String idd = snapshot.data![index].eventId.toString();
                              // setNotif(int.parse(idd));
                            },
                            icon: Icon(Icons.check_circle,
                                color: (notif[index] == true) ? Colors.blueAccent : bdiv),
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
        });
  }
}


// // ignore_for_file: prefer_const_constructors

// import 'package:Login_ui/models/EventModel.dart';
// import 'package:Login_ui/screens/HomeScreen.dart';
// import 'package:Login_ui/main.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:convert';

// import 'package:flutter/services.dart' as root_bundle;

// List<EventModel> eventList = [];
// // Fetching Json file.
// Future<List<EventModel>> ReadJsonData() async {
//   eventList = [];
//   final jsonresponse =
//       await root_bundle.rootBundle.loadString('jsonfile/testing-api.json');
//   final data = await json.decode(jsonresponse);
//   for (Map i in data) {
//     eventList.add(EventModel.fromJson(i));
//   }
//   return eventList;
// }

// class EventsCard extends StatefulWidget {
//   const EventsCard({super.key});

//   @override
//   State<EventsCard> createState() => _EventsCardState();
// }

// class _EventsCardState extends State<EventsCard> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//           width: MediaQuery.of(context).size.width * 0.9,
//           height: MediaQuery.of(context).size.width,
//           padding: new EdgeInsets.all(8.0),
//           child: Cards()),
//     );
//   }
// }

// class Cards extends StatefulWidget {
//   const Cards({super.key});

//   @override
//   State<Cards> createState() => _CardsState();
// }

// class _CardsState extends State<Cards> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: ReadJsonData(),
//         builder: (context, AsyncSnapshot<List<EventModel>> snapshot) {
//           if (!snapshot.hasData) {
//             return CircularProgressIndicator();
//           } else {
//             return ListView.builder(
//                 itemCount: eventList.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15.0)),
//                     color: Colors.white,
//                     elevation: 15,
//                     child: Column(children: <Widget>[
//                       ListTile(
//                         title: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(children: <Widget>[
//                             Text(
//                               snapshot.data![index].eventName.toString(),
//                               style: GoogleFonts.workSans(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 22,
//                               ),
//                             ),
//                             Divider(
//                               color: bdiv,
//                               height: 10,
//                               thickness: 0.5,
//                               indent: 20,
//                               endIndent: 20,
//                             ),
//                           ]),
//                         ),
//                         subtitle: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             snapshot.data![index].eventHost.toString(),
//                             style: GoogleFonts.workSans(
//                               color: bdiv,
//                               fontWeight: FontWeight.w400,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                         trailing: Padding(
//                           padding: const EdgeInsets.only(left: 20, bottom: 20),
//                           child: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 (notification_bool == false)
//                                     ? notification_bool = true
//                                     : notification_bool = false;
//                               });
//                             },
//                             icon: Icon(Icons.check_circle,
//                                 color: (notification_bool == true)
//                                     ? Colors.blueAccent
//                                     : bdiv),
//                           ),
//                         ),
//                       ),
//                     ]),
//                   );
//                 });
//           }
//         });
//   }
// }
