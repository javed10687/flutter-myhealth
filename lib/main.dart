import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealth/models/test_data.dart';
import 'package:myhealth/labs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Health Check',
      debugShowCheckedModeBanner: false,
      theme: themeColor(context),
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
      child: Card(
        // color: Colors.red[200],
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.orange,
        elevation: 4.0,
        margin: EdgeInsets.all(8),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.deepOrangeAccent,
          highlightColor: Colors.orange,
          child : Column(
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
          onTap: (){
            _pageRoute(context, lab);
          },
      ),
      )
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
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.deepOrangeAccent,
          highlightColor: Colors.orange,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                    aspectRatio: 11.0 / 6.5, child: Icon(Icons.pan_tool)),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, left: 15, right: 5),
                child: Row(
                  children: <Widget>[
                    Text(
                      "\u20B91200",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough, fontSize: 11),
                      maxLines: 1,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "\u20B9900",
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
          onTap: (){
          },
      ),
      ),
    );
  }).toList();
}

ThemeData themeColor(BuildContext context){
  return ThemeData(
    primarySwatch: Colors.blue,
  );
}

void _pageRoute(BuildContext context, lab){
  Navigator.of(context).push(
    CupertinoPageRoute(
      builder: (context) => (Labs(logo: new LabsDetails(lab['name'], lab['logo_img']))),
    ),
  );
}
