
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'home_page.dart';

void main() => runApp(StartingPage());

class StartingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Circular',
        primaryColor:   Colors.black,

      ),
      home: Scaffold(
        //backgroundColor: Colors.grey[700],
        body: Container(
          padding: EdgeInsets.all(45.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Image.asset('lib/images/corona.png',height: 200,),



                SizedBox(height: 150,),
                OutlineButton(
                  borderSide: BorderSide(color: Colors.grey[400], width: 0.4),
                  padding: EdgeInsets.only(left: 22.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0),),
                  child: Row(
                    children: <Widget>[
                      Image.asset('lib/images/home.png',height: 40,),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'ENTER TO HOME',style: TextStyle(color: Colors.grey[900], fontSize: 20.0,
                        ),
                        ),
                      ),
                    ],
                  ),

                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                },
                ),
                SizedBox(height: 20,),
                Container(
                  height: 100,
                  color: Colors.grey[700],
                  child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (context ,index)  => _builder(index),
                  ),
                ),

              ],
            ),
          ),
      ),
    );
  }

  _builder(int index) {
    return CardSlider();
  }
}

class CardSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),

      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Confirmed Case',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          Text(
            '123',
            style: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ],
      )
    );
  }
}


