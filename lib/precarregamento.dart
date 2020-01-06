import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void navigationToNextPage () {
    Navigator.pushReplacementNamed(context, '/Login');
  }

  startSplashScreenTimer() async{
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationToNextPage);
  }
  @override

  void initState(){
    super.initState();
    startSplashScreenTimer();
  }
  @override

  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/fundo.jpg",
          fit: BoxFit.cover,
          height: 1000.0,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,



          children: <Widget>[
            Image.asset(
                "images/logobict.png",

                height: 150.0),


            Image.asset(
              "images/logoufma.png",

              height: 150.0,),









          ],


        )



      ],
    );

  }
}
