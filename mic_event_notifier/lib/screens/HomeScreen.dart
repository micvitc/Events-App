import 'package:Login_ui/main.dart';
import 'package:Login_ui/models/EventModel.dart';
import 'package:Login_ui/services/api_services.dart';
import 'package:Login_ui/widgets/cards.dart';
import 'package:Login_ui/services/dater.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loginpage.dart';
import 'dart:core';
import 'dart:math';
import 'dart:ui';
import 'package:Login_ui/widgets/cards.dart';

// String event_title = 'open mic';
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

String _getGreeting() {
  var timeNow = DateTime.now().hour;

  if (timeNow <= 12) {
    return 'Good Morning !';
  } else if ((timeNow > 12) && (timeNow <= 16)) {
    return 'Good Afternoon !';
  } else if ((timeNow > 16) && (timeNow < 20)) {
    return 'Good Evening !';
  } else {
    return 'Good Night !';
  }
}

List<EventModel> eventList = [];

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

int count = 0;

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

  void setEventList() async {
    eventList = await APIServices.getEvents();
    count = eventList.length;
  }

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
    setEventList();
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
                // SizedBox(height: MediaQuery.of(context).size.width * 0.2),
                // Center(
                //   child: GestureDetector(
                //     child: Text("Show Notif"),
                //     onTap: () {
                //       NotificationService().showNotification(1, "Title", "Body", 5);
                //     },
                //   )
                // ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Stack(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(),
                        // SizedBox(width: SizeConfig.screenWidth * 0.05),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.03,
                              left: MediaQuery.of(context).size.width * 0.0,
                            ),
                            child: CircleAvatar(
                              backgroundColor: Color(Random().nextInt(0xffffffff)).withAlpha(0xff),
                              radius: 25,
                              child: Text(
                                _user.displayName!.substring(0,1),
                                textAlign: TextAlign.left,
                                style: GoogleFonts.workSans(
                                  fontSize:
                                  MediaQuery.of(context).size.width * 0.08,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.03,
                                  left: MediaQuery.of(context).size.width * 0.15,
                                ),
                                child: Text(
                                  _getGreeting(),
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.workSans(
                                      color: vwhite,
                                      fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  //top: MediaQuery.of(context).size.width * 0.03,
                                  left: MediaQuery.of(context).size.width * 0.15,
                                ),
                                child: AutoSizeText(
                                  _user.displayName!.substring(0, _user.displayName!.length - 9),
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  minFontSize: 18,
                                  style: GoogleFonts.workSans(
                                    color: bfont,
                                    fontSize:
                                    MediaQuery.of(context).size.width * 0.06,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(width: SizeConfig.screenWidth * 0.275),
                        Align(
                          //alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.03,
                              left: MediaQuery.of(context).size.width * 0.5,
                            ),
                            child: ElevatedButton(
                                child: Icon(
                                  Icons.search_sharp,
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.03,
                              right: MediaQuery.of(context).size.width * 0.02,
                            ),
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
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.07,
                  ),
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
                                  MediaQuery.of(context).size.width * 0.042,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.12),
                      Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                            },
                            icon: Icon(Icons.sort_sharp,
                              color: bfont,
                              size: MediaQuery.of(context).size.width * 0.08,),)
                      ),],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                FutureBuilder(
                    future: APIServices.getEvents(),
                    builder:
                        (context, AsyncSnapshot<List<EventModel>> snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      } else {
                        return CarouselSlider.builder(
                          itemCount: eventList.length,
                          itemBuilder: (BuildContext, int index, int b) =>
                              Flexible(
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
                                            /* image: DecorationImage(image: NetworkImage(), fit: BoxFit.cover),*/
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.elliptical(20, 20),
                                                topRight:
                                                Radius.elliptical(20, 20)),
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
                                                        left: 12.0, top: 12.0),
                                                    child: Text(
                                                      snapshot
                                                          .data![index].eventName
                                                          .toString(),
                                                      textAlign: TextAlign.left,
                                                      style: GoogleFonts.workSans(
                                                          color: bfont,
                                                          fontSize:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                              0.06,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(),
                                                Row(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.bottomLeft,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(),
                                                        //child: Icon(Icons.calendar_today_outlined),
                                                        child: IconButton(
                                                          onPressed: () {
                                                          },
                                                          icon: Icon(Icons.calendar_today_outlined,),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: Alignment.bottomRight,
                                                      child: Padding(
                                                        padding: const EdgeInsets.fromLTRB(10.0,0.0,10.0,0.0),
                                                        child: Column(children: <Widget>[
                                                          Text(
                                                            '${Dater(millis: int.parse(snapshot.data![index].eventDate.toString())).dayTime.substring(0,Dater(millis: int.parse(snapshot.data![index].eventDate.toString())).dayTime.length - 5)}\n${Dater(millis: int.parse(snapshot.data![index].eventDate.toString())).dayTime.substring(Dater(millis: int.parse(snapshot.data![index].eventDate.toString())).dayTime.length - 5, Dater(millis: int.parse(snapshot.data![index].eventDate.toString())).dayTime.length)}',
                                                            textAlign: TextAlign.left,
                                                            style: GoogleFonts.workSans(
                                                              color: bfont,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ]),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                // Text(
                                                //   Dater(
                                                //       millis: int.parse(snapshot
                                                //           .data![index]
                                                //           .eventDate
                                                //           .toString()))
                                                //       .dayTime,
                                                //   textAlign: TextAlign.left,
                                                //   style: GoogleFonts.workSans(
                                                //     color: bfont,
                                                //     fontSize: 15,
                                                //   ),
                                                // ),

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
                            aspectRatio: 1.6,
                            enableInfiniteScroll: true,
                            enlargeCenterPage: true,
                          ),
                        );
                      }
                    }),
                SizedBox(height: MediaQuery.of(context).size.height * 0.017),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.04,
                    left: MediaQuery.of(context).size.width * 0.07,
                  ),
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
                                  MediaQuery.of(context).size.width * 0.042,
                                  fontWeight: FontWeight.bold),
                            ),
                            // Text(
                            //   '${count} events',
                            //   textAlign: TextAlign.left,
                            //   style: GoogleFonts.workSans(
                            //     color: vwhite,
                            //     fontSize:
                            //         MediaQuery.of(context).size.width * 0.04,
                            //     fontWeight: FontWeight.w400,
                            //   ),
                            // )
                          ]),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.25),
                      Align(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<CircleBorder>(CircleBorder(
                              //borderRadius: BorderRadius.circular(100),
                              side: BorderSide(color: bfont),
                            )),
                          ),
                          child: Icon(Icons.refresh_sharp, color: bfont),
                        )
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                            },
                            icon: Icon(Icons.sort_sharp,
                              color: bfont,
                              size: MediaQuery.of(context).size.width * 0.08,),)
                      ),
                      //SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    ],
                  ),
                ),
                Expanded(child: const EventsCard())
                ,
                SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              ]),
        ),
      ),
    );
  }
}


