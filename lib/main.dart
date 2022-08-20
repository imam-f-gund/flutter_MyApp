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
  TextEditingController controller = TextEditingController(text: '');
  PageController controllers =
      PageController(initialPage: 0, viewportFraction: 0.5);
  List<String> urls = [
    'images/a.jpg',
    'images/a.jpg',
    'https://static.dw.com/image/61514146_605.jpg'
  ];

  List<Widget> widgets = [];

  // tess() {
  //   var arrContents = [
  //     "one",
  //     "https://static.dw.com/image/61514146_605.jpg",
  //     "three",
  //     "https://static.dw.com/image/61514146_605.jpg"
  //   ];
  //   for (var i = 0; i < arrContents.length; i++) {
  //     Container(
  //       child: FittedBox(
  //         fit: BoxFit.fill,
  //         child: Image.network(arrContents[i++]),
  //       ),
  //       height: 150,
  //       width: 150,
  //     );
  //     Text('Title ' + [i++].toString());
  //   }
  // }

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
                      child: Card(
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                            filled: true,
                            contentPadding: EdgeInsets.only(
                                bottom: 10.0, left: 10.0, right: 10.0),
                            labelText: 'Search',
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
                          controller: controller,
                        ),
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
                      flex: 3,
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
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.network(
                                            'https://static.dw.com/image/61514146_605.jpg'),
                                      ),
                                      height: 150,
                                      width: 150,
                                    ),
                                    Text('Title 1'),
                                  ],
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainPage(
                                                title: 'title2',
                                                desc: 'desc2',
                                              )));
                                },
                                child: Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.network(
                                            'data:image/jpeg;base64,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'),
                                      ),
                                      height: 150,
                                      width: 150,
                                    ),
                                    Text('Title 2'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.network(
                                            'https://static.dw.com/image/61514146_605.jpg'),
                                      ),
                                      height: 150,
                                      width: 150,
                                    ),
                                    Text('Title 1'),
                                  ],
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainPage(
                                                title: 'title2',
                                                desc: 'desc2',
                                              )));
                                },
                                child: Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.network(
                                            'data:image/jpeg;base64,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'),
                                      ),
                                      height: 150,
                                      width: 150,
                                    ),
                                    Text('Title 2'),
                                  ],
                                ),
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
