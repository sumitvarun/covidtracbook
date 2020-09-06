
import 'package:covidtracbook/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:covidtracbook/starting_page.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/images/playstore.png',height: 280,),
              Text('Covidtracbook',style: TextStyle(fontSize: 32,color: Colors.deepOrangeAccent), ),
              SizedBox(height: 50),
              _signInButton(),
              SizedBox(height: 20),
              _facebookSignINButton(),

            ],
          ),
        ),
      ),
    );
  }
  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return StartingPage();
              },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage('lib/images/google_logo.png'),height: 35.0,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

Widget _facebookSignINButton() {
  return OutlineButton(
    splashColor: Colors.grey,
    shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(40)),
    borderSide: BorderSide(color: Colors.grey),
    onPressed: () {  },
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('lib/images/facebook.png',height: 35.0,),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text('Sign in with Facebook',style: TextStyle(fontSize: 20,color: Colors.blue ),),
            ),
          ),
        ],
        
      ),
    ),
  );
}