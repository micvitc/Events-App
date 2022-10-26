import 'package:Login_ui/main.dart';
import 'package:Login_ui/models/EventModel.dart';
import 'package:Login_ui/utils/authentication.dart';
import 'package:Login_ui/widgets/cards.dart';
import 'package:Login_ui/widgets/slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loginpage.dart';
import 'dart:core';

String event_title = 'open mic';
bool notification_bool = false;
// int slider_event = eventname.length;
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
];
// final List<String> eventname = [
//   'Ideathon',
//   'makeathon',
//   'Event',
//   'nothing',
//   'appathon'
// ];

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MyLogin(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/homescreen.jpg',
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 22, 0, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Stack(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(),
                        // SizedBox(width: SizeConfig.screenWidth * 0.05),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  _user.displayName!,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.workSans(
                                    color: vwhite,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.042,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        0.03),
                                child: Text(
                                  ' ${_user.email!}',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.workSans(
                                      color: bfont,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.032,
                                      fontWeight: FontWeight.bold),
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
                                  Icons.notifications_none_sharp,
                                  size:
                                      MediaQuery.of(context).size.width * 0.075,
                                  color: bfont,
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xffF0F0F0),
                                    shape:
                                        CircleBorder() /*const RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(180))),*/
                                    ),
                                onPressed: () {}),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Events you have registered for',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.workSans(
                                  color: bfont,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${eventList.length} events',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.workSans(
                                color: vwhite,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ]),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.sort_sharp,
                          color: bfont,
                          size: 28,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                FutureBuilder(
                    future: ReadJsonData(),
                    builder:
                        (context, AsyncSnapshot<List<EventModel>> snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      } else {
                        return CarouselSlider.builder(
                          itemCount: eventList.length,
                          itemBuilder: (BuildContext, int index, int b) =>
                              Expanded(
                            flex: 5,
                            child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                child: Expanded(
                                  flex: 3,
                                  child: Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        /* image: DecorationImage(
                       image: NetworkImage(), fit: BoxFit.cover),*/
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.elliptical(10, 10),
                                            topRight:
                                                Radius.elliptical(10, 10)),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0),
                                                child: Text(
                                                  snapshot
                                                      .data![index].eventName
                                                      .toString(),
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.workSans(
                                                      color: bfont,
                                                      fontSize: 26,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              (snapshot.data![index].eventDate)
                                                  .toString(),
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.workSans(
                                                color: bfont,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 1.6,
                            enableInfiniteScroll: true,
                            enlargeCenterPage: true,
                          ),
                        );
                      }
                    }),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Upcoming Events',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.workSans(
                                  color: bfont,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${eventList.length} events',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.workSans(
                                color: vwhite,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ]),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.5),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.sort_sharp,
                          color: bfont,
                          size: 28,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(child: const EventsCard())
              ]),
        ),
      ),
    );
  }
}
