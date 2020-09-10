import 'package:covidtracbook/datasource.dart';
import 'package:flutter/material.dart';

void main() => runApp(questionAnswer());

// ignore: camel_case_types
class questionAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covidtracbook',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[700],
          title: Text('Covidtracbook'),
        ),
        body: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
          Container(
            height: 50,
            alignment:  Alignment.center,
            padding: EdgeInsets.all(10.0),
            color: Colors.orangeAccent,
            child: Text(DataSource.quote,style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold,fontSize: 12),),
          ),
        ],),)
      ),
    );
  }
}