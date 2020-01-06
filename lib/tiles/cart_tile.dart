import 'package:aproveitamento_de_estudos/datas/discipline_data.dart';
import 'package:aproveitamento_de_estudos/datas/ementa_data.dart';
import 'package:aproveitamento_de_estudos/models/ementa_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  final EmentaData ementaData;
  CardTile(this.ementaData);

  @override
  Widget build(BuildContext context) {

    Widget _buildContent(){
      return Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: LimitedBox(
                  maxHeight: 48,
                  child: Row(
                    children: [
                      SizedBox(width: 24),
                      Expanded(
                        child: Text(ementaData.disciplineData.title),
                      ),
                      SizedBox(width: 24),
                      FlatButton(
                        onPressed: (){
                          EmentaModel.of(context).removeEmentaItem(ementaData);
                        },
                        child: Text("Remover", style: TextStyle(color: Colors.white),),
                        color: Colors.greenAccent,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
      );
    }


    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0 , vertical: 4.0),
      child: ementaData.disciplineData == null ?
      FutureBuilder<DocumentSnapshot>(
        future: Firestore.instance.collection("disciplinas").document(ementaData.category)
            .collection("ementa").document(ementaData.eid).get(),
        builder: (context,snapshot){
          if (snapshot.hasData){
            ementaData.disciplineData = DisciplineData.fromDocument(snapshot.data);
            return _buildContent();
          } else{
            return Container(
              height: 70.0,
              child: CircularProgressIndicator(),
              alignment: Alignment.center,
            );
          }
        },
      ) :
          _buildContent()
    );
  }
}
