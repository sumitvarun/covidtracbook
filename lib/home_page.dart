import 'dart:convert';

import 'package:covidtracbook/datasource.dart';
import 'package:covidtracbook/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Map worldData;
  fetchWorldWideData()async{
    http.Response response = await http.get('https://disease.sh/v3/covid-19/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }
  @override
  void initState() {
    fetchWorldWideData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CovidTracBook',),
      ),
      body: SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Container(
            height: 50,
            alignment:  Alignment.center,
            padding: EdgeInsets.all(10.0),
            color: Colors.orangeAccent,
            child: Text(DataSource.quote,style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold,fontSize: 12),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5.0),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Worldwide', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                Container(
                  padding: EdgeInsets.all(10.0),
                    alignment: Alignment.topRight,
                    decoration: BoxDecoration(
                      color: primaryBlack,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Text('Regional', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,),)),
              ],
            ),
          ),

          worldData==null?CircularProgressIndicator():WorldWidePanel(worldData: worldData,),
        ],
      ),
      ),
    );
  }
}
