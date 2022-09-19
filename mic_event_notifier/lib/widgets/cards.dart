// ignore_for_file: prefer_const_constructors

import 'package:Login_ui/screens/HomeScreen.dart';
import 'package:Login_ui/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsCard extends StatefulWidget {
  const EventsCard({super.key});

  @override
  State<EventsCard> createState() => _EventsCardState();
}

class _EventsCardState extends State<EventsCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: new EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            color: Colors.white,
            elevation: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Open Mic',
                      style: GoogleFonts.workSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'MICROSOFT INNVATION CLUB',
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
                  height: 15,
                  thickness: 0.5,
                  indent: 20,
                  endIndent: 20,
                ),
                ListTile(
                  leading: Icon(
                    Icons.calendar_today_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                  title: Text(
                    '11:30 AM - 12:30 PM',
                    style: GoogleFonts.workSans(
                      color: bdiv,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text(
                    'Mon, 17 Sept 2022',
                    style: GoogleFonts.workSans(
                      color: bdiv,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