// import 'package:Login_ui/main.dart';
// import 'package:Login_ui/models/EventModel.dart';
// import 'package:Login_ui/utils/authentication.dart';
// import 'package:Login_ui/widgets/cards.dart';
// import 'package:Login_ui/widgets/slider.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'loginpage.dart';
// import 'dart:core';

// String event_title = 'open mic';
// bool notification_bool = false;
// // int slider_event = eventname.length;
// final List<String> imgList = [
//   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
// ];
// // final List<String> eventname = [
// //   'Ideathon',
// //   'makeathon',
// //   'Event',
// //   'nothing',
// //   'appathon'
// // ];

// class MyBehavior extends ScrollBehavior {
//   @override
//   Widget buildOverscrollIndicator(
//       BuildContext context, Widget child, ScrollableDetails details) {
//     return child;
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key, required User user})
//       : _user = user,
//         super(key: key);

//   final User _user;

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late User _user;
//   bool _isSigningOut = false;

//   Route _routeToSignInScreen() {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) => MyLogin(),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         var begin = Offset(-1.0, 0.0);
//         var end = Offset.zero;
//         var curve = Curves.ease;

//         var tween =
//             Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//         return SlideTransition(
//           position: animation.drive(tween),
//           child: child,
//         );
//       },
//     );
//   }

