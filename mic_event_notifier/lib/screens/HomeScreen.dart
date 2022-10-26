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

bool notification_bool = false;

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
                              '${allEventsList.length} events',
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                CarouselSlider.builder(
                  itemCount: allEventsList.length,
                  itemBuilder: (BuildContext, int index, int b) => Flexible(
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
                                    topLeft: Radius.elliptical(20, 20),
                                    topRight: Radius.elliptical(20, 20)),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: Text(
                                          allEventsList[index].name,
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.workSans(
                                              color: bfont,
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    SizedBox(),
                                    Text(
                                      allEventsList[index].schoolname,
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.workSans(
                                        color: bfont,
                                        fontSize: 15,
                                      ),
                                    ),

                                    ///todo:implement current ui for event details in slider - for Rishabh
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1.2,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
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
                              '${allEventsList.length} events',
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
