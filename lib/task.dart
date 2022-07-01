import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TaskScreen();
  }
}

class TaskScreen extends State<TaskPage> {
  var _current = 0;
  List<Map<String, dynamic>> list = [
    {"name": "Done", "image": "assets/done.jpg"},
    {"name": "Ongoing", "image": "assets/ongoing.jpg"},
    {"name": "Pending", "image": "assets/pending.jpg"},
    {"name": "Open", "image": "assets/open.jpg"}
  ];

  @override
  Widget build(BuildContext context) {
    double selectedSize = MediaQuery.of(context).size.width / 2.5;
    double unSelectedSize = MediaQuery.of(context).size.width / 4;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text("Task",
                    style: GoogleFonts.acme(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 10),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: kBottomNavigationBarHeight,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 2);
                      },
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _current = index;
                            setState(() {});
                          },
                          child: Container(
                              width: _current == index
                                  ? selectedSize
                                  : unSelectedSize,
                              height: kBottomNavigationBarHeight / 2,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  image: _current == index
                                      ? DecorationImage(
                                          image:
                                              AssetImage(list[index]['image']),
                                          fit: BoxFit.cover)
                                      : null),
                              child: Center(
                                  child: Text(list[index]['name'],
                                      style: GoogleFonts.acme(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )))),
                        );
                      },
                    )),
                const SizedBox(height: 10),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            height: MediaQuery.of(context).size.width / 5,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    image: AssetImage(list[_current]['image']),
                                    fit: BoxFit.cover)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Task $index",
                                        style: GoogleFonts.acme(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    Text("10 tasks",
                                        style: GoogleFonts.acme(
                                          fontSize: 14,
                                          color: Colors.white60,
                                        )),
                                  ]),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 5);
                        },
                        itemCount: 10),
                  ),
                ),
              ])),
    );
  }
}
