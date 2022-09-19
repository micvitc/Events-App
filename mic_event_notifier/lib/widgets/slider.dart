// ignore_for_file: prefer_const_constructors

import 'package:Login_ui/screens/HomeScreen.dart';
import 'package:Login_ui/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///todo:design this card according to UI - for Shalini

final List<Widget> imageSliders = eventname
    .map((item)
//imgList.map((item)
        =>
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
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                item,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.workSans(
                                    color: bfont,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(),

                          ///todo:implement current ui for event details in slider - for Rishabh
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ))
    .toList();
