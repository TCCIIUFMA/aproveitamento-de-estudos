
import 'package:aproveitamento_de_estudos/datas/discipline_data.dart';
import 'package:aproveitamento_de_estudos/screens/ementa_disciplina.dart';
import 'package:aproveitamento_de_estudos/screens/list_disciplinas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeDescription extends StatelessWidget {

  final DisciplineData data;
  HomeDescription(this.data);

  @override
  Widget build(BuildContext context) {
    final bottomContent = FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("disciplinas").getDocuments(),
      builder: (context, snapshot){
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: EdgeInsets.all(40.0),
            child: Center(
              child: Column(
                children: <Widget>[Text(
                  data.content,
                  style: TextStyle(fontSize: 18.0),),
                  SizedBox(height: 20.0,),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ListDisciplines(data))
                          );
                        },
                        color: Color.fromRGBO(58, 66, 86, 1.0),
                        child: Text("Disciplinas que são aproveitadas",
                            style: TextStyle(
                                color: Colors.white)),
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.0),
                      child: RaisedButton(
                        onPressed: () {Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EmentaDisciplina(data))
                        );
                        },
                        color: Color.fromRGBO(58, 66, 86, 1.0),
                        child: Text("Ementa da disciplina",
                            style: TextStyle(
                                color: Colors.white)),
                      ))],
              ),
            ),
          );
          }
        }
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.40,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: NetworkImage(data.image),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.40,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: Column(

              children: <Widget>[
                SizedBox(height: 40.0),

                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38.0,),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        flex: 6,
                        child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              data.code,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ))),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 10.0,
          top: 40.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );




    return Scaffold(
      body: ListView(
        children: <Widget>[
          topContent, bottomContent
        ],
      ),
    );


  }
}


