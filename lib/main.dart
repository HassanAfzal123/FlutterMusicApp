import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import './theme.dart';
import 'dart:async';

import './musicplayer.dart';
import './LoginPage.dart';
import './SignUp.dart';


void main() async {
  runApp(
      new MaterialApp(
        home: new SplashScreen(),
        routes: <String, WidgetBuilder>{
          "/musicplayer": (BuildContext context) => new MusicPlayer(),
          "/loginPage": (BuildContext context) => new Login(),
          "/registration": (BuildContext context) => new SignUp(),
        }
      )
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () =>  Navigator.pushReplacementNamed(context, '/loginPage'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.black87),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       Icon(
                          Icons.queue_music,
                          color: Colors.white,
                          size: 100.0,
                        ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                      ),
                      Text(
                        "BCS MUSIC",
                        style: TextStyle(
                            fontFamily: 'Courier New',
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RefreshProgressIndicator(backgroundColor: Colors.white,),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}