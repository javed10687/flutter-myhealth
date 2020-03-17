import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            color: Colors.red,
          ),
          Container(height: 200, color: Colors.white),
          Container(height: 200, color: Colors.green),
          Container(height: 200, color: Colors.yellow),
          Container(height: 200, color: Colors.white),
          Container(height: 200, color: Colors.green),
          Container(height: 200, color: Colors.yellow),
        ],
      ),
    );
  }
}
