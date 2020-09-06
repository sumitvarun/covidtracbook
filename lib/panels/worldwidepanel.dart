import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {

  final Map worldData;

  const WorldWidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
        children: <Widget>[
          Statuspanel(
            title: 'Confirmed',
            panelColor: Colors.white,
            textColor: Colors.red[900],
            borderColor: Colors.redAccent[400],
            count: worldData['cases'].toString(),
          ),
          Statuspanel(
            title: 'Active',
            panelColor: Colors.white,
            textColor: Color(0xff1b5e20),
            borderColor: Color(0xff33691e),
            count: worldData['active'].toString(),
          ),
          Statuspanel(
            title: 'Recovered',
            panelColor: Colors.white,
            textColor: Color(0xff283593),
            borderColor: Color(0xff2962ff),
            count: worldData['recovered'].toString(),
          ),
          Statuspanel(
            title: 'Affected Countries',
            panelColor: Colors.white,
            textColor: Colors.amber[900],
            borderColor: Colors.amber[700],
            count: worldData['affectedCountries'].toString(),
          ),
          Statuspanel(
            title: 'Tests',
            panelColor: Colors.white,
            textColor: Colors.pink,
            borderColor: Colors.pinkAccent,
            count: worldData['tests'].toString(),
          ),
          Statuspanel(
            title: 'Deaths',
            panelColor: Colors.white,
            textColor: Colors.blueGrey[800],
            borderColor: Colors.brown[600],
            count: worldData['deaths'].toString(),
          ),
          Container(
            color: Colors.red[700],
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => _builder(index),

            ),
          ),
        ],
      ),
    );
  }

  _builder(int index) {
    return Card();
  }
}

class Statuspanel extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;
  final Color borderColor;

  const Statuspanel({Key key, this.panelColor, this.textColor, this.title, this.count,this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: panelColor,
        border: Border.all(
          color: borderColor,
          width: 3,
        ),
        borderRadius: BorderRadius.only(topRight: Radius.circular(60.0),bottomLeft: Radius.circular(15.0),topLeft: Radius.circular(15.0),bottomRight: Radius.circular(15.0)),
      ),
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(12.0),
      height: 80,


      child: Column(
        children: <Widget>[
          Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize:16,color: textColor),),Text(count,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.blueAccent[700],
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Center(
        child: Text(
          'Card',
              style: TextStyle(
            color: Colors.white,
          fontSize: 20,
        ),
        ),
      ),
    );
  }
}
