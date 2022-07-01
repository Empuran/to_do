import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/home.dart';
import 'package:to_do/newTask.dart';
import 'package:to_do/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: myHomePage(),
    );
  }
}

class myHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Home();
  }
}

class Home extends State<myHomePage> {
  int _current = 0;

  Widget body = HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: body,
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
              height: kBottomNavigationBarHeight,
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: BottomNavigationBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  unselectedIconTheme:
                      const IconThemeData(color: Colors.grey, size: 24),
                  selectedIconTheme:
                      const IconThemeData(color: Colors.pink, size: 24),
                  selectedLabelStyle: GoogleFonts.acme(
                      fontWeight: FontWeight.bold, color: Colors.pink),
                  unselectedLabelStyle: GoogleFonts.acme(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                  selectedItemColor: Colors.pink,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.dashboard_rounded), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.task), label: "Tasks"),
                  ],
                  currentIndex: _current,
                  onTap: (value) {
                    _current = value;
                    setState(() {
                      body = _current == 0 ? HomePage() : TaskPage();
                    });
                  },
                ),
              ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          onPressed: () {
            Get.defaultDialog(
                title: "",
                backgroundColor: Colors.transparent,
                content: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                              Get.to(NewTask());
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: MediaQuery.of(context).size.width / 3,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  image: DecorationImage(
                                      image: AssetImage("assets/image.jpg"),
                                      fit: BoxFit.cover)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.task,
                                          color: Colors.white, size: 30),
                                      Text("New Task",
                                          style: GoogleFonts.acme(
                                              fontSize: 20,
                                              color: Colors.white60)),
                                    ]),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                              Get.to(NewTask());
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: MediaQuery.of(context).size.width / 3,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  image: DecorationImage(
                                      image: AssetImage("assets/image.jpg"),
                                      fit: BoxFit.cover)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.group,
                                          color: Colors.white, size: 30),
                                      Text("New Group",
                                          style: GoogleFonts.acme(
                                              fontSize: 20,
                                              color: Colors.white60)),
                                    ]),
                              ),
                            ),
                          )
                        ])));
          },
          child: const Icon(Icons.add_task)),
    );
  }
}
