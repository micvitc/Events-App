import 'package:Login_ui/screens/HomeScreen.dart';
import 'package:Login_ui/utils/authentication.dart';
import 'package:Login_ui/widgets/google_sign_in_button.dart';
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
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 35, top: 180, right: 35),
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
                Container(
                  padding: const EdgeInsets.only(left: 40, top: 240, right: 35),
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
            const SizedBox(
              height: 190,
            ),
            FutureBuilder(
              future: Authentication.initializeFirebase(context: context),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error initializing Firebase');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return GoogleSignInButton();
                }
                return const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.black,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
