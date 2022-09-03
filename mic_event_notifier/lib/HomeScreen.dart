import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mic_event_notifier/assignevent.dart';
import 'package:mic_event_notifier/loginpage.dart';
import 'package:mic_event_notifier/main.dart';
import 'main.dart';
String username ="Haresh Baskaran";
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
];
final List<String> eventname = [
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
                      SizedBox(height: MediaQuery.of(context).size.width*0.025,),
                      Container(
                        child: Stack(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                            ),
                            // SizedBox(width: SizeConfig.screenWidth * 0.05),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Hello User !',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.workSans(
                                        color: Colors.white,
                                        fontSize: MediaQuery.of(context).size.width*0.05,
                                        fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('$username',
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
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.05,),
                      Row(
                        children: [
                          Text('Events u have registered for',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.workSans(
                                color: bfont,
                                fontSize: MediaQuery.of(context).size.width*0.04,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.2),
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
                      SizedBox(height: MediaQuery.of(context).size.height*0.025),
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
final List<Widget>
imageSliders = imgList.map((item)=> Flexible(
  flex: 5,
  child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30.0),
        ),
        child: Expanded(
          flex: 3,
          child: Flexible(
            child:Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              /* image: DecorationImage(
                      image: NetworkImage(), fit: BoxFit.cover),*/
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(20, 20),
                topRight: Radius.elliptical(20, 20)
              ),
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
                      child: Text('Ideathon',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.workSans(
                            color: bfont,
                            fontSize:26,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Image.network(item,
                        fit: BoxFit.cover,
                        width:200.0,
                      height: 100,
                    ),
                    SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Colors.black,
                          size: 24,
                        )
                      ],
                  )
                ],
              ),
            ),
            ),
          ),
        )
  ),
))
    .toList();
