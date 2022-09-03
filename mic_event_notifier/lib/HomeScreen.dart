import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mic_event_notifier/assignevent.dart';
import 'package:mic_event_notifier/loginpage.dart';
import 'package:mic_event_notifier/main.dart';
import 'main.dart';
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFDE7ADE),
               // Color(0xffEFF7F6),
                Color(0xFFDE7ADE)]
          )
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (pageview==1)?
                      Container(
                        child: Stack(
                          children: [

                            // SizedBox(width: SizeConfig.screenWidth * 0.05),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Hello Admin !!',
                                      textAlign: TextAlign.left,
                                     style: GoogleFonts.workSans(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width*0.05,
                                  fontWeight: FontWeight.w300
                              ),
                                  ),
                                  Text(admin_username.text,
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.workSans(
                                          color: bfont,
                                          fontSize: MediaQuery.of(context).size.width*0.06,
                                          fontWeight: FontWeight.bold
                                      ),
                                  )
                                ],
                              ),
                            ),
                            // SizedBox(width: SizeConfig.screenWidth * 0.275),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 80,
                                child: ElevatedButton(
                                  child: Icon(
                                      Icons.add,
                                    size: MediaQuery.of(context).size.width*0.1,
                                    color: bfont,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xffF0F0F0),
                                    shape: CircleBorder()/*const RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(180))),*/
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return AssignEvent();
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ):
                      (pageview==2)?
                      Container(
                        child: Stack(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              /* child: Image(
                                alignment: Alignment.centerRight,
                                image: AssetImage('assets/images/Latest-Pic.png'),
                              ),*/
                            ),
                            // SizedBox(width: SizeConfig.screenWidth * 0.05),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Hello Admin !!',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.workSans(
                                        color: Colors.white,
                                        fontSize: MediaQuery.of(context).size.width*0.05,
                                        fontWeight: FontWeight.w300
                                    ),
                                  ),
                                  Text(user_username.text,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.workSans(
                                        color: bfont,
                                        fontSize: MediaQuery.of(context).size.width*0.06,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(width: SizeConfig.screenWidth * 0.275),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 80,
                                child: ElevatedButton(
                                  child: Icon(
                                    Icons.notifications_active,
                                    size: MediaQuery.of(context).size.width*0.1,
                                    color: bfont,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xffF0F0F0),
                                      shape: CircleBorder()/*const RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(180))),*/
                                  ),
                                  onPressed: () {
                                  /*  Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return HomeScreen();
                                        },
                                      ),
                                    );*/
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ):SizedBox(),
                      EventsCard()
                    ]
                ),
              ),
          ),
          )
    );
  }
}

class SliderCard extends StatefulWidget {
/*  String imagepath, name, desc = "", cal = "", time = "";
  (this.name, this.imagepath, this.desc, this.cal, this.time);*/
  @override
  State<SliderCard> createState() => _SliderCard();
}

class _SliderCard extends State<SliderCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(1, 2), // changes position of shadow
            ),
          ],
        ),
        height: 300,
        width: 300,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  /* image: DecorationImage(
                      image: NetworkImage(), fit: BoxFit.cover),*/
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                    /*   image: DecorationImage(
                        image: NetworkImage(widget.imagepath),
                        fit: BoxFit.cover),*/
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                '',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.037,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
class EventsCard extends StatefulWidget {
  const EventsCard({Key? key}) : super(key: key);

  @override
  State<EventsCard> createState() => _EventsCardState();
}
///todo:implement scroll view and implement the tile card in scrollview
class _EventsCardState extends State<EventsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(

    );
  }
}
