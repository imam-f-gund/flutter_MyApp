// @dart=2.9
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ui/pages/main_page.dart';
import 'ui/wigets/moviebox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController(text: 'Seacrh..');
  PageController controllers =
      PageController(initialPage: 0, viewportFraction: 0.5);
  List<String> urls = [];
  Random random = Random();
  List<Widget> widgets = [];

  @override
  Widget build(BuildContext context) {
    TabBar myTabBar = TabBar(
      indicator: BoxDecoration(
          color: Color.fromARGB(155, 75, 88, 229),
          border: Border(top: BorderSide(color: Colors.blueGrey, width: 5))),
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.comment),
          text: "Tab 1",
        ),
        Tab(
          icon: Icon(Icons.computer),
          text: "Tab 2",
        ),
        Tab(
          text: "Tab 3",
        ),
      ],
    );

    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.adb,
              color: Color.fromARGB(255, 5, 61, 191),
            ),
            title: Text(
              'Catalog Furnitur',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app))
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 186, 237, 21),
                      Color.fromARGB(255, 228, 118, 15)
                    ],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight),
              ),
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(myTabBar.preferredSize.height),
                child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(175, 106, 18, 164),
                            Color.fromARGB(255, 167, 9, 51)
                          ],
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight),
                    ),
                    child: myTabBar)),
          ),
          body: TabBarView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: controller,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: PageView.builder(
                          controller: controllers,
                          itemCount: urls.length,
                          itemBuilder: ((context, index) => Container(
                                child: MovieBox(urls[index]),
                              ))),
                    ),
                  ),
                  Flexible(
                      flex: 5,
                      child: ListView(children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Builder(
                              builder: (context) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainPage(
                                                title: 'title1',
                                                desc: 'desc1',
                                              )));
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Container(
                                      color: Color.fromARGB(255, 7, 168, 255),
                                      width: 120,
                                      height: 120),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  // DetailPage adalah halaman yang dituju
                                  MaterialPageRoute(
                                      builder: (context) => MainPage(
                                            title: 'title2',
                                            desc: 'desc1',
                                          )),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                    color: Color.fromARGB(255, 164, 7, 255),
                                    width: 120,
                                    height: 120),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  // DetailPage adalah halaman yang dituju
                                  MaterialPageRoute(
                                      builder: (context) => MainPage(
                                            title: 'title3',
                                            desc: 'desc1',
                                          )),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                    color: Color.fromARGB(255, 255, 7, 7),
                                    width: 120,
                                    height: 120),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  // DetailPage adalah halaman yang dituju
                                  MaterialPageRoute(
                                      builder: (context) => MainPage(
                                            title: 'title4',
                                            desc: 'desc1',
                                          )),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                    color: Colors.amber,
                                    width: 120,
                                    height: 120),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                //navigator.push adalah fungsi di flutter untuk berpindah halaman
                                Navigator.push(
                                  context,
                                  // DetailPage adalah halaman yang dituju
                                  MaterialPageRoute(
                                      builder: (context) => MainPage(
                                            title: 'title5',
                                            desc: 'desc1',
                                          )),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                    color: Color.fromARGB(255, 7, 168, 255),
                                    width: 120,
                                    height: 120),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {});
                                Navigator.push(
                                  context,
                                  // DetailPage adalah halaman yang dituju
                                  MaterialPageRoute(
                                      builder: (context) => MainPage(
                                            title: 'title6',
                                            desc: 'desc1',
                                          )),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                    color: Color.fromARGB(255, 164, 7, 255),
                                    width: 120,
                                    height: 120),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  // DetailPage adalah halaman yang dituju
                                  MaterialPageRoute(
                                      builder: (context) => MainPage(
                                            title: 'title7',
                                            desc: 'desc1',
                                          )),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                    color: Color.fromARGB(255, 255, 7, 7),
                                    width: 120,
                                    height: 120),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  // DetailPage adalah halaman yang dituju
                                  MaterialPageRoute(
                                      builder: (context) => MainPage(
                                            title: 'title8',
                                            desc: 'desc1',
                                          )),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                    color: Colors.amber,
                                    width: 120,
                                    height: 120),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widgets,
                        )
                      ])),
                ],
              ),
              Center(
                child: Text(controller.text),
              ),
              Column(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.amber,
                      )),
                  Flexible(
                      flex: 1,
                      child: Container(
                        color: Color.fromARGB(255, 32, 255, 7),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
