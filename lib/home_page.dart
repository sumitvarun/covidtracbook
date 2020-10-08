import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:covidtracbook/datasource.dart';
import 'package:covidtracbook/panels/worldwidepanel.dart';
import 'package:covidtracbook/question.dart';
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
                FlatButton(
                  color: Colors.grey[400],
                  padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>questionAnswer()));
                    }, child: Text('Help',style: TextStyle(color:Colors.grey[900],fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),

          worldData==null?CircularProgressIndicator(backgroundColor: Colors.redAccent[400],):WorldWidePanel(worldData: worldData,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text('Daily Updates', style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold),),
          ),

          SizedBox(
            height: 154.0,
            child: Carousel(
              images: [
                AssetImage("lib/assets/covid_2.jpg"),
                AssetImage("lib/assets/people_covid.jpg"),
                AssetImage("lib/assets/Tips Mencegah Virus Covid-19.jpg"),
                AssetImage("lib/assets/covid_2.jpg"),

              ],
            ),
          )


        ],
      ),
      ),
    );
  }
}
