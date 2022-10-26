// ignore_for_file: prefer_const_constructors

import 'package:Login_ui/screens/loginpage.dart';
import 'package:Login_ui/services/notif_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

//DE7BDE
Color vwhite = Color(0xffF3F3F3);
Color vhome = Color(0xFFDE7ADE);
Color bfont = Color(0xff2D2D2D);
Color bdiv = Color(0xff7B7B7B);
Color r = Color(0xffDB4437);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService().initNotification();
  tz.initializeTimeZones();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: MyLogin() //LoginPage()
        );
  }
}
