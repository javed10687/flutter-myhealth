import "package:flutter/material.dart";
import 'package:myhealth/main.dart';
import 'package:myhealth/models/test_data.dart';

class Labs extends StatelessWidget{
  final LabsDetails logo;
  Labs({Key key, @required this.logo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeColor(context),
      home: Scaffold(
        body: Container(
          child: Center(
              child: Image.network(logo.logo_img)
          ),
        ),
      ),
    );
  }
}