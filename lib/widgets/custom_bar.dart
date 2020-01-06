
import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardDecoration = new Container(
      height: 124.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: new Color.fromARGB(255, 240, 200, 255),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    final imageBase = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: new Image.asset('images/calculo1.jpg'),
      height: 92.0,
      width: 92.0,
    );

    return Container(
      height: 120.0,
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,),
      child: new Stack(
        children: <Widget>[
          cardDecoration,
          imageBase,
        ],
      ),
    );

  }
}
