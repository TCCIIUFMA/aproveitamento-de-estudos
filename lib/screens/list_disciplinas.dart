import 'package:aproveitamento_de_estudos/datas/discipline_data.dart';
import 'package:aproveitamento_de_estudos/tiles/list_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class ListDisciplines extends StatelessWidget {

  final DisciplineData data;
  ListDisciplines(this.data);

  @override

  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Disciplinas aproveitáveis",
            style: TextStyle(
              color: Colors.white,
            ),),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance.collection("disciplinas").document(data.id)
                .collection("equivalente").getDocuments(),
            builder: (context, snapshot){
              if(!snapshot.hasData)
                return Center(child: CircularProgressIndicator(),);
              else
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder:(context,index){
                    DisciplineData data = DisciplineData.fromDocument(snapshot.data.documents[index]);
                    data.category = this.data.id;
                    return ListTiles(data);
                  },);




            }
        )




      /* ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int i){
            return Container(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          child: Text("Código da disciplina",
                            textAlign: TextAlign.right,
                            textScaleFactor: 1.0,
                            style: TextStyle(color: Colors.black),),
                          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0)),
                      Padding(
                          child: Text("Cálculo Diferencial I",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                            textScaleFactor: 1.0,),
                          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0)),
                      SizedBox(
                        height: 10.0,
                      ),
                      ButtonTheme.bar(
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                                child: Text("8 comentários"),
                                onPressed: (){} ),
                            Icon(Icons.favorite, color: Color.fromARGB(255, 44, 207, 131),),
                            Text("   5   "),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 0.0)
            );
          }), */
    );
  }
}

/*
class ListDisciplines extends StatefulWidget {

  @override
  _ListDisciplinesState createState() => _ListDisciplinesState();
}


class _ListDisciplinesState extends State<ListDisciplines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Disciplinas aproveitáveis",
        style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("disciplinas").document()
          .collection("equivalente").getDocuments(),
          builder: (context, snapshot){
            if(!snapshot.hasData)
              return Center(child: CircularProgressIndicator(),);
            else
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder:(context,index){
                    return ListTiles(DisciplineData.fromDocument(snapshot.data.documents[index]));
                  },);




          }
      )




      /* ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int i){
            return Container(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          child: Text("Código da disciplina",
                            textAlign: TextAlign.right,
                            textScaleFactor: 1.0,
                            style: TextStyle(color: Colors.black),),
                          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0)),
                      Padding(
                          child: Text("Cálculo Diferencial I",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                            textScaleFactor: 1.0,),
                          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0)),
                      SizedBox(
                        height: 10.0,
                      ),
                      ButtonTheme.bar(
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                                child: Text("8 comentários"),
                                onPressed: (){} ),
                            Icon(Icons.favorite, color: Color.fromARGB(255, 44, 207, 131),),
                            Text("   5   "),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 0.0)
            );
          }), */
    );
  }
}
*/