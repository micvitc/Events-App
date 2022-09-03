import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController emailAddress = TextEditingController();
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
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 180, right: 35),
              child: Text(
                'VITCC Events',
                style: GoogleFonts.nunito(
                  color: Color.fromARGB(255, 255, 255, 255),
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
                  color: Color.fromARGB(255, 255, 255, 255),
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.70,
                      left: 35,
                      right: 35),
                  child: Column(
                    children: [
                      TextField(
                          controller: emailAddress,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Enter your VIT Email here",
                              hoverColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ))),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary:
                                    const Color.fromARGB(255, 0, 208, 255)),
                            onPressed: () {
                              var email = emailAddress.text;
                              if (email.endsWith("@vitstudent.ac.in") == true) {
                                print("Access to VIT Events");
                              } else if (email.endsWith("@adminac.in") ==
                                  true) {
                                print("Access to Admin Events");
                              } else {
                                print("No Access to VIT Events");
                              }
                            },
                            child: IconButton(
                              onPressed: () {
                                var email = emailAddress.text;
                                if (email.endsWith("@vitstudent.ac.in") ==
                                    true) {
                                  print("Access to VIT Events");
                                } else if (email.endsWith("@adminac.in") ==
                                    true) {
                                  print("Access to Admin Events");
                                } else {
                                  print("No Access to VIT Events");
                                }
                              },
                              icon: const Icon(Icons.arrow_forward),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                    "Facing problems ? Contact Us",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 18,
                                        color: Colors.white))),
                          ]),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
