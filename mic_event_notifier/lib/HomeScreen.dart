
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mic_event_notifier/assignevent.dart';
import 'package:mic_event_notifier/loginpage.dart';
import 'package:mic_event_notifier/main.dart';
import 'main.dart';
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
];
final List<String> EventName = [
  'Ideathon','makeathon','Event','nothing','mickjdefnkj'

];
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
                      Container(
                        child: CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                          ),
                          items: imageSliders,
                        ),
                      ),
                      EventsCard()
                    ]
                ),
              ),
          ),
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
final List<Widget> imageSliders = imgList
    .map((item) => Container(
  child: Container(
    margin: EdgeInsets.symmetric(
      horizontal: 10
    ),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
        child: Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              /* image: DecorationImage(
                      image: NetworkImage(), fit: BoxFit.cover),*/
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                   bottomLeft: Radius.circular(20),
                   bottomRight: Radius.circular(20)
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flex(direction: Axis.vertical,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Ideathon',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.workSans(
                            color: bfont,
                            fontSize:26,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),

                    /*Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.calendar_month_rounded,

                        )
                      ],
                    )*/
                  ],
                  )
                ],
              ),
            ),
          ),
        )
      /* Column(
          children: <Widget>[
           // Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'No. ${imgList.indexOf(item)} image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )*/
    ),
  ),
))
    .toList();