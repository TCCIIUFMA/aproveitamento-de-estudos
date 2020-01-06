import 'package:aproveitamento_de_estudos/datas/discipline_data.dart';
import 'package:flutter/material.dart';

class ListTiles extends StatelessWidget {


  final DisciplineData data;
  ListTiles(this.data);


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  child: Text(data.code,
                    textAlign: TextAlign.right,
                    textScaleFactor: 1.0,
                    style: TextStyle(color: Colors.black, fontSize: 16.0),),
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0)),
              Padding(
                  child: Text(data.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                    textScaleFactor: 1.0,),
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0)),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                  child: Text(data.college,
                    style: TextStyle(

                      fontSize: 14.0,
                    ),
                    textScaleFactor: 1.0,),
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0)),

              Padding(
                  child: Text(data.curse,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                    textScaleFactor: 1.0,),
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0)),
            ],
          ),
        ),
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 0.0)
    );
  }
}
