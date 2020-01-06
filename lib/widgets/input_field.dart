import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String hint2;
  final bool obscure;

  InputField({this.icon, this.hint, this.hint2, this.obscure});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Text(hint, style: TextStyle(color: Colors.grey, fontSize: 16.0),),
        ),


          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,),
              borderRadius: BorderRadius.circular(20.0),),
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                new Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(icon, color: Colors.grey,),),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                  margin: const EdgeInsets.only(left: 00.0, right: 10.0),
              ),
                new Expanded(
                  child: TextFormField(
                    obscureText: obscure,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint2,
                      hintStyle: TextStyle(color: Colors.grey),
                  ), 
                ),
              ),
            ],
          ),
        ),
      ],)
    );



    /*
    return Container(
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 15.0),
                  child: new Text(hint,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 15.0,),),),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.redAccent,
                    width: 0.5,
                    style: BorderStyle.solid),),),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: TextField(
                    textAlign: TextAlign.left,
                    obscureText: obscure,
                    decoration: InputDecoration(
                      border: InputBorder.none,),),),
              ],
            ),
          ),
        ],
      )
    ); */
  }
}
