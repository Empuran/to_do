import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewTaskScreen();
  }
}

class NewTaskScreen extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Text("Category",
                    style: GoogleFonts.acme(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 10),
              ])),
    );
  }
}
