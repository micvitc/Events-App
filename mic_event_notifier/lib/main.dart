import 'package:flutter/material.dart';
import 'mic_event_notifier/loginpage.dart';

Color vhome = Color(0xFFDE7ADE);
Color bfont = Color(0xff2D2D2D);
Color r = Color(0xffDB4437);
void main() {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage());
  }
}
