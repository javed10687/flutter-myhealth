import 'package:flutter/material.dart';
import 'package:myhealth/models/test_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Health Check',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text("My Health Check",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    color: Colors.orange)),
          ),
          leading: Icon(
            Icons.menu,
            size: 30,
            color: Colors.orange,
          ),
          actions: <Widget>[
            Icon(
              Icons.search,
              size: 30,
              color: Colors.orange,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: screen.width,
                height: screen.height * 0.3,
                color: Colors.orange,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: screen.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "LABS",
                    style: TextStyle(fontSize: 20, letterSpacing: 1),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Container(
                height: 200,
                child: GridView.count(
                  crossAxisCount: 1,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(0.0),
                  children: _buildGridCards(context),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: screen.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Popular packages",
                    style: TextStyle(fontSize: 20, letterSpacing: 1),
                  ),
                ),
              ),
              Container(
                child: GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  crossAxisCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  // scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(0.0),
                  children: _packages(context),
                ),
              ),
            ],
          ),
        ));
  }
}

List<Container> _buildGridCards(BuildContext context) {
  return labs.map((lab) {
    return Container(
      height: 500,
      child: Card(
        // color: Colors.red[200],
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.orange,
        elevation: 4.0,
        margin: EdgeInsets.all(8),
        clipBehavior: Clip.none,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                child: AspectRatio(
                  aspectRatio: 16.0 / 5.0,
                  child: Image.network(
                    lab['logo_img'],
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Explore Packages",
                        style: TextStyle(fontSize: 10),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }).toList();
}

List<Container> _packages(BuildContext context) {
  List tmp = List(9);
  return tmp.map((index) {
    return Container(
      child: Card(
        // color: Colors.red[200],
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.orange,
        elevation: 4.0,
        margin: EdgeInsets.all(8),
        clipBehavior: Clip.none,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                    aspectRatio: 11.0 / 7.0, child: Icon(Icons.pan_tool)),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, left: 10, right: 5),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Rs 1200",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough, fontSize: 10),
                      maxLines: 1,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Rs 900",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                      maxLines: 1,
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }).toList();
}