//   @override
//   void initState() {
//     _user = widget._user;

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage(
//                 'assets/homescreen.jpg',
//               ),
//               fit: BoxFit.cover)),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Padding(
//           padding: const EdgeInsets.fromLTRB(0, 22, 0, 0),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: MediaQuery.of(context).size.width * 0.05),
//                 Container(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Stack(
//                       // crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(),
//                         // SizedBox(width: SizeConfig.screenWidth * 0.05),
//                         Align(
//                           alignment: Alignment.center,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 5),
//                                 child: Text(
//                                   _user.displayName!,
//                                   textAlign: TextAlign.left,
//                                   style: GoogleFonts.workSans(
//                                     color: vwhite,
//                                     fontSize:
//                                         MediaQuery.of(context).size.width *
//                                             0.042,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                     right: MediaQuery.of(context).size.width *
//                                         0.03),
//                                 child: Text(
//                                   ' ${_user.email!}',
//                                   textAlign: TextAlign.left,
//                                   style: GoogleFonts.workSans(
//                                       color: bfont,
//                                       fontSize:
//                                           MediaQuery.of(context).size.width *
//                                               0.032,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         // SizedBox(width: SizeConfig.screenWidth * 0.275),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: Container(
//                             width: 80,
//                             child: ElevatedButton(
//                                 child: Icon(
//                                   Icons.notifications_none_sharp,
//                                   size:
//                                       MediaQuery.of(context).size.width * 0.075,
//                                   color: bfont,
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                     backgroundColor: Color(0xffF0F0F0),
//                                     shape:
//                                         CircleBorder() /*const RoundedRectangleBorder(
//                                           borderRadius:
//                                           BorderRadius.all(Radius.circular(180))),*/
//                                     ),
//                                 onPressed: () {}),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.width * 0.05,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Row(
//                     children: [
//                       Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Events you have registered for',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.workSans(
//                                   color: bfont,
//                                   fontSize:
//                                       MediaQuery.of(context).size.width * 0.04,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               '${eventList.length} events',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.workSans(
//                                 color: vwhite,
//                                 fontSize:
//                                     MediaQuery.of(context).size.width * 0.04,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             )
//                           ]),
//                       SizedBox(width: MediaQuery.of(context).size.width * 0.2),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Icon(
//                           Icons.sort_sharp,
//                           color: bfont,
//                           size: MediaQuery.of(context).size.width * 0.08,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//                 FutureBuilder(
//                     future: ReadJsonData(),
//                     builder:
//                         (context, AsyncSnapshot<List<EventModel>> snapshot) {
//                       if (!snapshot.hasData) {
//                         return CircularProgressIndicator();
//                       } else {
//                         return CarouselSlider.builder(
//                           itemCount: eventList.length,
//                           itemBuilder: (BuildContext, int index, int b) =>
//                               Expanded(
//                             flex: 5,
//                             child: ClipRRect(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(30.0),
//                                 ),
//                                 child: Expanded(
//                                   flex: 3,
//                                   child: Flexible(
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.rectangle,
//                                         /* image: DecorationImage(
//                        image: NetworkImage(), fit: BoxFit.cover),*/
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.elliptical(10, 10),
//                                             topRight:
//                                                 Radius.elliptical(10, 10)),
//                                         color: Colors.white,
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             Align(
//                                               alignment: Alignment.topLeft,
//                                               child: Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 12.0),
//                                                 child: Text(
//                                                   snapshot
//                                                       .data![index].eventName
//                                                       .toString(),
//                                                   textAlign: TextAlign.left,
//                                                   style: GoogleFonts.workSans(
//                                                       color: bfont,
//                                                       fontSize:
//                                                         MediaQuery.of(context).size.width * 0.07,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                               ),
//                                             ),
//                                             Text(
//                                               (snapshot.data![index].eventDate)
//                                                   .toString(),
//                                               textAlign: TextAlign.left,
//                                               style: GoogleFonts.workSans(
//                                                 color: bfont,
//                                                 fontSize:
//                                                   MediaQuery.of(context).size.width * 0.04,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )),
//                           ),
//                           options: CarouselOptions(
//                             autoPlay: true,
//                             aspectRatio: MediaQuery.of(context).size.height * 0.0019,
//                             enableInfiniteScroll: true,
//                             enlargeCenterPage: true,
//                           ),
//                         );
//                       }
//                     }),
//                 SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Row(
//                     children: [
//                       Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Upcoming Events',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.workSans(
//                                   color: bfont,
//                                   fontSize:
//                                       MediaQuery.of(context).size.width * 0.04,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               '${eventList.length} events',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.workSans(
//                                 color: vwhite,
//                                 fontSize:
//                                     MediaQuery.of(context).size.width * 0.04,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             )
//                           ]),
//                       SizedBox(width: MediaQuery.of(context).size.width * 0.5),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Icon(
//                           Icons.sort_sharp,
//                           color: bfont,
//                           size: MediaQuery.of(context).size.width * 0.08,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Expanded(child: const EventsCard())
//               ]),
//         ),
//       ),
//     );
//   }
// }
