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
        body: Container(
          color: Colors.grey[900],
          child: ListView.builder(
                itemCount:  List(8).length,
              itemBuilder: (context,index){
            return ExpansionTile(title: Text(DataSource.questionAnswer[index]["question"],style: TextStyle(color: Colors.grey[100]),),children: [
              Text(DataSource.questionAnswer[index]['answer'],style: TextStyle(color: Colors.white70),)
            ],);
          }),
        )
      ),
    );
  }
}