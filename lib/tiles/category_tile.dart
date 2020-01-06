
import 'package:aproveitamento_de_estudos/datas/discipline_data.dart';
import 'package:aproveitamento_de_estudos/screens/home_description.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {

  final DisciplineData data;
  CategoryTile(this.data);

  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: (){Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomeDescription(data)));},
            child: Card(
              elevation: 5.0,
              margin: EdgeInsets.only(bottom: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(aspectRatio: 1.625,
                    child: Image.network(
                      data.image,
                      fit: BoxFit.cover,),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0, top: 8.0, bottom: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(data.title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22),),
                          Text(
                            data.code,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
  }

