import 'package:Login_ui/HomeScreen.dart';
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
                          controller: username,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            icon:  Icon(
                              Icons.outgoing_mail,
                              color:Color.fromARGB(222, 222, 123, 222),
                              size: MediaQuery.of(context).size.width*0.1,
                            ),
                             // alignLabelWithHint: true,
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "    Enter username here",
                              hoverColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12),
                              )
                          )
                      ),
                     SizedBox(
                        height: MediaQuery.of(context).size.height*0.02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(

                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                  primary:
                                      const Color.fromARGB(222, 222, 123, 222)),
                              onPressed: () {
                              },
                              child: Stack(
                                children:[
                                TextButton(
                                  child: Text(
                                    'Sign In',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 28,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreen()),
                                    );
                                  },
                                ),
                              /*    Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.g_mobiledata_rounded,
                                    color: Colors.white,
                                      size: 32,
                                    ),
                                  )*/
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
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
