import 'package:flutter/material.dart';
import 'package:mic_event_notifier/HomeScreen.dart';
int pageview = 0;
TextEditingController user_username = new TextEditingController();
TextEditingController admin_username = new TextEditingController();
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             (pageview == 0)
                 ? Column(
               children: [
                 Align(
                   alignment: Alignment.center,
                   child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                           elevation: 5.0,
                           shape: StadiumBorder(),
                           primary: Colors.black),
                       onPressed: () {
                         setState(() {
                           pageview = 1;
                         });
                       },
                       child: Padding(
                         padding: EdgeInsets.fromLTRB(
                             MediaQuery.of(context).size.height * 0.04,
                             12,
                             MediaQuery.of(context).size.height * 0.04,
                             12),
                         child: Text(
                           'Login as Admin',
                           style: TextStyle(
                               color: Colors.white,
                               fontSize:
                               MediaQuery.of(context).size.height *
                                   0.02),
                         ),
                       )),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                           elevation: 5.0,
                           shape: StadiumBorder(),
                           primary: Colors.black),
                       onPressed: () {
                         setState(() {
                           pageview = 2;
                         });
                       },
                       child: Padding(
                         padding: EdgeInsets.fromLTRB(
                             MediaQuery.of(context).size.height * 0.04,
                             12,
                             MediaQuery.of(context).size.height * 0.04,
                             12),
                         child: Text(
                           'Login as User',
                           style: TextStyle(
                               color: Colors.white,
                               fontSize:
                               MediaQuery.of(context).size.height *
                                   0.02),
                         ),
                       )),
                 )
               ],
             )
                 : (pageview == 1)
                 ? Column(children: [
               Row(
                 children: [
                   Container(
                     color: Colors.transparent,
                     padding: EdgeInsets.all(3),
                     alignment: Alignment.centerLeft,
                     child: TextButton(
                         onPressed: () {
                           setState(() {
                             pageview = 0;
                           });
                         },
                         child: Icon(
                           Icons.arrow_back_ios,
                           color: Colors.black,
                         )),
                   ),
                   Text(
                     textAlign: TextAlign.center,
                     'Login as Admin',
                     style: TextStyle(
                         color: Colors.black,
                         fontSize:
                         MediaQuery.of(context).size.width *
                             0.075),
                   ),
                 ],
               ),
               SizedBox(
                   height:
                   MediaQuery.of(context).size.height * 0.025),
               Center(
                 child: Container(
                   width:
                   MediaQuery.of(context).size.width * 0.9,
                   decoration: new BoxDecoration(
                     color: Color(0xFFF7F8F8),
                     shape: BoxShape.rectangle,
                     border: Border.all(width: 2.0),
                     borderRadius: BorderRadius.all(
                         Radius.circular(15.0)),
                   ),
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                           color: Colors.transparent,
                           constraints: BoxConstraints(
                               minHeight:
                               MediaQuery.of(context)
                                   .size
                                   .height *
                                   0.05),
                           child: TextField(
                             maxLines: 1,
                             onChanged: (_) {
                               setState(() {});
                             },
                             decoration: InputDecoration(
                               fillColor: Colors.black,
                               border: InputBorder.none,
                             ),
                             cursorColor: Colors.black,
                             controller: admin_username,
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                             elevation: 5.0,
                             shape: StadiumBorder(),
                             primary: Colors.black),
                         onPressed: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) =>
                                     HomeScreen()
                             ),
                           );
                         },
                         child: Padding(
                           padding: EdgeInsets.fromLTRB(
                               MediaQuery.of(context).size.height *
                                   0.048,
                               12,
                               MediaQuery.of(context).size.height *
                                   0.048,
                               12),
                           child: Text(
                             'Login',
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: MediaQuery.of(context)
                                     .size
                                     .height *
                                     0.02),
                           ),
                         )),
                   ),
                 ],
               ),
             ])
                 : (pageview == 2)
                 ? Column(
                 children: [
               Row(
                 children: [
                   Container(
                     padding: EdgeInsets.all(3),
                     alignment: Alignment.centerLeft,
                     child: TextButton(
                         onPressed: () {
                           setState(() {
                             pageview = 0;
                           });
                         },
                         child: Icon(
                           Icons.arrow_back_ios,
                           color: Colors.black,
                         )),
                   ),
                   Text(
                     textAlign: TextAlign.center,
                     'Login as User',
                     style: TextStyle(
                         color: Colors.black,
                         fontSize: MediaQuery.of(context)
                             .size
                             .width *
                             0.075),
                   ),
                 ],
               ),
               Center(
                 child: Container(
                   width:
                   MediaQuery.of(context).size.width * 0.9,
                   decoration: new BoxDecoration(
                     color: Color(0xFFF7F8F8),
                     shape: BoxShape.rectangle,
                     border: Border.all(width: 2.0),
                     borderRadius: BorderRadius.all(
                         Radius.circular(15.0)),
                   ),
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                           color: Colors.transparent,
                           constraints: BoxConstraints(
                               minHeight:
                               MediaQuery.of(context)
                                   .size
                                   .height *
                                   0.05),
                           child: TextField(
                             maxLines: 1,
                             onChanged: (_) {
                               setState(() {});
                             },
                             decoration: InputDecoration(
                               fillColor: Colors.black,
                               border: InputBorder.none,
                             ),
                             cursorColor: Colors.black,
                             controller: user_username,
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
               SizedBox(
                   height: MediaQuery.of(context).size.height *
                       0.025),
             SizedBox(
                 height:
                 MediaQuery.of(context).size.height * 0.025),
                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: ElevatedButton(
                             style: ElevatedButton.styleFrom(
                                 elevation: 5.0,
                                 shape: StadiumBorder(),
                                 primary: Colors.black),
                             onPressed: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                     builder: (context) =>
                                         HomeScreen()
                                 ),
                               );
                             },
                             child: Padding(
                               padding: EdgeInsets.fromLTRB(
                                   MediaQuery.of(context).size.height *
                                       0.048,
                                   12,
                                   MediaQuery.of(context).size.height *
                                       0.048,
                                   12),
                               child: Text(
                                 'Login',
                                 style: TextStyle(
                                     color: Colors.white,
                                     fontSize: MediaQuery.of(context)
                                         .size
                                         .height *
                                         0.02),
                               ),
                             )),
                       ),
                     ],
                   ),
              // _googleSignInButton()
             ]
             )
                 : Text('nothing')
           ],
         ),
       ),
    );
  }
}

