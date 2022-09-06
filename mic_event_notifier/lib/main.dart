import 'package:flutter/material.dart';
import 'loginpage.dart';
//DE7BDE
Color vwhite = Color(0xffF3F3F3);
Color vhome = Color(0xFFDE7ADE);
Color bfont = Color(0xff2D2D2D);
Color bdiv = Color(0xff7B7B7B);
Color r =  Color(0xffDB4437);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyLogin()//LoginPage()
    );
  }
}


