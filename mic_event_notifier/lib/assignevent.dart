import 'package:flutter/material.dart';
import 'package:mic_event_notifier/HomeScreen.dart';
class AssignEvent extends StatefulWidget {
  const AssignEvent({Key? key}) : super(key: key);

  @override
  State<AssignEvent> createState() => _AssignEventState();
}

class _AssignEventState extends State<AssignEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BackButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen()),
                    );
                  }),
            Text('Assign Event'),

          ],
        ),
      ),
    );
  }
}
