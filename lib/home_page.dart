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
                  color: Colors.grey[800],
                  padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>questionAnswer()));
                    }, child: Text('Help',style: TextStyle(color:Colors.grey[300], fontFamily: 'Circular',fontWeight: FontWeight.w600),),
                ),
              ],
            ),
          ),

          worldData==null?CircularProgressIndicator(backgroundColor: Colors.redAccent[400],):WorldWidePanel(worldData: worldData,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(decoration: BoxDecoration(
              color: Colors.yellow[800],border: Border.all(color: Colors.orange[400]),
            ),
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.all(4.0)),
                    Icon(Icons.auto_stories,color: Colors.deepOrange,),
                    Padding(padding: EdgeInsets.all(5.0)),
                    Text('Daily Updates', style: TextStyle( fontSize: 22,color: Colors.black,fontFamily: 'Circular',fontWeight: FontWeight.w400),),

                  ],
                )),
          ),

          SizedBox(
            height: 154.0,
            child: Carousel(
              images: [
                AssetImage("lib/assets/covid1.jpeg"),
                AssetImage("lib/assets/people_covid.jpg"),
                AssetImage("lib/assets/Tips Mencegah Virus Covid-19.jpg"),
                AssetImage("lib/assets/covid_2.jpg"),
                AssetImage("lib/assets/covid3.jpg"),
                AssetImage("lib/assets/covid4.jpg"),
                AssetImage("lib/assets/covid5.jpg"),
                AssetImage("lib/assets/HandSanitizerMask.jpg"),

              ],
            ),
          )


        ],
      ),
      ),
    );
  }
}
