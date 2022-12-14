import 'package:Login_ui/screens/HomeScreen.dart';
import 'package:Login_ui/utils/authentication.dart';
import 'package:Login_ui/widgets/google_sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

TextEditingController username = TextEditingController();

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FutureBuilder(
      future: Authentication.initializeFirebase(context: context),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error initializing Firebase');
        } else if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox();
        }
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/vivid-blurred-colorful-wallpaper-background.jpg',
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.015,
                          top: MediaQuery.of(context).size.height * 0.2,
                          right: MediaQuery.of(context).size.width * 0.015),
                      child: Container(
                        child: Text(
                          'VITCC Events',
                          style: GoogleFonts.nunito(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.03,
                          top: MediaQuery.of(context).size.height * 0.27,
                          right: MediaQuery.of(context).size.height * 0.015),
                      child: Text(
                        'All events in one place',
                        style: GoogleFonts.nunito(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GoogleSignInButton(),
            /*           loginerror==1?
                Text('You are not Allowed to use this application',
                style: TextStyle(
                  color: Colors.red
                ),
                ):
                SizedBox()*/
          ],
        ),
      ),
    );
  }
}
