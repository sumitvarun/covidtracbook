
import 'package:covidtracbook/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Circular',
        primaryColor:   Colors.grey[700],

      ),
      title: 'Covidtracbook',
      home:   LoginPage(),

    );
  }
}
